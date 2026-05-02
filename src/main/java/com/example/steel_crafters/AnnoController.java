package com.example.steel_crafters;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

@Controller
public class AnnoController {
	@Autowired
	JdbcTemplate jdbc;

	@PostMapping("/login")
	public String login_check(@RequestParam("user_id") String user_id, @RequestParam("password") String password,
			Model m, HttpSession session) {
		ArrayList<String> ali = new ArrayList<String>();
		String sql = "select * from user_master where user_id='" + user_id + "' and password='" + password + "' ";
		jdbc.query(sql, new RowMapper<String>() {
			public String mapRow(ResultSet rs, int rowNum) throws SQLException {
				ali.add(rs.getString(1)); // getting the name input and storing in ResultSet
				ali.add(rs.getString(2)); // getting the userid(email) input and storing in ResultSet
				ali.add(rs.getString(3)); // getting the password input and storing in ResultSet
				ali.add(rs.getString(4)); // getting the role input and storing in ResultSet
				ali.add(rs.getString(5)); // getting the status input and storing in ResultSet
				return "";

			}
		});
		if (ali.isEmpty()) {
			m.addAttribute("sms", "Invalid Details");
			return "login";
		} else {
			if ((ali.get(4)).equalsIgnoreCase("1")) {
				session.setAttribute("name", ali.get(0));
				session.setAttribute("user_id", ali.get(1));
				

				if ((ali.get(3)).equalsIgnoreCase("admin")) {
					return "redirect:admindashboard";
				} else if ((ali.get(3)).equalsIgnoreCase("customer")) {
					return "redirect:shop";
				} else if ((ali.get(3)).equalsIgnoreCase("staff")) {
					return "staffdashboard";
				} else {
					m.addAttribute("sms", "some error occured...");
					return "login";
				}
			} else {
				m.addAttribute("sms", "Plz contact admin");
				return "login";
			}

		}
	}

	@GetMapping("/login")
	public static String login() {
		// System.out.println("login get");
		return "login";
	}

	@GetMapping("/signup")
	public static String signup() {
		return "signup";
	}
	
	 @GetMapping("/products")
    public String products(Model model) {
        String sql = "SELECT * FROM product_master";
        List<Map<String, Object>> products = jdbc.queryForList(sql);
        model.addAttribute("products", products);
        System.out.println(products);
        return "products";
    }

	@PostMapping("/signup")
	public String signup_save(Model m, @RequestParam("name") String name, @RequestParam("password") String password,
			@RequestParam("user_id") String user_id, @RequestParam("role") String role) {
		jdbc.execute("insert into user_master(name, user_id, password, role) values ('" + name + "','" + user_id + "','"
				+ password + "','" + role + "')");
		m.addAttribute("sms", "Success");
		return "signup";
	}

	// @PostMapping("/contactus")
	// public String contact_form(Model m, @RequestParam("fname") String fname,
	// @RequestParam("lname") String lname,@RequestParam("email") String email,
	// @RequestParam("message") String message) {jdbc.execute("insert into
	// contact(fname, lname, email, message) values ('" + fname + "','" + lname +
	// "','"+ email + "','" + message + "')");
	// m.addAttribute("sms", "Success");
	// return "contact";
	// }

	// @GetMapping("/contact")
	// public String contact() {
	// return "contact";
	// }

	// @GetMapping("/contactus")
	// public String contactus() {
	// return "contact";
	// }

	@GetMapping("/blog")
	public String blog() {
		return "blog";
	}

	@GetMapping("/about")
	public String about() {
		return "about";
	}

	@GetMapping("/services")
	public String services() {
		return "services";
	}

	@GetMapping("/index")
	public String index() {
		return "index";
	}

	@GetMapping("/logout")
	public String logout() {
		return "login";
	}

	@GetMapping("/faq")
	public String faq(Model m) {
		String sql = "select * from faq";
		List<Map<String, Object>> faq = jdbc.queryForList(sql);
		m.addAttribute("faq", faq);
		return "faq";
	}

	@PostMapping("addtocart")
	public String addtocart(Model m, @RequestParam("prodid") String prodid,
			@RequestParam("prodname") String prodname,
			@RequestParam("prodrate") Integer prodrate, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		System.out.println(user_id);
		String sql = "insert into cart(user_id, prodid,prodname, qty) values(?,?,?,?)";
		jdbc.update(sql, user_id, prodid, prodname, 1);
		return "redirect:shop";
	}

@GetMapping("/cart")
public String cart(Model m, HttpSession session) {
    // ✅ Get user_id from session
    String user_id = (String) session.getAttribute("user_id");

    if (user_id == null) {
        // If user not logged in, redirect to login page
        return "redirect:/login";
    }

    // ✅ Use user_id in your query (filter cart by user)
    String sql = "SELECT *, (qty*prodrate) AS total " +
                 "FROM cart " +
                 "LEFT JOIN product_master ON cart.prodid = product_master.prodid " +
                 "WHERE cart.user_id = ?";

    List<Map<String, Object>> productdetail = jdbc.queryForList(sql, user_id);
    m.addAttribute("product", productdetail);

    System.out.println("Cart details for user: " + user_id);
    System.out.println(productdetail);

    return "cart";
}



	@PostMapping("removefromcart")
	public String removefromcart(Model m, @RequestParam("sl_no") String sl_no) {
		String sql = "delete from cart where sl_no=?";
		jdbc.update(sql, sl_no);
		return "redirect:cart";
	}

@PostMapping("/addone")
public String addOne(@RequestParam("sl_no") int slNo,
                     @RequestParam("prodrate") int prodrate,
                     HttpSession session,
                     RedirectAttributes redirectAttributes) {

    // Get user_id from session
    String user_id = (String) session.getAttribute("user_id");
    if (user_id == null) {
        return "redirect:/login";
    }

    // 1. Get current cart qty for this product
    String sqlCart = "SELECT qty, prodid FROM cart WHERE sl_no=? AND user_id=?";
    Map<String, Object> cartRow = jdbc.queryForMap(sqlCart, slNo, user_id);

    int currentQty = (int) cartRow.get("qty");
    int prodid = (int) cartRow.get("prodid");

    // 2. Get available stock from product_master
    String sqlProd = "SELECT prodqty FROM product_master WHERE prodid=?";
    int availableQty = jdbc.queryForObject(sqlProd, Integer.class, prodid);

    // 3. Validate
    if (currentQty >= availableQty) {
        redirectAttributes.addFlashAttribute("errorMessage", 
                "Please choose less quantity. Only " + availableQty + " available.");
        return "redirect:/cart";  // Redirect with error
    }

    // 4. Otherwise update cart qty
    String sqlUpdate = "UPDATE cart SET qty = qty + 1 WHERE sl_no=? AND user_id=?";
    jdbc.update(sqlUpdate, slNo, user_id);

    return "redirect:/cart";
}


@PostMapping("/removeone")
public String removeOne(@RequestParam("sl_no") int slNo,
                        @RequestParam("prodrate") int prodrate,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {

    String user_id = (String) session.getAttribute("user_id");
    if (user_id == null) {
        return "redirect:/login";
    }

    // 1. Get current qty
    String sqlCart = "SELECT qty FROM cart WHERE sl_no=? AND user_id=?";
    int currentQty = jdbc.queryForObject(sqlCart, Integer.class, slNo, user_id);

    // 2. Validate → prevent going below 1
    if (currentQty <= 1) {
        redirectAttributes.addFlashAttribute("errorMessage",
                "Quantity cannot be less than 1. Please remove item if not needed.");
        return "redirect:/cart";
    }

    // 3. Otherwise decrease by 1
    String sqlUpdate = "UPDATE cart SET qty = qty - 1 WHERE sl_no=? AND user_id=?";
    jdbc.update(sqlUpdate, slNo, user_id);

    return "redirect:/cart";
}


@GetMapping("/checkout")
public String checkout(Model m, HttpSession session) {
    // ✅ Get user_id from session
    String user_id = (String) session.getAttribute("user_id");

    if (user_id == null) {
        // If user not logged in, redirect to login page
        return "redirect:/login";
    }

    // ✅ Fetch product details only for this user
    String sql = "SELECT *, (qty*prodrate) AS total " +
                 "FROM cart " +
                 "LEFT JOIN product_master ON cart.prodid = product_master.prodid " +
                 "WHERE cart.user_id = ?";

    List<Map<String, Object>> productdetail = jdbc.queryForList(sql, user_id);
    m.addAttribute("product", productdetail);

    System.out.println("Checkout details for user: " + user_id);
    System.out.println(productdetail);

    // ✅ Calculate total only for this user
    String sql1 = "SELECT SUM(qty*prodrate) AS total_sum " +
                  "FROM cart " +
                  "LEFT JOIN product_master ON cart.prodid = product_master.prodid " +
                  "WHERE cart.user_id = ?";

    List<Map<String, Object>> total = jdbc.queryForList(sql1, user_id);
    m.addAttribute("total", total);

    return "checkout";
}

	@GetMapping("/shopnow")
	public String shopnow() {
		return "redirect:login";
	}

	@PostMapping("/saveorder")
	public String saveorder(Model m, @RequestParam("total") String total, @RequestParam("user_id") String user_id,
			@RequestParam("products") String products, @RequestParam("productsname") String productsname) {
		String sql = "insert into save_order(user_id, price, products, productsname) values(?,?,?,?)";
		jdbc.update(sql, user_id, total, products, productsname);
		String sql1 = "truncate table cart";
		jdbc.update(sql1);
		return "thankyou";
	}

	@GetMapping("myorder")
	public String myorder(Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("user_id");
		String sql = "select * from save_order where user_id = '"+user_id+"'";
		List<Map<String, Object>> orders = jdbc.queryForList(sql);
		m.addAttribute("orders", orders);
		return "myorder";
	}

	@PostMapping("ordercancel")
	public String ordercancel(Model m, @RequestParam("order_id") String order_id) {
		String sql = "delete from save_order where order_id = ?";
		jdbc.update(sql, order_id);
		return "redirect:myorder";
	}

}
