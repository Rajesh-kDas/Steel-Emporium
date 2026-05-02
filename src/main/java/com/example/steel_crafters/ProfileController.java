package com.example.steel_crafters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
public class ProfileController {

    @Autowired
    private JdbcTemplate jdbc;

    // ✅ Upload folder relative to project root
    private static final String UPLOAD_DIR = System.getProperty("user.dir") + "/uploads/";

    // ✅ View Profile
    @GetMapping("/profile")
    public String viewProfile(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("user_id");
        if (userId == null) {
            return "redirect:/login";
        }

        String sql = "SELECT * FROM user_profile WHERE user_id = ?";
        Map<String, Object> profile = null;
        try {
            profile = jdbc.queryForMap(sql, userId);
        } catch (Exception e) {
            // No profile found yet
        }

        model.addAttribute("profile", profile);
        return "profile"; // profile.jsp
    }

    // ✅ Save / Update Profile
    @PostMapping("/updateProfile")
    public String updateProfile(@RequestParam("address") String address,
                                @RequestParam("age") int age,
                                @RequestParam("phone") String phone,
                                @RequestParam("gender") String gender,
                                @RequestParam("city") String city,
                                @RequestParam("state") String state,
                                @RequestParam("country") String country,
                                @RequestParam(value = "photo", required = false) MultipartFile photo,
                                HttpSession session) throws IOException {

        String userId = (String) session.getAttribute("user_id");
        if (userId == null) {
            return "redirect:/login";
        }

        // ✅ Handle file upload
        String photoPath = null;
        if (photo != null && !photo.isEmpty()) {
            File dir = new File(UPLOAD_DIR);
            if (!dir.exists()) dir.mkdirs();

            // Unique file name
            String fileName = System.currentTimeMillis() + "_" + photo.getOriginalFilename();
            File destination = new File(UPLOAD_DIR + fileName);
            photo.transferTo(destination);

            // Store as relative URL for <img src>
            photoPath = "/uploads/" + fileName;
        }

        // ✅ Check if profile exists
        String checkSql = "SELECT COUNT(*) FROM user_profile WHERE user_id = ?";
        int count = jdbc.queryForObject(checkSql, Integer.class, userId);

        if (count > 0) {
            // Update existing profile
            String updateSql = "UPDATE user_profile SET address=?, age=?, phone=?, gender=?, city=?, state=?, country=?"
                    + (photoPath != null ? ", photo=?" : "") + " WHERE user_id=?";
            if (photoPath != null) {
                jdbc.update(updateSql, address, age, phone, gender, city, state, country, photoPath, userId);
            } else {
                jdbc.update(updateSql, address, age, phone, gender, city, state, country, userId);
            }
        } else {
            // Insert new profile
            String insertSql = "INSERT INTO user_profile (user_id, address, age, phone, gender, city, state, country, photo) VALUES (?,?,?,?,?,?,?,?,?)";
            jdbc.update(insertSql, userId, address, age, phone, gender, city, state, country, photoPath);
        }

        return "redirect:/profile";
    }
}
