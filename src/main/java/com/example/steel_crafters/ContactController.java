package com.example.steel_crafters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.jdbc.core.JdbcTemplate;

@Controller
public class ContactController {
    @Autowired
    JdbcTemplate jdbc;

    @PostMapping("/save_contact")
    public String contactus(Model m, @RequestParam("fname") String fname, @RequestParam("lname") String lname,
            @RequestParam("email") String email, @RequestParam("msg") String msg) {
        String sql = "insert into contact (fname,lname,email,msg)values(?,?,?,?)";
        jdbc.update(sql, fname, lname, email, msg);
        m.addAttribute("msg", "Your message has been sent successfully");

        return "redirect:/contact";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }
}