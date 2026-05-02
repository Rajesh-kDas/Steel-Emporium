<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
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

    .navbar {
      background-color: #3D5D50;
      padding: 10px 0;
      display: flex;
      justify-content: space-around;
      align-items: center;
      width: 100%;
      position: fixed;
      top: 0;
      z-index: 1000;
    }

    .navbar a {
      color: white;
      text-decoration: none;
      font-weight: bold;
      transition: color 0.3s;
    }

    .navbar a:hover {
      color: lightgreen;
    }

    .container {
      background-color: rgba(255, 255, 255, 0.3);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
      width: 400px;
      margin-top: 60px;
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
    input[type="password"] {
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      outline: none;
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
      background-color: #5f298c;
    }

    .signup-link {
      text-align: center;
      margin-top: 20px;
      color: #333;
    }

    .signup-link a {
      color: #007bff;
      text-decoration: none;
      font-weight: bold;
    }

    .close-button {
      position: absolute;
      top: 10px;
      right: 10px;
      background-color: transparent;
      border: none;
      color: #333;
      font-size: 16px;
      cursor: pointer;
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
    <button class="close-btn" onclick="window.location.href='index'">&times;</button>
    <h2>Login</h2>
    <form action="login" method="post" id="login-form">
      <label for="user_id">User ID:</label>
      <input type="text" id="userid" name="user_id" required>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
      <input type="submit" value="Log In">
    </form>
    <div class="signup-link">
      Don't have an account? <a href="signup">Sign Up</a>
    </div>
  </div>
</body>

</html>