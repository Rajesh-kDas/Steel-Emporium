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
            <div class="container-fluid py-4">
          <div class="row">
              <div class="col-12">
                <div class="card mb-4">
                  <div class="card-header pb-0">
                    <h6>FAQ Table</h6>
                      </div>
                           <div class="card-body px-0 pt-0 pb-2">
                         <div class="table-responsive p-0">
                          <table class="table align-items-center mb-0" id="dataTable">
                                    <thead>
                          <tr>
                       <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Sl No.
                                                       </th>
                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Question
                            </th>
                              <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                              Answer
                            </th>
                           <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                           Action</th>
                               </tr>
                     </thead> 
                                                    <tbody>
                                              <c:forEach var="faq" items="${faqlist}">
                                                <tr>
                                                  <td>${faq.sl_no}</td>
                                                  <td>${faq.question}</td>
                                                  <td>${faq.answer}</td>
                                                  <td>
                                                     <!-- Update Button -->
                                                        <button class="btn btn-sm btn-primary"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#updateModal"
                                                                data-id="${faq.sl_no}"
                                                                data-question="${faq.question}"
                                                                data-answer="${faq.answer}">
                                                            Update
                                                        </button>

                                                        <!-- Delete Button -->
                                                        <button class="btn btn-sm btn-danger"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#deleteModal"
                                                                data-id="${faq.sl_no}">
                                                            Delete
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
                      




                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

            <!-- 🔹 Add Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="addfaq" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Add FAQ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label>Question</label>
                            <input type="text" class="form-control" name="question" required>
                        </div>
                        <div class="mb-3">
                            <label>Answer</label>
                            <textarea class="form-control" name="answer" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success">Add</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 🔹 Update Modal -->
    <div class="modal fade" id="updateModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="updatefaq" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Update FAQ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="sl_no" id="updateId">

                        <div class="mb-3">
                            <label>Question</label>
                            <input type="text" class="form-control" name="question" id="updateQuestion" required>
                        </div>
                        <div class="mb-3">
                            <label>Answer</label>
                            <textarea class="form-control" name="answer" id="updateAnswer" rows="3" required></textarea>
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

    <!-- 🔹 Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="dltfaq" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title">Delete FAQ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this FAQ?</p>
                        <input type="hidden" name="sl_no" id="deleteId">
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger">Yes, Delete</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Pass data to Update Modal
        var updateModal = document.getElementById('updateModal');
        updateModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            document.getElementById('updateId').value = button.getAttribute('data-id');
            document.getElementById('updateQuestion').value = button.getAttribute('data-question');
            document.getElementById('updateAnswer').value = button.getAttribute('data-answer');
        });

        // Pass data to Delete Modal
        var deleteModal = document.getElementById('deleteModal');
        deleteModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            document.getElementById('deleteId').value = button.getAttribute('data-id');
        });
    </script>

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