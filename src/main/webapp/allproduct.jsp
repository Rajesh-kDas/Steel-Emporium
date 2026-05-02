<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="css/style1.css">
    <link rel="shortcut icon" href="images/favicon.png" />

    <style>
        .product-thumbnail {
            width: 120px;
            height: 120px;
            object-fit: cover; /* square crop */
            cursor: pointer;
            border-radius: 8px;
            transition: transform 0.2s ease-in-out;
        }

        .product-thumbnail:hover {
            transform: scale(1.1);
        }

        .modal-img {
            width: 100%;
            height: auto;
            max-height: 80vh;
            object-fit: contain;
        }
        /* Body */
body {
    background: #f0fdf4; /* light eco background */
    font-family: 'Poppins', sans-serif;
}

/* Sidebar */
.sidebar {
    background: linear-gradient(180deg, #2e7d32, #1b5e20);
    color: #fff;
}
.sidebar .nav-link {
    color: #dcedc8;
    padding: 12px 18px;
    margin: 5px 0;
    border-radius: 8px;
}
.sidebar .nav-link.active {
    background: rgba(255,255,255,0.15);
    border-left: 4px solid #a5d6a7;
}

/* Navbar */
.navbar {
    backdrop-filter: blur(10px);
    background: rgba(255,255,255,0.8);
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

/* Table */
.table {
    border-radius: 12px;
    overflow: hidden;
    background: #fff;
}
.table thead {
    background: linear-gradient(45deg, #2e7d32, #00c853);
    color: #fff;
}
.table-hover tbody tr:hover {
    background-color: #e8f5e9;
}

/* Buttons */
.btn-eco {
    background: linear-gradient(45deg, #2e7d32, #00c853);
    color: #fff;
    border: none;
    border-radius: 25px;
    padding: 8px 18px;
    font-weight: 500;
}
.btn-eco:hover {
    background: linear-gradient(45deg, #00c853, #2e7d32);
    box-shadow: 0px 4px 12px rgba(0,0,0,0.2);
}

/* Modal */
.modal-content {
    border-radius: 15px;
}
.modal-header {
    background: linear-gradient(45deg, #2e7d32, #00c853);
    color: #fff;
}

    </style>
</head>

<body>
    <div class="container-scroller">
        <!-- Navbar -->
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo me-5" href="#">
                    Welcome ${sessionScope.name}
                </a>
                <a class="navbar-brand brand-logo-mini" href="#">Admin</a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <ul class="navbar-nav navbar-nav-right mt-3">
                    <li>
                        <a class="dropdown-item" href="index">
                            <i class="ti-power-off text-primary"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Navbar Ends -->

        <div class="container-fluid page-body-wrapper">
            <!-- Sidebar -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item"><a class="nav-link" href="admindashboard"><i class="ti-shield menu-icon"></i><span class="menu-title">Admin Dashboard</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="allproduct"><i class="ti-palette menu-icon"></i><span class="menu-title">All Product</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="addproduct"><i class="ti-plus menu-icon"></i><span class="menu-title">Add Products</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="viewcustomer"><i class="ti-layout-list-post menu-icon"></i><span class="menu-title">View Customer</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="vieworder"><i class="ti-pie-chart menu-icon"></i><span class="menu-title">View Orders</span></a></li>

                    <li class="nav-item"><a class="nav-link" href="showfaq"><i class="ti-write menu-icon"></i><span class="menu-title">FAQ</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="viewcontact"><i class="ti-view-list-alt menu-icon"></i><span class="menu-title">Contact</span></a></li>
                </ul>
            </nav>
            <!-- Sidebar Ends -->

            <!-- Main Content -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <h4 class="font-weight-bold mb-3">All Products</h4>
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Description</th>
                                    <th>Rate</th>
                                    <th>Quantity</th>
                                    <th>Image</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="prod" items="${prodmaster}">
                                    <tr>
                                        <td>${prod.prodid}</td>
                                        <td>${prod.prodname}</td>
                                        <td style="max-width: 300px; white-space: normal; word-wrap: break-word;">
                                            ${prod.description}
                                        </td>
                                        <td>${prod.prodrate}</td>
                                        <td>${prod.prodqty}</td>
                                        <td>
                                            <img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(prod.prod_img)}"
                                                 class="product-thumbnail"
                                                 alt="${prod.prodname}"
                                                 data-bs-toggle="modal"
                                                 data-bs-target="#imageModal"
                                                 data-img="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(prod.prod_img)}" />
                                        </td>
                                        <td>
                                            <!-- Delete -->
                                            <form action="dltprod" method="post" style="display:inline;">
                                                <input type="hidden" name="prodid" value="${prod.prodid}">
                                                <input type="submit" name="btn" value="Delete" class="btn btn-danger btn-sm">
                                            </form>

                                            <!-- Update (opens modal) -->
                                            <button type="button" 
                                                    class="btn btn-primary btn-sm"
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#updateModal"
                                                    data-prodid="${prod.prodid}"
                                                    data-prodname="${prod.prodname}"
                                                    data-description="${prod.description}"
                                                    data-prodrate="${prod.prodrate}"
                                                    data-prodqty="${prod.prodqty}">
                                                Update
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ✅ Modal for Image Preview -->
    <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <img id="modalImage" class="modal-img" src="" alt="Preview">
                </div>
            </div>
        </div>
    </div>
 <!-- ✅ Update Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <!-- enctype added for file upload -->
            <form action="updateprod" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="updateModalLabel">Update Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="prodid" id="updProdId">

                    <div class="form-group mb-2">
                        <label>Product Name</label>
                        <input type="text" class="form-control" name="prodname" id="updProdName" required>
                    </div>

                    <div class="form-group mb-2">
                        <label>Description</label>
                        <textarea class="form-control" name="description" id="updDescription" required></textarea>
                    </div>

                    <div class="form-group mb-2">
                        <label>Rate</label>
                        <input type="number" class="form-control" name="prodrate" id="updRate" required>
                    </div>

                    <div class="form-group mb-2">
                        <label>Quantity</label>
                        <input type="number" class="form-control" name="prodqty" id="updQty" required>
                    </div>

                    <div class="form-group mb-2">
                        <label>Current Image</label><br>
                        <img id="updPreview" src="" alt="Preview" style="width:120px; height:120px; border-radius:8px;">
                    </div>

                    <div class="form-group mb-2">
                        <label>Change Image</label>
                        <input type="file" class="form-control" name="prodimg" id="updFile" accept="image/*">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Save Changes</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Fill modal with existing product details
    var updateModal = document.getElementById('updateModal');
    updateModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget;

        var prodid = button.getAttribute('data-prodid');
        var prodname = button.getAttribute('data-prodname');
        var description = button.getAttribute('data-description');
        var prodrate = button.getAttribute('data-prodrate');
        var prodqty = button.getAttribute('data-prodqty');
        var prodimg = button.closest("tr").querySelector("img").getAttribute("src"); // current image

        document.getElementById('updProdId').value = prodid;
        document.getElementById('updProdName').value = prodname;
        document.getElementById('updDescription').value = description;
        document.getElementById('updRate').value = prodrate;
        document.getElementById('updQty').value = prodqty;
        document.getElementById('updPreview').src = prodimg;
    });

    // Show preview when selecting new image
    document.getElementById("updFile").addEventListener("change", function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('updPreview').src = e.target.result;
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
</script>



    <!-- JS -->
    <script src="vendors/base/vendor.bundle.base.js"></script>
    <script src="js/off-canvas.js"></script>
    <script src="js/template.js"></script>

    <script>
        // Show clicked image in modal
        document.addEventListener("DOMContentLoaded", function () {
            var imageModal = document.getElementById("imageModal");
            var modalImage = document.getElementById("modalImage");

            imageModal.addEventListener("show.bs.modal", function (event) {
                var triggerImg = event.relatedTarget;
                var imgSrc = triggerImg.getAttribute("data-img");
                modalImage.setAttribute("src", imgSrc);
            });
        });
    </script>
</body>
</html>