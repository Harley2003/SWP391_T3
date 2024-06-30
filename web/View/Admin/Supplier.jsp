<%-- 
    Document   : Staff
    Created on : May 30, 2024, 11:09:14 AM
    Author     : ADMIN
--%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Quản Lí Nhà Cung Cấp</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <link rel="stylesheet" type="text/css" href="View/CSS/main.css">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">  
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"> 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css"> 
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        
    </head> 
    <body class="app sidebar-mini rtl">
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button-->
            <a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
               aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav"> 
                <!-- User Menu-->
                <li><a class="app-nav__item" href="login"><i class="fa-solid fa-arrow-right-from-bracket"></i></a> 
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <jsp:include page="SidebarMenu.jsp"></jsp:include>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>Danh sách nhà cung cấp</b></a></li>
                </ul> 
            </div>  
            <div class="row">
                <c:if test="${message != null}">
                <script>
                    Swal.fire({
                        title: "Thông Báo",
                        text: "${message}", 
                        icon: 'success',
                        timer: 1500
                });
                </script> 
            </c:if>
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2"> 
                                    <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#AddSupplier" title="Thêm"><i class="fas fa-plus"></i>
                                        Thêm nhà cung cấp
                                    </a>
                                </div>
                                <div class="col-sm-2">
                                    <a class="btn btn-add btn-sm" href title="In"><i class="fas fa-file-excel"></i> 
                                        Xuất Excel
                                    </a>
                                </div>
                            </div>  
                            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
                                   id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Tên nhà cung cấp</th>
                                        <th>Số điện thoại</th>
                                        <th>Địa chỉ</th>
                                        <th>Email</th> 
                                        <th>Thao tác</th>  
                                    </tr>
                                </thead>
                                <tbody> 
                                    <c:forEach items="${listSupplier}" var="s">
                                        <tr>
                                            <td>${s.getId()}</td>
                                            <td>${s.getName()}</td>  
                                            <td>${s.getPhone()}</td> 
                                            <td>${s.getAddress()}</td> 
                                            <td>${s.getEmail()}</td>  
                                            <td>
                                                <form id="dialogForm" method="post"> 
                                                <button class="btn btn-primary btn-sm edit" type="button"
                                                        data-toggle="modal" data-target="#Edit${u.getUserID()}"> 
                                                <i class="fa-solid fa-pen-to-square"></i>
                                                </button>   
                                                <button 
                                                    class="btn btn-primary btn-sm trash" onclick="showConfirmDialog('${u.getUserID()}', '${u.getUsername()}')" type="button"> <i class='fas fa-trash'></i>
                                                </button>  
                                                </form>
                                            </td>
                                        </tr>   
                                        <!--Modal Edit-->
                                        <div class="modal fade" id="Edit${u.getUserID()}">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">  
                                                    <form method="POST" action="staffmanager?action=edit&uID=${u.getUserID()}">
                                                        <div class="modal-body">
                                                            <h3 style="margin: 15px 0 15px 0; text-align: center" class="tile-title">Chỉnh Sửa Thông Tin Nhân Viên</h3> 
                                                            <div class="form-group col-md-6"> 
                                                                <label class="control-label">Họ</label>
                                                                <input class="form-control" name="firstname" type="text" value="${u.getInfo().getName().split(" ")[0]}">  
                                                            </div>
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Tên</label>
                                                                <input class="form-control" name="lastname" type="text" value="${u.getInfo().getName().split(" ")[1]}"> 
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Password</label>
                                                                <input class="form-control" name="password" type="password" value="${u.getPassword()}"> 
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                 <label class="control-label">Ngày Sinh</label>
                                                                 <input class="form-control" name="date" type="date" value="${u.getInfo().getDate()}">
                                                            </div> 
                                                             
                                                            <div class="form-group col-md-6">
                                                                <label class="control-label">Giới tính</label>
                                                                <select class="form-control" name="gender">
                                                                    <option ${u.getInfo().getGender() == 1 ? "selected":""} value="1">Nam</option>
                                                                    <option ${u.getInfo().getGender() == 0 ? "selected":""} value="0">Nữ</option>
                                                                </select>   
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Số điện thoại</label>
                                                                <input class="form-control" name="phone" type="text" value="${u.getInfo().getPhone()}"> 
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Địa chỉ</label>
                                                                <input class="form-control" name="address" type="text" value="${u.getInfo().getAddress()}">
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Email</label>
                                                                <input class="form-control" name="email" type="text" value="${u.getInfo().getEmail()}">
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Trạng thái</label>
                                                                <select class="form-control" name="status">
                                                                    <option ${u.getStatus() == 1 ? "selected":""} value="1">Activated</option>
                                                                    <option ${u.getStatus() == 2 ? "selected":""} value="2">UnActivated</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group  col-md-6">
                                                                <label class="control-label">Role</label> 
                                                                <select class="form-control" name="role">
                                                                    <c:forEach items="${listRole}" var="r">
                                                                        <c:if test="${r.getRoleID() != 1}">
                                                                            <option ${r.getRoleID() == 3 ? "selected":""} value="${r.getRoleID()}">${r.getRoleName()}</option>
                                                                        </c:if>
                                                                    </c:forEach> 
                                                            </select>
                                                            </div> 
                                                            <div class="form-group  col-md-6">
                                                                <button class="btn btn-save" type="submit">Update</button>
                                                                <a class="btn btn-cancel"  href="staffmanager">Hủy bỏ</a> 
                                                            </div>
                                                        </div>
                                                    </form>  
                                                </div>
                                            </div>
                                        </div>
                                        <!--/Modal Edit-->
                                    </c:forEach>
                                </tbody>
                            </table> 
                        </div>
                    </div>
                </div>
            </div>
            <!-- Model Add -->
            <div class="modal fade" id="AddSupplier">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">  
                    <form method="POST" action="supplier?action=add">
                        <div class="modal-body">
                            <h3 style="margin: 15px 0 15px 0; text-align: center" class="tile-title">Thêm nhà cung cấp</h3> 
                            <div class="row">
                                <div class="form-group col-md-6"> 
                                    <label class="control-label">Tên nhà cung cấp</label>
                                    <input class="form-control" name="name" placeholder="Nhập tên" type="text" required=""">   
                                </div> 
                                <div class="form-group col-md-6"> 
                                    <label class="control-label">Số điện thoại</label>
                                    <input class="form-control" name="phone" placeholder="Nhập số điện thoại" type="text" required=""">   
                                </div> 
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6"> 
                                    <label class="control-label">Địa chỉ</label>
                                    <input class="form-control" name="address" placeholder="Nhập địa chỉ" type="text" required=""">   
                                </div> 
                                <div class="form-group col-md-6"> 
                                    <label class="control-label">Email</label>
                                    <input class="form-control" name="email" placeholder="Nhập email" type="text" required=""">   
                                </div> 
                            </div>
                            <div>
                                <button class="btn btn-save" type="submit">Thêm</button>
                                <a class="btn btn-cancel"  href="supplier">Hủy bỏ</a> 
                            </div>
                        </div>
                    </form>  
                </div>
            </div>
        </div>
        </main> 
        <script>
                function showConfirmDialog(uID, uName) {
                var form = document.getElementById("dialogForm");
                var message = "Bạn có chắc chắn muốn xóa " + uName + " khỏi hệ thống ?"; 
                form.action = "staffmanager?action=delete"+ "&uID=" + uID;   
                Swal.fire({
                  title: "Thông Báo",
                  text: message,
                  icon: "warning",
                  showCancelButton: true,
                  confirmButtonColor: "#3085d6",
                  cancelButtonColor: "#d33",
                  confirmButtonText: "OK"
                }).then((result) => {
                  if (result.isConfirmed) { 
                    form.submit(); 
                  }
                });
              }
        </script>        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="admin/js/jquery-3.2.1.min.js"></script>
        <script src="admin/js/popper.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="admin/js/main.js"></script>
        <!-- The javascript plugin to display page loading on top-->
        <script src="admin/js/plugins/pace.min.js"></script>
        <!-- Page specific javascripts-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <!-- Data table plugin-->
        <script type="text/javascript" src="admin/js/plugins/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="admin/js/plugins/dataTables.bootstrap.min.js"></script>
        <script type="text/javascript">$('#sampleTable').DataTable();</script> 
    </body>

</html>
