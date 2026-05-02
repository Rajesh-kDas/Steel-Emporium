<!doctype html>
<html lang="en">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<head>
    <%@ page import="java.util.*" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
            <meta name="author" content="Untree.co">
            <link rel="shortcut icon" href="favicon.png">

            <meta name="description" content="" />
            <meta name="keywords" content="bootstrap, bootstrap4" />

            <!-- Bootstrap CSS -->
            <link href="css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                rel="stylesheet">
            <link href="css/tiny-slider.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
            <title>Steel Emporium  </title>
</head>

<body>

    <!-- Start Header/Navigation -->
    <nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark" arial-label="Furni navigation bar">

        <div class="container">
            <a class="navbar-brand" href="/shop">Welcome <%=session.getAttribute("name")%></a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsFurni"
                aria-controls="navbarsFurni" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsFurni">
                <ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
                    <!-- <li class="nav-item ">
						<a class="nav-link" href="/index">Steel Emporium </a>
					</li>
					<li class="active"><a class="nav-link" href="/shop">Shop</a></li>
					<li><a class="nav-link" href="#">About us</a></li>
					<li><a class="nav-link" href="#">Services</a></li>
					<li><a class="nav-link" href="#">Blog</a></li>
					<li><a class="nav-link" href="#">Contact us</a></li> -->
                    <li><a class="nav-link" href="shop">Shop</a></li>
                    <li><a class="nav-link" href="myorder">My Orders</a></li>
                </ul>

                <ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
                    <li>
                    <a class="nav-link" href="/profile">
                        <i class="bi bi-person-circle" style="font-size: 1.5rem;"></i>
                    </a>
                    </li>
                    <li><a class="nav-link" href="/cart"><img src="images/cart.svg"></a></li>
                    <li><a class="nav-link" href="/login"><i class="fa fa-sign-out" aria-hidden="true"></i></a></li>

                </ul>
            </div>
        </div>

    </nav>
    <!-- End Header/Navigation -->

    <!-- Start Hero Section -->
    <div class="hero">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-5">
                    <div class="intro-excerpt">
                        <h1>Shop With Steel Emporium </h1>
                    </div>
                </div>


            </div>
        </div>
    </div>
    <!-- End Hero Section -->



   <style>
    .product-section {
        padding: 50px 0;
        background: linear-gradient(to right, #f0f2f5, #dfe6e9);
        font-family: 'Segoe UI', sans-serif;
    }

    .product-section h2 {
        text-align: center;
        margin-bottom: 40px;
        color: #2d3436;
        font-size: 32px;
        font-weight: bold;
    }

    .table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0 15px;
        background: none;
    }

    .table th {
        background-color: #2c3e50;
        color: white;
        font-size: 14px;
        text-transform: uppercase;
        padding: 14px;
        border: none;
    }

    .table td {
        background-color: #ffffff;
        padding: 16px;
        text-align: center;
        border: none;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .table tr:hover td {
        background-color: #f9f9f9;
    }

    .btn-primary {
        background-color: #e74c3c;
        color: white;
        padding: 8px 16px;
        border: none;
        border-radius: 25px;
        font-size: 14px;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .btn-primary:hover:not(:disabled) {
        background-color: #c0392b;
    }

    .btn-primary:disabled {
        background-color: #bdc3c7;
        cursor: not-allowed;
    }

    .badge {
        display: inline-block;
        padding: 6px 14px;
        font-size: 13px;
        font-weight: 600;
        border-radius: 20px;
        color: #fff;
        text-transform: capitalize;
    }

    .badge.pending {
        background-color: #f39c12;
    }

    .badge.approved {
        background-color: #27ae60;
    }

    .badge.rejected {
        background-color: #e74c3c;
    }

    .badge.canceled {
        background-color: #7f8c8d;
    }
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="untree_co-section product-section before-footer-section">
    <div class="container">
        <h2>Your Orders</h2>
        <div class="row">
            <table class="table text-center">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Total Price</th>
                        <th>Product IDs</th>
                        <th>Product Names</th>
                        <th>Status</th>
                        <th>Delivery Status</th> <!-- New -->
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="orders" items="${orders}">
                        <form method="post" action="ordercancel">
                            <tr>
                                <td>${orders.order_id}</td>
                                <td>Rs ${orders.price}</td>
                                <td>${orders.products}</td>
                                <td>${orders.productsname}</td>
                                <td>
                                    <span class="badge 
                                        <c:choose>
                                            <c:when test="${orders.status eq 'Approved'}">approved</c:when>
                                            <c:when test="${orders.status eq 'Rejected'}">rejected</c:when>
                                            <c:when test="${orders.status eq 'Canceled'}">canceled</c:when>
                                            <c:otherwise>pending</c:otherwise>
                                        </c:choose>">
                                        ${orders.status}
                                    </span>
                                </td>

                                <!-- Delivery Status Display -->
                                <td>
                                    <span class="badge 
                                        <c:choose>
                                            <c:when test="${orders.delivery_status eq 'Delivered'}">bg-success</c:when>
                                            <c:when test="${orders.delivery_status eq 'On the Way'}">bg-warning</c:when>
                                            <c:otherwise>bg-secondary</c:otherwise>
                                        </c:choose>">
                                        ${orders.delivery_status}
                                    </span>

                                    <!-- Show download bill if delivered -->
                                    <c:if test="${orders.delivery_status eq 'Delivered'}">
                                        <br />
                                        <a href="bills/Invoice_Order_${orders.order_id}.pdf" target="_blank" class="btn btn-sm btn-success mt-2">
                                            Download Bill
                                        </a>
                                    </c:if>
                                </td>

                                <!-- Cancel Order Button -->
                                <td>
                                    <input type="hidden" name="order_id" value="${orders.order_id}" />
                                    <input type="submit" class="btn btn-primary" value="Cancel Order"
                                        <c:if test="${orders.status eq 'Canceled'}">disabled</c:if> />
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


    <!-- Start Footer Section -->
    <%@ include file="component/footer.jsp" %>
        <!-- End Footer Section -->


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/custom.js"></script>
</body>

</html>