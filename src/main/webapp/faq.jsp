<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link href="css/tiny-slider.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <title>Steel Emporium  </title>
</head>

<body>

  <!-- Start Header/Navigation -->
<%@ include file="component/header.jsp" %> 
  <!-- End Header/Navigation -->

  <!-- Start Hero Section -->
  <div class="hero">
    <div class="container">
      <div class="row justify-content-between">
        <div class="col-lg-5">
          <div class="intro-excerpt">


            <h1>frequently asked questions</h1>



            <!-- <p><a href="" class="btn btn-secondary me-2">Shop Now</a><a href="#"
								class="btn btn-white-outline">Explore</a></p> -->
          </div>
        </div>
        <div class="col-lg-7">

        </div>
      </div>
    </div>
  </div>
  <!-- End Hero Section -->


  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <div class="accordion" id="accordionExample">
      <c:forEach var="faq" items="${faq}">
        <div class="accordion-item bg-black text-white">
          <h2 class="accordion-header">
            <button class="accordion-button collapsed bg-success text-white" type="button" data-bs-toggle="collapse"
              data-bs-target="#item${faq.sl_no}" aria-expanded="false" aria-controls="collapseTwo">
              <h5>
                ${faq.question}
              </h5>
            </button>
          </h2>
          <div id="item${faq.sl_no}" class="accordion-collapse collapse" aria-labelledby="headingTwo"
            data-bs-parent="#accordionExample">
            <div class="accordion-body">${faq.answer}</div>
          </div>
        </div>
      </c:forEach>
    </div>


    <!-- Start Footer Section -->
<%@ include file="component/footer.jsp" %>
    <!-- End Footer Section -->


    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/custom.js"></script>
</body>

</html>