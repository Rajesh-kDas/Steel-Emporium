package com.example.steel_crafters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

@Controller
public class OrderController {

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private JdbcTemplate jdbc;

    // OTP storage
    private final Map<String, String> otpStore = new ConcurrentHashMap<>();
    private final Map<String, Long> otpExpiry = new ConcurrentHashMap<>();

    // Send OTP
    @GetMapping("/sendOtp")
    @ResponseBody
    public String sendOtp(@RequestParam String userId) {
        String otp = String.valueOf(new Random().nextInt(900000) + 100000); // 6-digit OTP
        otpStore.put(userId, otp);
        otpExpiry.put(userId, System.currentTimeMillis() + (5 * 60 * 1000)); // 5 min expiry

        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(userId); // ⚠️ must be a valid email
            message.setSubject("Your Order OTP");
            message.setText("Your OTP for placing order is: " + otp + "\nValid for 5 minutes.");
            mailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();
            return "ERROR";
        }

        return "OTP_SENT";
    }

    // Verify OTP
    @GetMapping("/verifyOtp")
    @ResponseBody
    public String verifyOtp(@RequestParam String userId, @RequestParam String otp) {
        otp = otp.trim();
        String storedOtp = otpStore.get(userId);
        Long expiry = otpExpiry.get(userId);

        if (storedOtp != null && expiry != null) {
            if (System.currentTimeMillis() <= expiry) {
                if (storedOtp.equals(otp)) {
                    otpStore.remove(userId);
                    otpExpiry.remove(userId);
                    return "VALID";
                } else {
                    return "INVALID";
                }
            } else {
                otpStore.remove(userId);
                otpExpiry.remove(userId);
                return "EXPIRED";
            }
        }
        return "INVALID";
    }
}
