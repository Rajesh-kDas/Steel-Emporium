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
					<!-- <li><a class="nav-link" href="#">Profile</a></li> -->
					<li><a class="nav-link" href="myorder">My Orders</a></li>
					<li><a class="nav-link" href="card">My Card</a></li>
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



	<div class="untree_co-section product-section before-footer-section py-5">
    <div class="container">
        <h2 class="text-center mb-5">Our Products</h2>
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <c:forEach var="prod" items="${products}">
                <div class="col">
                    <div class="card h-100 shadow rounded-4">
                        <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(prod.prod_img)}"
                             class="card-img-top rounded-top-4 img-fluid"
                             style="max-height: 250px; object-fit: contain; background-color: #f8f9fa; padding: 10px;"
                             alt="${prod.prodname}" />

                        <div class="card-body">
                            <h5 class="card-title text-primary">${prod.prodname}</h5>
                            <p class="card-text text-muted">${prod.description}</p>
                            <h6 class="text-success">Price: Rs.${prod.prodrate}</h6>
                        </div>

                        <div class="card-footer bg-white border-0">
                            <form method="post" action="addtocart">
                                <input type="hidden" name="prodid" value="${prod.prodid}" />
                                <input type="hidden" name="prodname" value="${prod.prodname}" />
                                <input type="hidden" name="prodrate" value="${prod.prodrate}" />
                                <button type="submit" class="btn btn-outline-primary w-100">
                                    Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
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