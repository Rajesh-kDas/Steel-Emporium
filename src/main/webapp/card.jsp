<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Seeree | Add Card Details</title>

    <!-- Bootstrap + SweetAlert2 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f3f4f7, #e9ecef);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .card-box {
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            width: 420px;
            padding: 35px 30px;
            transition: all 0.3s ease-in-out;
        }
        .card-box:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }
        .card-title {
            text-align: center;
            font-weight: 700;
            color: #222;
            margin-bottom: 25px;
        }
        label {
            font-weight: 500;
            color: #333;
            margin-top: 10px;
        }
        input.form-control {
            border-radius: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            transition: 0.2s;
        }
        input.form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 4px rgba(0,123,255,0.3);
        }
        button.btn-submit {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            font-weight: 600;
            border-radius: 10px;
            background-color: #007bff;
            color: #fff;
            transition: 0.3s;
        }
        button.btn-submit:hover {
            background-color: #0056b3;
        }
        .msg {
            text-align: center;
            color: green;
            margin-bottom: 15px;
            font-weight: 500;
        }
    </style>
</head>

<body>

<div class="card-box">
    <h2 class="card-title">💳 Add Card Details</h2>

    <div class="msg">${message}</div>

    <form action="saveCard" method="post">
        <div class="mb-3">
            <label for="accountNumber" class="form-label">Account Number</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber"
                   maxlength="12" pattern="[0-9]{12}" required placeholder="Enter 12-digit number">
        </div>

        <div class="mb-3">
            <label for="cvv" class="form-label">CVV</label>
            <input type="password" class="form-control" id="cvv" name="cvv"
                   maxlength="3" pattern="[0-9]{3}" required placeholder="Enter CVV">
        </div>

        <div class="mb-3">
            <label for="expiryDate" class="form-label">Expiry Date</label>
            <input type="month" class="form-control" id="expiryDate" name="expiryDate" required>
        </div>

        <div class="mb-3">
            <label for="amount" class="form-label">Amount</label>
            <input type="number" class="form-control" id="amount" name="amount" step="0.01" required placeholder="Enter amount">
        </div>

        <button type="submit" class="btn btn-submit">💾 Save Card</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
