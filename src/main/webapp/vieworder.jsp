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
    <style>
      table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        th, td {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #2c3e50;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef5ff;
        }

        .btn {
            padding: 8px 15px;
            border: none;
            border-radius: 6px;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            transition: background 0.3s ease;
        }

        .btn-approve {
            background-color: #27ae60;
        }

        .btn-approve:hover {
            background-color: #219150;
        }

        .btn-reject {
            background-color: #e74c3c;
        }

        .btn-reject:hover {
            background-color: #c0392b;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            color: #fff;
            font-weight: bold;
        }

        .approved {
            background-color: #27ae60;
        }

        .rejected {
            background-color: #e74c3c;
        }

        .pending {
            background-color: #95a5a6;
        }

        form {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
    </style>

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
                <ul class="navbar-nav mr-lg-2">
                    <li class="nav-item nav-search d-none d-lg-block">
                        <!-- <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="ti-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now"
                aria-label="search" aria-describedby="search">
            </div> -->
                    </li>
                </ul>
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
                        <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
                            aria-controls="ui-basic">
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
                           <table>
       <thead>
    <tr>
        <th>Order ID</th>
        <th>User</th>
        <th>Price</th>
        <th>Product</th>
        <th>Status</th>
        <th>Delivery Status</th> <!-- New column -->
        <th>Action</th>
    </tr>
</thead>
<tbody>
    <c:forEach var="user" items="${vieworder}">
        <tr>
            <td>${user.order_id}</td>
            <td>${user.user_id}</td>
            <td>Rs.${user.price}</td>
            <td>${user.products}</td>
            <td>
                <span class="status
                    <c:choose>
                        <c:when test="${user.status eq 'Approved'}"> approved</c:when>
                        <c:when test="${user.status eq 'Rejected'}"> rejected</c:when>
                        <c:otherwise> pending</c:otherwise>
                    </c:choose>">
                    ${user.status}
                </span>
            </td>

            <!-- Delivery Status Dropdown -->
            <td>
                <form action="updatedelivery" method="post">
                    <input type="hidden" name="order_id" value="${user.order_id}" />
                    <select name="delivery_status" onchange="this.form.submit()">
                        <option value="Not Delivered" <c:if test="${user.delivery_status eq 'Not Delivered'}">selected</c:if>>Not Delivered</option>
                        <option value="On the Way" <c:if test="${user.delivery_status eq 'On the Way'}">selected</c:if>>On the Way</option>
                        <option value="Delivered" <c:if test="${user.delivery_status eq 'Delivered'}">selected</c:if>>Delivered</option>
                    </select>
                </form>
                <c:if test="${user.delivery_status eq 'Delivered'}">
    <br/>
    <a href="bills/Invoice_Order_${user.order_id}.pdf" target="_blank" class="btn btn-sm btn-success mt-2">
        Download Bill
    </a>
</c:if>

            </td>

            <!-- Approve/Reject Buttons -->
            <td>
                <form action="manageorder" method="post">
                    <input type="hidden" name="order_id" value="${user.order_id}" />
                    <input type="submit" value="Approve" name="btn" class="btn btn-approve" />
                    <input type="submit" value="Reject" name="btn" class="btn btn-reject" />
                </form>
            </td>
        </tr>
    </c:forEach>
</tbody>
                </div>
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