<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-image: url("images/loginimage.avif");
      background-size: cover;
      background-position: center;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .container {
      position: relative;
      background-color: rgba(255, 255, 255, 0.3);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
      width: 400px;
    }

    .close-btn {
      position: absolute;
      top: 10px;
      right: 10px;
      background-color: transparent;
      border: none;
      color: #333;
      font-size: 20px;
      cursor: pointer;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 10px;
      font-weight: bold;
      color: #333;
    }

    input[type="text"],
    input[type="password"],
    select {
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      outline: none;
    }

    input[type="radio"] {
      margin-right: 5px;
    }

    input[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #45a049;
    }

    .login-link {
      text-align: center;
      margin-top: 20px;
      color: #333;
    }

    .login-link a {
      color: #007bff;
      text-decoration: none;
      font-weight: bold;
    }

    @media screen and (max-width: 500px) {
      .container {
        width: 90%;
      }
    }
  </style>
</head>

<body>

  <div class="container">
    <button class="close-btn" onclick="window.location.href='/index'">&times;</button>
    <h2>Sign Up</h2>
    <form action="signup" method="post" id="signup-form">
  <label for="name">Name:</label>
  <input type="text" id="username" name="name" required>
  <div id="name-error" style="color:red; font-size:13px;"></div>

  <label for="userid">Email ID:</label>
  <input type="text" id="user_id" name="user_id" required>
  <div id="userid-error" style="color:red; font-size:13px;"></div>

  <label for="password">Password:</label>
  <input type="password" id="password" name="password" required>
  <div id="password-error" style="color:red; font-size:13px;"></div>

  <label>Role:</label>
  <div>
    <input type="radio" id="customer" name="role" value="customer" checked>
    <label for="user">customer</label>
  </div>
  <br>
  <input type="submit" value="Sign Up">
</form>

<script>
  document.getElementById("signup-form").addEventListener("submit", function(event) {
    let isValid = true;

    // Clear previous errors
    document.getElementById("name-error").innerText = "";
    document.getElementById("userid-error").innerText = "";
    document.getElementById("password-error").innerText = "";

    // Name validation
    const name = document.getElementById("username").value.trim();
    if (name.length < 3) {
      document.getElementById("name-error").innerText = "Name must be at least 3 characters.";
      isValid = false;
    }

  // Email ID validation
const email = document.getElementById("user_id").value.trim();
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

if (!emailPattern.test(email)) {
  document.getElementById("userid-error").innerText = "Please enter a valid email address.";
  isValid = false;
}


    // Password validation (min 6 chars, at least 1 uppercase & 1 number)
    const password = document.getElementById("password").value;
    if (password.length < 6) {
      document.getElementById("password-error").innerText = "Password must be at least 6 characters.";
      isValid = false;
    } else if (!/[A-Z]/.test(password) || !/[0-9]/.test(password)) {
      document.getElementById("password-error").innerText = "Password must contain at least 1 uppercase letter and 1 number.";
      isValid = false;
    }

    if (!isValid) {
      event.preventDefault(); // Stop form submission if validation fails
    }
  });
</script>

    <div class="login-link">
      Already have an account? <a href="login.jsp">Log In</a>
    </div>
  </div>

</body>

</html>