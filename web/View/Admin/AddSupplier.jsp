<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Nhà Cung Cấp</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/CSS/main.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/CSS/addsupplier.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body class="app sidebar-mini rtl">
        <% 
       String message = (String) request.getAttribute("message");
       if (message != null && !message.isEmpty()) { 
        %>
        <script>
            Swal.fire({
                title: "Thông Báo",
                text: "<%= message %>",
                icon: '<%= message.contains("thành công") ? "success" : "error" %>',
                timer: 1500,
                showConfirmButton: false
            });
        </script> 
        <% 
            } 
        %>
        <header class="app-header">
            <a class="app-sidebar__toggle" data-toggle="sidebar" aria-label="Hide Sidebar">
                <i class="bx bx-menu"></i>
            </a>
            <ul class="app-nav">
                <li><a class="app-nav__item" href="logout"><i class="fas fa-sign-out-alt"></i></a></li>
            </ul>
        </header>
        <%@include file="SidebarMenu.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Quản lý nhà cung cấp</li>
                    <li class="breadcrumb-item">Thêm nhà cung cấp</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới nhà cung cấp</h3>
                        <div class="tile-body">
                            <form class="row" action="addsupplier" method="post">
                                <div class="form-group col-md-3">
                                    <label class="control-label required-label">Tên nhà cung cấp</label>
                                    <input class="form-control" type="text" required name="nameSupplier">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label required-label">Số điện thoại</label>
                                    <input class="form-control" type="text" required name="phoneSupplier" >                       
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label required-label">Địa chỉ</label>
                                    <input class="form-control" type="text" required name="addressSupplier" >
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Email</label>
                                    <input class="form-control" type="email" name="emailSupplier" >
                                </div>
                                <div class="btn-action">
                                    <button class="btn btn-save" type="submit">Lưu lại</button>
                                    <button class="btn btn-cancel" type="button" onclick="window.location.href = 'supplier'">Hủy bỏ</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
