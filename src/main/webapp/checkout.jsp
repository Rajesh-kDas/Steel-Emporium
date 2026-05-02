<!doctype html>
<html lang="en">

<%@ page import="java.util.*" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			<meta name="author" content="Untree.co">
			<link rel="shortcut icon" href="favicon.png">

			<meta name="description" content="" />
			<meta name="keywords" content="bootstrap, bootstrap4" />
			<!-- SweetAlert2 CDN -->
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
			<!-- Bootstrap CSS -->
			<link href="css/bootstrap.min.css" rel="stylesheet">
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
				rel="stylesheet">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
				crossorigin="anonymous">
			<link href="css/tiny-slider.css" rel="stylesheet">
			<link href="css/style.css" rel="stylesheet">
			<title>Steel Emporium </title>
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
							<!-- <li class="nav-item ">
												<a class="nav-link" href="/index">Home</a>
											</li>
											<li><a class="nav-link" href="/shop">Shop</a></li>
											<li><a class="nav-link" href="/about">About us</a></li>
											<li><a class="nav-link" href="/services">Services</a></li>
											<li><a class="nav-link" href="/blog">Blog</a></li>
											<li><a class="nav-link" href="/contact">Contact us</a></li> -->
							<li><a class="nav-link" href="shop">Shop</a></li>
							<li><a class="nav-link" href="myorder">My Orders</a></li>
						</ul>

						<ul class="custom-navbar-cta navbar-nav mb-2 mb-md-0 ms-5">
							<!-- <li><a class="nav-link" href="/login"><img src="images/user.svg"></a></li> -->
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
								<h1>Checkout</h1>
							</div>
						</div>
						<div class="col-lg-7">

						</div>
					</div>
				</div>
			</div>
			<!-- End Hero Section -->
			<div>
				<div class="untree_co-section">
					<div class="container">
						<div class="row mb-5">
							<div class="col-md-12">

							</div>
						</div>
						<div class="row">

							<div class="col-md-12 mb-5 mb-md-0">
								<h2 class="h3 mb-3 text-black">Billing Details</h2>
								<div class="p-3 p-lg-5 border bg-white">

									<div class="form-group row">
										<div class="col-md-12">
											<label for="fullname" class="text-black">Full Name<span
													class="text-danger">*</span> </label>
											<input type="text" class="form-control" id="fullname" name="fullname">
										</div>
									</div>



									<div class="form-group row">
										<div class="col-md-12">
											<label for="c_address" class="text-black">Address <span
													class="text-danger">*</span></label>
											<input type="text" class="form-control" id="c_address" name="c_address"
												placeholder="Street address">
										</div>
									</div>


									<div class="form-group row">
										<div class="col-md-6">
											<label for="c_state_country" class="text-black">State / Country <span
													class="text-danger">*</span></label>
											<input type="text" class="form-control" id="c_state_country"
												name="c_state_country">
										</div>
										<div class="col-md-6">
											<label for="c_postal_zip" class="text-black">Posta / Zip <span
													class="text-danger">*</span></label>
											<input type="text" class="form-control" id="c_postal_zip"
												name="c_postal_zip">
										</div>
									</div>

									<div class="form-group row mb-5">
										<div class="col-md-6">
											<label for="c_email_address" class="text-black">Email Address <span
													class="text-danger">*</span></label>
											<input type="text" class="form-control" id="c_email_address"
												name="c_email_address">
										</div>
										<div class="col-md-6">
											<label for="c_phone" class="text-black">Phone <span
													class="text-danger">*</span></label>
											<input type="text" class="form-control" id="c_phone" name="c_phone"
												placeholder="Phone Number">
										</div>
									</div>


								</div>



								<div class="row mb-5">
									<div class="col-md-12">
										<h2 class="h3 mb-3 text-black">Your Order</h2>
										<div class="p-3 p-lg-5 border bg-white">
											<table class="table site-block-order-table mb-5">
												<tr>
													<th>Product</th>
													<th>Total</th>
												</tr>
												<c:forEach var="product" items="${product}">
													<tr>
														<td>${product.prodname}<strong
																class="mx-2">x</strong>${product.qty}</td>
														<td>${product.total}</td>
													</tr>
												</c:forEach>
												<tr>
													<td colspan="2">
														<c:forEach var="total" items="${total}">
															<h2>Total = Rs ${total.total_sum}</h2>
														</c:forEach>
													</td>
												</tr>
											</table>

											<div class="form-group">
												<form id="orderForm" action="saveorder" method="post">
													<c:forEach var="product" items="${product}">
														<input type="hidden" name="products"
															value="${product.prodid}" />
														<input type="hidden" name="productsname"
															value="${product.prodname}" />
														<!-- ⚠️ This must be user's email for OTP -->
														<input type="hidden" id="user_id" name="user_id"
															value="${product.user_id}" />
													</c:forEach>
													<c:forEach var="total" items="${total}">
														<input type="hidden" name="total" value="${total.total_sum}" />
													</c:forEach>

													<!-- Place Order button triggers OTP -->
													<input type="button" class="btn btn-black btn-lg py-3 btn-block"
														onclick="openCardModal()" value="Place Order" />
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- ==============================
     CARD PAYMENT MODAL
============================== -->
								<div class="modal fade" id="cardModal" tabindex="-1" aria-labelledby="cardModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content p-4">
											<div class="modal-header border-0">
												<h5 class="modal-title fw-bold" id="cardModalLabel">Card Payment</h5>
												<button type="button" class="btn-close" data-bs-dismiss="modal"
													aria-label="Close"></button>
											</div>

											<div class="modal-body">
												<form id="cardForm">
													<div class="mb-3">
														<label for="accountNumber" class="form-label">Account
															Number</label>
														<input type="text" class="form-control" id="accountNumber"
															name="accountNumber" required maxlength="16"
															pattern="[0-9]{16}">
													</div>

													<div class="mb-3">
														<label for="cvv" class="form-label">CVV</label>
														<input type="password" class="form-control" id="cvv" name="cvv"
															required maxlength="3" pattern="[0-9]{3}">
													</div>

													<div class="mb-3">
														<label for="expiryDate" class="form-label">Expiry Date</label>
														<input type="month" class="form-control" id="expiryDate"
															name="expiryDate" required>
													</div>

													<div class="mb-3">
														<label for="amount" class="form-label">Amount</label>
														<input type="text" class="form-control" id="amount"
															name="amount" readonly>
													</div>

													<button type="button" class="btn btn-primary w-100"
														onclick="processCardPayment()">Pay</button>
												</form>
											</div>
										</div>
									</div>
								</div>

								<!-- Include Bootstrap JS -->
								<script
									src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

								<!-- SweetAlert2 must be included -->
								<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

							<script>
  let countdown; // declare globally

  function openCardModal() {
    const totalInput = document.querySelector('input[name="total"]');
    const totalAmount = totalInput ? totalInput.value : 0;
    document.getElementById("amount").value = totalAmount;

    // Show Bootstrap modal
    const cardModal = new bootstrap.Modal(document.getElementById('cardModal'));
    cardModal.show();
  }

  function processCardPayment() {
    const formData = new FormData(document.getElementById("cardForm"));

    fetch("/saveCardAndProceed", {
      method: "POST",
      body: formData
    })
      .then(res => res.text())
      .then(response => {
        if (response === "PAID") {
          const userId = document.getElementById("user_id").value;
          // Close card modal before opening SweetAlert
          const modalEl = document.getElementById('cardModal');
          const modal = bootstrap.Modal.getInstance(modalEl);
          modal.hide();

          setTimeout(() => {
            requestOtpAfterPayment(userId);
          }, 300); // small delay to avoid modal conflict
        } else {
          Swal.fire("Error", response, "error");
        }
      })
      .catch(err => Swal.fire("Error", err.message, "error"));
  }

  function requestOtpAfterPayment(userId) {
    Swal.fire({
      title: 'Please wait...',
      html: 'Sending OTP to your registered email',
      allowOutsideClick: false,
      didOpen: () => Swal.showLoading()
    });

    fetch('/sendOtp?userId=' + userId)
      .then(res => res.text())
      .then(data => {
        Swal.close();
        if (data === "OTP_SENT") {
          Swal.fire({
            title: 'Enter OTP',
            html: `
              <input type="text" id="otpInput" maxlength="6" class="swal2-input" placeholder="Enter 6-digit OTP" style="text-align:center;font-size:18px;">
              <p id="timer" style="font-size:16px;font-weight:bold;color:#d33;margin-top:10px;">05:00</p>
              <p id="otp-error" style="color:red;font-size:14px;"></p>
            `,
            confirmButtonText: 'Submit OTP',
            showCancelButton: true,
            cancelButtonText: 'Cancel',
            allowOutsideClick: false,
            didOpen: () => {
              startTimer(300); // start 5 min countdown
              const otpInput = Swal.getHtmlContainer().querySelector('#otpInput');
              otpInput.removeAttribute('disabled'); // ensure input is editable
              otpInput.focus();
            },
            preConfirm: () => {
              const otp = document.getElementById("otpInput").value.trim();
              if (!otp) {
                Swal.showValidationMessage("Please enter OTP!");
                return false;
              }

              return fetch('/verifyOtp?userId=' + userId + '&otp=' + otp)
                .then(res => res.text())
                .then(result => {
                  if (result === "VALID") return true;
                  if (result === "EXPIRED") throw new Error("OTP expired!");
                  throw new Error("Invalid OTP!");
                })
                .catch(err => {
                  Swal.showValidationMessage(err.message);
                });
            }
          }).then(result => {
            clearInterval(countdown);
            if (result.isConfirmed) {
              document.getElementById("orderForm").submit();
            }
          });
        } else {
          Swal.fire("Error", "Failed to send OTP. Try again!", "error");
        }
      });
  }

  function startTimer(duration) {
    let timer = duration, minutes, seconds;
    clearInterval(countdown);

    countdown = setInterval(() => {
      minutes = parseInt(timer / 60, 10);
      seconds = parseInt(timer % 60, 10);

      const timerEl = Swal.getHtmlContainer()?.querySelector("#timer");
      const errorEl = Swal.getHtmlContainer()?.querySelector("#otp-error");

      if (timerEl) {
        timerEl.innerText =
          (minutes < 10 ? "0" + minutes : minutes) + ":" +
          (seconds < 10 ? "0" + seconds : seconds);
      }

      if (--timer < 0) {
        clearInterval(countdown);
        if (errorEl) errorEl.innerText = "OTP expired!";
        Swal.close();
        window.location = "checkout";
      }
    }, 1000);
  }
</script>



							</div>
						</div>
					</div>

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