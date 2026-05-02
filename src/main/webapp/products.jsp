<%@ include file="component/header.jsp" %>

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

	<!-- Start Hero Section -->
	<div class="hero">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-lg-5">
					<div class="intro-excerpt">
						<h1>Our Products</h1>
						<p class="mb-4">Explore our blog for the latest insights, trends, and innovations in the world
							of steel fabrication.
							.</p>
						<p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#"
								class="btn btn-white-outline">Explore</a></p>
					</div>
				</div>
				<div class="col-lg-7">
					<div class="hero-img-wrap">
						<img src="images/couch.png" class="img-fluid">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Hero Section -->



	<!-- Start Blog Section -->
		<div class="untree_co-section product-section before-footer-section py-5">
    <div class="container">
        <h2 class="text-center mb-5"></h2>
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
                            
                               
                                <a href="/login" class="btn btn-outline-primary w-100">
                                    ShopNow
                                </a>
                          
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
	<!-- End Blog Section -->




		<!-- Start Footer Section -->
		<%@ include file="component/footer.jsp" %>
			<!-- End Footer Section -->

			<script src="js/bootstrap.bundle.min.js"></script>
			<script src="js/tiny-slider.js"></script>
			<script src="js/custom.js"></script>
			</body>

			</html>