<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Model.OrderSupplier" %>
<%@page import="Model.OrderSupplierDetail" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <title>Chi tiết nhà cung cấp</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/CSS/main.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/View/CSS/supplier.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <style>
            .required-label::after {
                content: '*';
                color: red;
                margin-left: 4px;
            }
            input[type=number]::-webkit-inner-spin-button,
            input[type=number]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
            .btn-primary, .btn-cancel {
                margin: 5px;
            }
        </style>
    </head>
    <body class="app sidebar-mini rtl">
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
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><b>Chi tiết đặt sản phẩm nhà cung cấp</b></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row mb-4">
                                <div class="col-sm-2">
                                    <a class="btn btn-success btn-block text-white" title="Thêm" data-toggle="modal" data-target="#addOrderHistoryModal"><i class="fas fa-plus"></i> Lịch sử đặt hàng</a>
                                </div>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="addOrderHistoryModal" tabindex="-1" role="dialog" aria-labelledby="addOrderHistoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addOrderHistoryModalLabel">Thêm Lịch sử đặt hàng</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="addOrderHistoryForm">
                                                <div class="form-group">
                                                    <label for="productName" class="required-label">Tên sản phẩm</label>
                                                    <input type="text" class="form-control" id="productName" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="quantity" class="required-label">Số lượng nhập</label>
                                                    <input type="number" class="form-control" id="quantity" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="price" class="required-label">Giá nhập</label>
                                                    <input type="number" class="form-control" id="price" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="date" class="required-label">Ngày nhập</label>
                                                    <input type="date" class="form-control" id="date" required>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Thêm</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-4">
                                <h4 class="font-weight-bold">Thông tin sản phẩm nhà cung cấp</h4>
                                <% String nameSupplier = (String) request.getAttribute("supplierName");
                                   if (nameSupplier != null && !nameSupplier.isEmpty()) { %>
                                <p>Tên nhà cung cấp: <span class="font-italic"><%= nameSupplier %></span></p>
                                    <% } %>
                            </div>
                            <div>
                                <table class="table table-hover table-bordered" id="sampleTable">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Mã nhập hàng</th>
                                            <th>Tên sản phẩm</th>
                                            <th>Số lượng nhập</th>
                                            <th>Giá nhập</th>
                                            <th>Ngày nhập</th>
                                            <th>Chức năng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<OrderSupplierDetail> listOrderSupplierDetail = (List<OrderSupplierDetail>) request.getAttribute("listOrderSupplierDetail");
                                           if (listOrderSupplierDetail != null && !listOrderSupplierDetail.isEmpty()) {
                                               for (OrderSupplierDetail osd : listOrderSupplierDetail) { %>
                                        <tr>
                                            <td>OS<%= osd.getOrderSupplierId().getId()%></td>
                                            <td><%= osd.getProductId().getProductName()%></td>
                                            <td><%= osd.getQuantity()%></td>
                                            <td><%= osd.getPrice()%></td>
                                            <td><%= osd.getOrderSupplierId().getDate()%></td>
                                            <td>
                                                <button class="btn btn-danger btn-sm" type="button" title="Xóa" onclick="confirmDelete('<%= osd.getId() %>', '<%= osd.getProductId().getProductName() %>', '<%= osd.getOrderSupplierId().getSupplierId().getId()%>');"><i class="fas fa-trash-alt"></i></button>
                                            </td>
                                        </tr>
                                        <% 
                                            }
                                          } 
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <button class="btn btn-cancel btn-secondary" type="button" onclick="window.location.href = 'supplier'">Quay lại trang</button>
                        </div>
                    </div>
                </div>
            </div>
            <div></div>
        </main>
        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-table2excel@1.1.0/dist/jquery.table2excel.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
        <script src="${pageContext.request.contextPath}/View/Admin/js/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js"></script>
        <script>
                                $(document).ready(function () {
                                    $('#sampleTable').DataTable();
                                });
                                function confirmDelete(orderDetailSupplierId, productName, supplierId) {
                                    Swal.fire({
                                        title: 'Bạn chắc chắn muốn xóa?',
                                        text: 'Xóa sản phẩm ' + orderDetailSupplierId + productName + ' từ nhà cung cấp vĩnh viễn!',
                                        icon: 'warning',
                                        showCancelButton: true,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: 'Xóa',
                                        cancelButtonText: 'Hủy bỏ'
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            window.location.href = 'suppliermanager?type=deletedp&deleteOSD=' + orderDetailSupplierId + '&viewsupplier=' + supplierId;
                                        }
                                    });
                                }
        </script>
    </body>
</html>
