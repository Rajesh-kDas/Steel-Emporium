<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Admin Dashboard</title>

  <!-- CSS -->
  <link rel="stylesheet" href="vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <link rel="stylesheet" href="css/style1.css">

  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <style>
    .stats-card {
      background: linear-gradient(135deg, #0c7424, #01714f);
      color: #fff;
      padding: 25px;
      border-radius: 12px;
      text-align: center;
      font-size: 22px;
      font-weight: bold;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
    }
  </style>
</head>
<body>
  <div class="container-scroller">

    <!-- Navbar -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo me-5" href="#">Welcome <%=session.getAttribute("name")%></a>
        <a class="navbar-brand brand-logo-mini" href="#">Admin</a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <ul class="navbar-nav navbar-nav-right mt-3">
          <li><a class="dropdown-item" href="index"><i class="ti-power-off text-primary"></i> Logout</a></li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid page-body-wrapper">
      <!-- Sidebar -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item"><a class="nav-link" href="admindashboard"><i class="ti-shield menu-icon"></i><span class="menu-title">Dashboard</span></a></li>
          <li class="nav-item"><a class="nav-link" href="allproduct"><i class="ti-package menu-icon"></i><span class="menu-title">All Products</span></a></li>
          <li class="nav-item"><a class="nav-link" href="addproduct"><i class="ti-plus menu-icon"></i><span class="menu-title">Add Products</span></a></li>
          <li class="nav-item"><a class="nav-link" href="viewcustomer"><i class="ti-user menu-icon"></i><span class="menu-title">View Customer</span></a></li>
          <li class="nav-item"><a class="nav-link" href="vieworder"><i class="ti-shopping-cart menu-icon"></i><span class="menu-title">View Orders</span></a></li>
          <li class="nav-item"><a class="nav-link" href="showfaq"><i class="ti-help menu-icon"></i><span class="menu-title">FAQ</span></a></li>
          <li class="nav-item"><a class="nav-link" href="viewcontact"><i class="ti-email menu-icon"></i><span class="menu-title">Contact</span></a></li>
        </ul>
      </nav>

      <!-- Dashboard Content -->
      <div class="main-panel">
        <div class="content-wrapper">

          <!-- Stats Row -->
          <div class="row mb-4">
            <div class="col-md-4"><div class="stats-card">Users <br> ${totalUsers}</div></div>
            <div class="col-md-4"><div class="stats-card">Products <br> ${totalProducts}</div></div>
            <!-- <div class="col-md-4"><div class="stats-card">Orders <br> ${totalOrders}</div></div> -->
          </div>

          <!-- Graphs -->
          <div class="row">
            <div class="col-md-4">
              <div class="card p-3">
                <h5>Order Status</h5>
                <canvas id="orderStatusChart"></canvas>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card p-3">
                <h5>Delivery Status</h5>
                <canvas id="deliveryChart"></canvas>
              </div>
            </div>
            
          </div>

          <!-- Recent Orders -->
          <!-- <div class="card mt-4 p-3">
            <h5>Recent Orders</h5>
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Order ID</th>
                  <th>User</th>
                  <th>Products</th>
                  <th>Status</th>
                  <th>Delivery</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="order" items="${recentOrders}">
                  <tr>
                    <td>${order.order_id}</td>
                    <td>${order.user_id}</td>
                    <td>${order.productsname}</td>
                    <td>${order.order_status}</td>
                    <td>${order.delivery_status}</td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div> -->

        </div>
      </div>
    </div>
  </div>

  <!-- JS -->
  <script src="vendors/base/vendor.bundle.base.js"></script>

  <!-- Chart Data -->
  <script>
    // Order Status Chart
    new Chart(document.getElementById("orderStatusChart"), {
      type: "pie",
      data: {
        labels: ["Approved", "Rejected"],
        datasets: [{
  data: [<c:out value="${approvedCount}"/>, <c:out value="${rejectedCount}"/>],
  backgroundColor: ["#28a745", "#dc3545"]
}]

      }
    });

    // Delivery Status Chart
    const deliveryLabels = [
      <c:forEach var="d" items="${deliveryStats}">"${d.delivery_status}",</c:forEach>
    ];
    const deliveryCounts = [
      <c:forEach var="d" items="${deliveryStats}">${d.count},</c:forEach>
    ];
    new Chart(document.getElementById("deliveryChart"), {
      type: "doughnut",
      data: {
        labels: deliveryLabels,
        datasets: [{
          data: deliveryCounts,
          backgroundColor: ["#007bff", "#ffc107", "#6f42c1", "#20c997"]
        }]
      }
    });

    // Top Buyers Chart
    const buyerLabels = [
      <c:forEach var="u" items="${userPurchaseList}">"${u.username}",</c:forEach>
    ];
    const buyerCounts = [
      <c:forEach var="u" items="${userPurchaseList}">${u.order_count},</c:forEach>
    ];
    new Chart(document.getElementById("topBuyersChart"), {
      type: "bar",
      data: {
        labels: buyerLabels,
        datasets: [{
          label: "Orders",
          data: buyerCounts,
          backgroundColor: "#17a2b8"
        }]
      },
      options: { responsive: true, plugins: { legend: { display: false } } }
    });
  </script>
</body>
</html>
