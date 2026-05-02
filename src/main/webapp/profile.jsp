<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>User Profile - Steel Emporium</title>

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link href="css/style.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #f0f2f5, #dfe6e9);
            font-family: 'Segoe UI', sans-serif;
        }
        .profile-section {
            padding: 50px 0;
        }
        .profile-card {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        }
        .profile-pic {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #2c3e50;
        }
        .form-label {
            font-weight: 600;
            color: #2c3e50;
        }
        .btn-save {
            background-color: #e74c3c;
            color: #fff;
            border-radius: 25px;
            padding: 10px 20px;
        }
        .btn-save:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/shop">Welcome <%=session.getAttribute("name")%></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsFurni">
            <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                <li><a class="nav-link" href="shop">Shop</a></li>
                <li><a class="nav-link" href="myorder">My Orders</a></li>
            </ul>
            <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                <li><a class="nav-link active" href="/profile"><i class="bi bi-person-circle" style="font-size: 1.5rem;"></i></a></li>
                <li><a class="nav-link" href="/cart"><img src="images/cart.svg"></a></li>
                <li><a class="nav-link" href="/login"><i class="fa fa-sign-out"></i></a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- End Navbar -->

<!-- Profile Section -->
<div class="container profile-section">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="profile-card">
                <div class="text-center mb-4">
                    <c:if test="${profile.photo != null}">
                        <img src="${profile.photo}" alt="Profile Photo" class="profile-pic mb-3">
                    </c:if>
                    <h3 class="fw-bold">${profile.user_id}</h3>
                </div>

                <!-- Profile Info -->
                <form action="updateProfile" method="post" enctype="multipart/form-data">

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Address</label>
                            <input type="text" name="address" value="${profile.address}" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Age</label>
                            <input type="number" name="age" value="${profile.age}" class="form-control">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Phone</label>
                            <input type="text" name="phone" value="${profile.phone}" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Gender</label>
                            <select name="gender" class="form-select">
                                <option value="Male" <c:if test="${profile.gender eq 'Male'}">selected</c:if>>Male</option>
                                <option value="Female" <c:if test="${profile.gender eq 'Female'}">selected</c:if>>Female</option>
                                <option value="Other" <c:if test="${profile.gender eq 'Other'}">selected</c:if>>Other</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label">City</label>
                            <input type="text" name="city" value="${profile.city}" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">State</label>
                            <input type="text" name="state" value="${profile.state}" class="form-control">
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Country</label>
                            <input type="text" name="country" value="${profile.country}" class="form-control">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Photo</label>
                        <input type="file" name="photo" class="form-control">
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-save">Save Profile</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<%@ include file="component/footer.jsp" %>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
