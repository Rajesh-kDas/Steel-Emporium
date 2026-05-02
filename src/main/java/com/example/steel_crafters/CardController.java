package com.example.steel_crafters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CardController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/card")
    public String showCardPage() {
        return "card";
    }

    @PostMapping("/saveCard")
    public String saveCard(
            @RequestParam("accountNumber") String accountNumber,
            @RequestParam("cvv") String cvv,
            @RequestParam("expiryDate") String expiryDate,
            @RequestParam("amount") double amount,
            Model model) {

        String sql = "INSERT INTO card (account_number, cvv, expiry_date, amount) VALUES (?, ?, ?, ?)";
        int rows = jdbcTemplate.update(sql, accountNumber, cvv, expiryDate, amount);

        if (rows > 0) {
            model.addAttribute("message", "Card details saved successfully!");
        } else {
            model.addAttribute("message", "Error while saving card details!");
        }

        return "card";
    }
    
    @PostMapping("/saveCardAndProceed")
    @ResponseBody
    public String saveCardAndProceed(
            @RequestParam("accountNumber") String accountNumber,
            @RequestParam("cvv") String cvv,
            @RequestParam("expiryDate") String expiryDate,
            @RequestParam("amount") double amount) {

        try {
            // ✅ Check existing balance
            String checkSql = "SELECT amount FROM card WHERE account_number = ? AND cvv = ? AND expiry_date = ?";
            Double currentBalance = null;
            try {
                currentBalance = jdbcTemplate.queryForObject(checkSql, Double.class, accountNumber, cvv, expiryDate);
            } catch (Exception e) {
                currentBalance = null;
            }

            if (currentBalance == null) {
                return "Invalid card details!";
            }

            if (currentBalance < amount) {
                return "Insufficient balance!";
            }

            // ✅ Deduct amount
            double newBalance = currentBalance - amount;
            String updateSql = "UPDATE card SET amount = ? WHERE account_number = ?";
            jdbcTemplate.update(updateSql, newBalance, accountNumber);

            // ✅ Optional: log transaction
            String logSql = "INSERT INTO card_transaction (account_number, amount, status) VALUES (?, ?, ?)";
            try {
                jdbcTemplate.update(logSql, accountNumber, amount, "PAID");
            } catch (Exception ignore) {}

            return "PAID";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error during payment!";
        }
    }
}
