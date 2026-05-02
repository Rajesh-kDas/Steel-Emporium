<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="css/style1.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="images/favicon.png" />
</head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_navbar.html -->
        <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo me-5" href="#">Welcome <%=session.getAttribute("name")%></a>
                <a class="navbar-brand brand-logo-mini" href="#">Admin</a>
            </div>
            <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                    <span class="ti-view-list"></span>
                </button>
                
                <ul class="navbar-nav navbar-nav-right mt-3">
                    <li>
                        <a class="dropdown-item" href="index">
                            <i class="ti-power-off text-primary"></i>
                            Logout
                        </a>
                    </li>
                </ul>
                <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-toggle="offcanvas">
                    <span class="ti-view-list"></span>
                </button>
            </div>
        </nav>
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item">
                        <a class="nav-link" href="admindashboard">
                            <i class="ti-shield menu-icon"></i>
                            <span class="menu-title">AdminDashboard</span>
                        </a>
                    </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <i class="ti-palette menu-icon"></i>
                        <span class="menu-title">View Product</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="/allproduct">All Product</a></li>
                
                            <li class="nav-item"> <a class="nav-link" href="/addproduct">Add Products</a></li>
                        </ul>
                    </div>
                </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewcustomer">
                            <i class="ti-layout-list-post menu-icon"></i>
                            <span class="menu-title">View Customer</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="vieworder">
                            <i class="ti-pie-chart menu-icon"></i>
                            <span class="menu-title">View Orders</span>
                        </a>
                    </li>

           

                    <!-- <li class="nav-item">
                        <a class="nav-link" href="addstaff">
                            <i class="ti-write menu-icon"></i>
                            <span class="menu-title">Add Staff</span>
                        </a>
                    </li> -->
                    <li class="nav-item">
                        <a class="nav-link" href="showfaq">
                            <i class="ti-write menu-icon"></i>
                            <span class="menu-title">FAQ</span>
                        </a>
                    <li class="nav-item">
                        <a class="nav-link" href="viewcontact">
                            <i class="ti-view-list-alt menu-icon"></i>
                            <span class="menu-title">contact</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h4 class="font-weight-bold mb-0">Dashboard</h4>
                                </div>

                            </div>
                        </div>
                    </div>




                    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                        Welcome <%=session.getAttribute("name")%>
                            <hr>
                            <table class="table" border="1px" width="100%">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach var="user" items="${usermaster}">
                                    <tr>
                                        <td>${user.name}</td>
                                        <td>${user.user_id}</td>
                                        <td>${user.role}</td>
                                        <td>${user.status}</td>

                                        <td>
                                            <form action="manageuser" method="post">
                                                <input type="hidden" name="user_id" value="${user.user_id}">
                                                <input type="submit" value="Delete" name="btn">
                                                <input type="submit" value="Update" name="btn">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>






                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

        <!-- plugins:js -->
        <script src="vendors/base/vendor.bundle.base.js"></script>
        <!-- endinject -->
        <!-- Plugin js for this page-->
        <script src="vendors/chart.js/Chart.min.js"></script>
        <script src="js/jquery.cookie.js" type="text/javascript"></script>
        <!-- End plugin js for this page-->
        <!-- inject:js -->
        <script src="js/off-canvas.js"></script>
        <script src="js/hoverable-collapse.js"></script>
        <script src="js/template.js"></script>
        <script src="js/todolist.js"></script>
        <!-- endinject -->
        <!-- Custom js for this page-->
        <script src="js/dashboard.js"></script>
        <!-- End custom js for this page-->
</body>

</html>