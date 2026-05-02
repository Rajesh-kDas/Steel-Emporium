<!-- /*
* Bootstrap 5
* Template Name: Furni
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/

*/ -->

<style>
    .product-thumbnail {
        max-width: 120px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .table th, .table td {
        vertical-align: middle !important;
        text-align: center;
    }

    .product-name {
        font-weight: 600;
    }

    .product-price, .product-total {
        color: #28a745;
        font-weight: bold;
    }

    .btn-remove {
        background-color: #dc3545;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 5px;
    }

    .btn-remove:hover {
        background-color: #c82333;
    }

    .qty-btn {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        width: 30px;
        height: 30px;
        font-weight: bold;
    }

    .qty-btn:hover {
        background-color: #0056b3;
    }
</style>
<%@ page import="java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!doctype html>
		<html lang="en">

		<head>
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
			<nav class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark"
				arial-label="Furni navigation bar">

				<div class="container">
					<a class="navbar-brand" href="/shop">Welcome <%=session.getAttribute("name")%></a>

					<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
						data-bs-target="#navbarsFurni" aria-controls="navbarsFurni" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarsFurni">
						<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
							<li><a class="nav-link" href="shop">Shop</a></li>
							<li><a class="nav-link" href="myorder">My Orders</a></li>
						</ul>

						<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
							<li><a class="nav-link" href="/cart"><img src="images/cart.svg"></a></li>
							<li><a class="nav-link" href="/login"><i class="fa fa-sign-out" aria-hidden="true"></i></a>
							</li>
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
								<h1>Cart</h1>
							</div>
						</div>
						<div class="col-lg-7">

						</div>
					</div>
				</div>
			</div>
			<!-- End Hero Section -->



			<!-- Your Cart Table Section -->
<div class="untree_co-section before-footer-section py-5 bg-light">
    <div class="container">
        <h2 class="mb-4 text-center">Your Shopping Cart</h2>
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="site-blocks-table table-responsive bg-white p-4 shadow rounded">
                    <table class="table table-bordered">
                        <thead class="table-dark">
                            <tr>
                                <th  style="color: white;">Image</th>
                                <th  style="color: white;"> Product</th>
                                <th  style="color: white;">Price</th>
                                <th  style="color: white;">Quantity</th>
                                <th  style="color: white;">Total</th>
                                <th  style="color: white;">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${product}">
                                <tr>
                                    <td>
                                        <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(product.prod_img)}"
                                             class="img-fluid product-thumbnail" />
                                    </td>
                                    <td class="product-name">${product.prodname}</td>
                                    <td class="product-price">Rs ${product.prodrate}</td>
                                    <td>
                                        <div class="d-flex justify-content-center align-items-center gap-2">
                                            <form method="post" action="removeone" class="d-inline">
                                                <input type="hidden" value="${product.sl_no}" name="sl_no" />
                                                <input type="hidden" value="${product.prodrate}" name="prodrate" />
                                                <input type="submit" value="-" class="qty-btn" />
                                            </form>
                                            <span>${product.qty}</span>
                                            <form method="post" action="addone" class="d-inline">
                                                <input type="hidden" value="${product.sl_no}" name="sl_no" />
                                                <input type="hidden" value="${product.prodrate}" name="prodrate" />
                                                <input type="submit" value="+" class="qty-btn" />
                                                

                                            </form>
                                        </div>
                                    </td>
                                    <td class="product-total">Rs ${product.total}</td>
                                    <td>
                                        <form method="post" action="removefromcart">
                                            <input type="hidden" value="${product.sl_no}" name="sl_no" />
                                            <input type="submit" class="btn-remove" value="Remove" />
                                        </form>
                                    </td>
                                    <c:if test="${not empty errorMessage}">
                                                    <p style="color: red; font-weight: bold;">${errorMessage}</p>
                                                </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
					<div class="row">
						<div class="col-md-6">
					
						</div>
					</div>
				</div>
				<div class="row w-100">
					<div class="col-md-12 d-flex justify-content-center">
						<a class="btn btn-black btn-lg py-3 btn-block" onclick="window.location='/checkout'">Proceed To
							Checkout</a>
					</div>
				</div>
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