package com.example.steel_crafters;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@Controller
public class AdminController {
     @Autowired
    private JavaMailSender mailSender;


    @Autowired
    JdbcTemplate jdbc;

    @GetMapping("/admindashboard")
public String dashboard(Model model) {

    // --- Dashboard Stats ---
    Integer totalUsers = jdbc.queryForObject("SELECT COUNT(*) FROM user_master", Integer.class);
    Integer totalProducts = jdbc.queryForObject("SELECT COUNT(*) FROM product_master", Integer.class);
    Integer totalOrders = jdbc.queryForObject("SELECT COUNT(*) FROM save_order", Integer.class);

    model.addAttribute("totalUsers", totalUsers);
    model.addAttribute("totalProducts", totalProducts);
    model.addAttribute("totalOrders", totalOrders);

    // --- Orders by Status ---
    Integer approvedCount = jdbc.queryForObject(
            "SELECT COUNT(*) FROM save_order WHERE status='Approved'", Integer.class);
    Integer rejectedCount = jdbc.queryForObject(
            "SELECT COUNT(*) FROM save_order WHERE status='Cancelled'", Integer.class);

    model.addAttribute("approvedCount", approvedCount);
    model.addAttribute("rejectedCount", rejectedCount);

    // --- Orders by Delivery Status ---
    List<Map<String, Object>> deliveryStats = jdbc.queryForList(
            "SELECT delivery_status, COUNT(*) AS count FROM save_order GROUP BY delivery_status");
    model.addAttribute("deliveryStats", deliveryStats);

    // --- Recent Orders ---
    List<Map<String, Object>> recentOrders = jdbc.queryForList(
            "SELECT order_id, user_id, productsname, order_status, delivery_status " +
            "FROM save_order ORDER BY order_id DESC LIMIT 5");
    model.addAttribute("recentOrders", recentOrders);

    // --- Top Buyers ---
    List<Map<String, Object>> userPurchaseList = jdbc.queryForList(
            "SELECT u.name AS username, COUNT(o.order_id) AS order_count " +
            "FROM save_order o " +
            "JOIN user_master u ON o.user_id = u.user_id " +
            "GROUP BY u.name ORDER BY order_count DESC LIMIT 5");
    model.addAttribute("userPurchaseList", userPurchaseList);

    return "admindashboard";
}



    @GetMapping("/r")
    public String r() {
        return "r";
    }

    // ********************************************************************************************************
    @PostMapping("/manageuser")
    public String manageuser(@RequestParam("user_id") String user_id, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("Delete")) {
            String sql = "delete from user_master where user_id=?";
            jdbc.update(sql, user_id);
            return viewcustomer(model);
        }
        String sql = "select * from user_master where user_id='" + user_id + "'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "editcustomer";
    }

    @PostMapping("/updateuser")
    public String updateuser(@RequestParam("user_id") String user_id, @RequestParam("name") String name,
            @RequestParam("role") String role, @RequestParam("status") String status, Model model) {
        String sql = "update user_master set name=?, role=?, status=? where user_id=?";
        jdbc.update(sql, name, role, status, user_id);
        model.addAttribute(name, sql);
        return viewcustomer(model);
    }

    @GetMapping("/viewcustomer")
    public String viewcustomer(Model m) {
        System.out.println("Contact Page");
        String sql = "select * from user_master where role = 'customer' ";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        m.addAttribute("usermaster", usermaster);
        return "viewcustomer";
    }
    // ******************************************************************************************************
    // */

    @GetMapping("/viewstaff")
    public String viewstaff(Model m) {
        System.out.println("Contact Page");
        String sql = "select * from user_master where role = 'staff' ";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        m.addAttribute("usermaster", usermaster);
        return "viewstaff";
    }

    @PostMapping("/managestaff")
    public String managestaff(@RequestParam("user_id") String user_id, @RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("Delete")) {
            String sql = "delete from user_master where user_id=?";
            jdbc.update(sql, user_id);
            return viewstaff(model);
        }
        String sql = "select * from user_master where user_id='" + user_id + "'";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        model.addAttribute("usermaster", usermaster);
        return "editstaff";
    }

    @PostMapping("/updatestaff")
    public String updateustaff(@RequestParam("user_id") String user_id, @RequestParam("name") String name,
            @RequestParam("role") String role, @RequestParam("status") String status, Model model) {
        String sql = "update user_master name=?, role=?, status=? where user_id=?";
        jdbc.update(sql, name, role, status, user_id);
        model.addAttribute(name, sql);
        return viewstaff(model);
    }

    // *****************************************************************************************************************
    // */
    @GetMapping("/viewcontact")
    public String viewcontact(Model m) {
        System.out.println("Contact Page");
        String sql = "select * from contact";
        List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
        m.addAttribute("usermaster", usermaster);
        return "viewcontact";
    }

    // @PostMapping("/managemsg")
    // public String managemsg(@RequestParam("email") String user_id,
    // @RequestParam("btn") String btn, Model model) {
    // if (btn.equalsIgnoreCase("Delete")) {
    // String sql = "delete from contact where email=?";
    // jdbc.update(sql, email);
    // return viewcontact(model);
    // }
    // String sql = "select * from user_master where user_id='" + user_id + "'";
    // List<Map<String, Object>> usermaster = jdbc.queryForList(sql);
    // model.addAttribute("usermaster", usermaster);
    // return "editstaff";
    // }
    @PostMapping("/updatemsg")
    public String updatemsg(@RequestParam("user_id") String user_id, @RequestParam("name") String name,
            @RequestParam("role") String role, @RequestParam("status") String status, Model model) {
        String sql = "update user_master set name=?, role=?, status=? where user_id=?";
        jdbc.update(sql, name, role, status, user_id);
        model.addAttribute(name, sql);
        return viewstaff(model);
    }

    // ******************************************************************************************************************************************************************************************************
    @GetMapping("/showfaq")
    public String showfaq(Model m) {

        String sql = "select * from faq";
        List<Map<String, Object>> li = jdbc.queryForList(sql);
        m.addAttribute("faqlist", li);
        return "showfaq";
    }



    @GetMapping("/shop")
    public String getProducts(Model model) {
        String sql = "SELECT * FROM product_master";
        List<Map<String, Object>> products = jdbc.queryForList(sql);
        model.addAttribute("products", products);
        System.out.println(products);
        return "shop";
    }

@PostMapping("/updateprod")
public String updateProduct(
        @RequestParam("prodid") String prodid,
        @RequestParam("prodname") String prodname,
        @RequestParam("description") String description,
        @RequestParam("prodrate") String prodrate,
        @RequestParam("prodqty") String prodqty,
        @RequestParam(value = "prodimg", required = false) MultipartFile prodimg,
        Model model) {

    if (prodimg != null && !prodimg.isEmpty()) {
        try {
            byte[] imageBytes = prodimg.getBytes();
            String sql = "UPDATE product_master SET prodname=?, description=?, prodrate=?, prodqty=?, prod_img=? WHERE prodid=?";
            jdbc.update(sql, prodname, description, prodrate, prodqty, imageBytes, prodid);
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        String sql = "UPDATE product_master SET prodname=?, description=?, prodrate=?, prodqty=? WHERE prodid=?";
        jdbc.update(sql, prodname, description, prodrate, prodqty, prodid);
    }

    return allprod(model); // reload updated product list
}




    @PostMapping("/dltprod")
    public String dltprod(@RequestParam("prodid") String prodid, @RequestParam("btn") String btn, Model model) {
        String sql = "delete from product_master where prodid=?";
        jdbc.update(sql, prodid);
        return allprod(model);
    }
    

    // **********************
    @GetMapping("addfaq")
    public String addfaq() {
        return "addfaq";
    }

    @PostMapping("/addfaq")
    public String addfaq(@RequestParam("btn") String btn, Model model) {
        if (btn.equalsIgnoreCase("Add")) {
            return "addfaq";
        }
        return "showfaq";
    }

    @PostMapping("/updatefaq")
    public String updatefaq(@RequestParam("question") String question, @RequestParam("answer") String answer,
            Model model) {
        String sql = "insert into faq(question, answer) values ('" + question + "','" + answer + "')";
        jdbc.execute(sql);
        model.addAttribute("faq", "FAQ Added");
        return "redirect:showfaq";
    }



 

     @GetMapping("/addproduct")
     public String product() {
         return "addproduct";
     }
 
     @GetMapping("/allproduct")
    public String allprod(Model m) {
    String sql = "select * from product_master";
    List<Map<String, Object>> prodmaster = jdbc.queryForList(sql);

    // convert each image blob to Base64 string
    for (Map<String, Object> prod : prodmaster) {
        byte[] imgBytes = (byte[]) prod.get("prod_img");
        if (imgBytes != null) {
            String base64Image = Base64.getEncoder().encodeToString(imgBytes);
            prod.put("base64Image", base64Image); // add extra field to map
        }
    }

    m.addAttribute("prodmaster", prodmaster);
    return "allproduct";
}

     
     
     @PostMapping("/addorder")
     public String saveOrder(@RequestParam("prodid") Integer prodid,
             @RequestParam("prodname") String prodname,
             @RequestParam("description") String description,
             @RequestParam("prodrate") Integer prodrate,
             @RequestParam("prodqty") Integer prodqty,
             @RequestParam("photo") MultipartFile photo,
             Model m) throws IOException, SQLException {
         String sql = "INSERT INTO product_master (prodid, prodname,description,prodrate, prodqty, prod_img) VALUES (?, ?, ?, ?, ?,?)";
         jdbc.update(sql, prodid, prodname, description, prodrate, prodqty, photo.getBytes());
         m.addAttribute("sms", "Product Added Successfully");
         return "/addproduct";
     }

     @GetMapping("/vieworder")
     public String order(Model m) {
         String sql = "select * from save_order";
         List<Map<String, Object>> vieworder = jdbc.queryForList(sql);
         m.addAttribute("vieworder", vieworder);
         return "vieworder";
     }
         // Handle approve/reject
         @PostMapping("/manageorder")
         public String manageOrder(@RequestParam("order_id") int orderId,
                                   @RequestParam("btn") String action) {
     
             String status = action.equals("Approve") ? "Approved" : "Cancelled";
             String sql = "UPDATE save_order SET status = ? WHERE order_id = ?";
             jdbc.update(sql, status, orderId);
     
             return "redirect:/vieworder";
         }
     
@PostMapping("/updatedelivery")
public String updateDeliveryStatus(@RequestParam("order_id") int orderId,
                                   @RequestParam("delivery_status") String deliveryStatus) {

    String sql = "UPDATE save_order SET delivery_status = ? WHERE order_id = ?";
    jdbc.update(sql, deliveryStatus, orderId);

    if ("Delivered".equalsIgnoreCase(deliveryStatus)) {
        String query = "SELECT * FROM save_order WHERE order_id = ?";
        Map<String, Object> order = jdbc.queryForMap(query, orderId);

        try {
            // Fetch product image from `product_master` using one of the product IDs
            String productId = order.get("products").toString().split(",")[0]; // pick first product if multiple
            String imgSql = "SELECT prod_img FROM product_master WHERE prodid = ?";
            byte[] imageBytes = jdbc.queryForObject(imgSql, new Object[]{productId}, byte[].class);

            // Create the PDF file
            String relativePath = "src/main/resources/static/bills/Invoice_Order_" + orderId + ".pdf";
            File billFile = new File(relativePath);
            billFile.getParentFile().mkdirs();

            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(billFile));
            document.open();

            // Title
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, BaseColor.BLUE);
            Paragraph title = new Paragraph("Order Invoice", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);
            document.add(new Paragraph(" "));

            // Product Image
            if (imageBytes != null && imageBytes.length > 0) {
                Image img = Image.getInstance(imageBytes);
                img.scaleToFit(150, 150);
                img.setAlignment(Image.ALIGN_CENTER);
                document.add(img);
                document.add(new Paragraph(" "));
            }

            // Order Table
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(90);
            Font boldFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

            table.addCell(new Phrase("Order ID", boldFont));
            table.addCell(order.get("order_id").toString());

            table.addCell(new Phrase("User ID", boldFont));
            table.addCell(order.get("user_id").toString());

            table.addCell(new Phrase("Products", boldFont));
            table.addCell(order.get("products").toString());

            table.addCell(new Phrase("Product Names", boldFont));
            table.addCell(order.get("productsname").toString());

            table.addCell(new Phrase("Price", boldFont));
            table.addCell("₹" + order.get("price").toString());

            table.addCell(new Phrase("Status", boldFont));
            table.addCell(order.get("status").toString());

            table.addCell(new Phrase("Delivery Status", boldFont));
            table.addCell("Delivered");

            table.addCell(new Phrase("Date", boldFont));
            table.addCell(new java.util.Date().toString());

            document.add(table);
            document.close();

             // ✅ Send Email with all order details
            String userEmail = order.get("user_id").toString(); // Assuming user_id is email

            String emailBody =
                    "Dear Customer,\n\n" +
                    "Your order has been successfully delivered. Here are your order details:\n\n" +
                    "Order ID: " + order.get("order_id") + "\n" +
                    "User: " + order.get("user_id") + "\n" +
                    "Products: " + order.get("products") + "\n" +
                    "Product Names: " + order.get("productsname") + "\n" +
                    "Total Price: ₹" + order.get("price") + "\n" +
                    "Status: " + order.get("status") + "\n" +
                    "Delivery Status: Delivered\n" +
                    "Date: " + new java.util.Date().toString() + "\n\n" +
                    "Thank you for purchasing from Steel Emporium!\n\n" +
                    "Regards,\nSteel Emporium Team";

            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(userEmail);
            message.setSubject("Your Order #" + orderId + " Delivered - Steel Emporium");
            message.setText(emailBody);

            mailSender.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    return "redirect:/vieworder";
}



}
