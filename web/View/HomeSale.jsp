<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico"> 
        <title>Trang bán hàng</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="View/CSS/staff.css">
    </head>
    <body>
        <!-- HEADER -->
        <div class="background-header">
            <div class="header-all">
                <div class="header-left">
                    <input type="search" name id placeholder="Tìm hàng hóa">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <div class="background-bill">
                        <div class="bill">
                            <b>Hóa đơn 1</b>
                            <i class="fa-regular fa-circle-xmark"></i>
                        </div>
                        <div class="horver-icon">
                            <i class="fa-regular fa-circle-xmark"></i>
                        </div>
                    </div>
                </div>
                <div class="header-right">
                    <span>${account.getUsername()}</span>
                    <a href="Logout">
                        <i class="fa-solid fa-right-from-bracket"></i>
                    </a>
                </div>
            </div>
        </div> 
        <!-- MAIN -->
        <div class="main">
            <div class="main-left">
                <div class="scroll-item">
                    <c:forEach items="${listProduct}" var="p"> 
                    <div class="list-item">
                        <div class="item-left">
                            <sapn></sapn>
                            <a href>
                                <i class="fa-regular fa-trash-can"></i>
                            </a> 
                            <div class="item-content">
                                <div class="item-container">
                                    <div class="item-info">
                                        <div class="item-info-top">
                                            <span>${p.getProductID()}</span>
                                            <span>${p.getProductName()}</span>
                                        </div>
                                        <div class="item-info-botto">
                                            <div class="quantity">
                                                <div class="quantity-item-minus" >-</div>
                                                <div class="quantity-item-number">1</div>
                                                <div class="quantity-item-plus">+</div>
                                            </div>
                                            <div class="item-space"></div>
                                            <div class="item-price">
                                                <div class="item-change-price">
                                                    <span>10.000đ</span>
                                                    <hr>
                                                </div>
                                                <div class="item-change-price">
                                                    <span><fmt:formatNumber>${p.getPrice()}</fmt:formatNumber></span>
                                                    <hr>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<!--                        <div class="item-action">
                            <a href>
                                <i class="fa-solid fa-plus"></i>
                            </a>
                            <a href>
                                <i class="fa-solid fa-ellipsis-vertical"></i>
                            </a>
                        </div>-->
                    </div>
                    </c:forEach>
                </div>
                <div class="main-left-note">
                    <input type="text" name id placeholder="Ghi chú đơn hàng">
                    <div class="total-price">
                        <span>Tổng tiền hàng: 0</span>
                        <span>274.000</span>
                    </div>
                </div>
            </div> 
            <div class="main-right">
                <div class="main-right-container">
                    <div class="cart-header-control">
                        <p></p>
                        <div class="getDate">date</div>
                    </div>
                    <hr class="hr">

                    <div class="main-right-body">
                        <h3>Khách hàng</h3>
                        <div class="customer-type">
                            <label>
                                <input type="checkbox" />Khách lẻ
                            </label>
                            <div class="customer-type-info">
                                <input type="text" placeholder="Nhập số điện thoại khách hàng" />
                                <input type="text" placeholder="Nhập tên khách hàng" />
                            </div> 
                        </div> 
                        <div class="total-price-bill">
                            <div class="total-price-bill-detail">
                                <span>Tổng tiền hàng</span>
                                <span>4</span>
                            </div>
                             <span>64000</span>
                        </div>
                        <div class="sale button">
                            <span>Giảm giá</span>
                            <button class="button-bill span">
                                <span>0</span>
                            </button>
                        </div>
                        <div class="customer-need">
                            <span>Khách cần trả</span>
                            <span>64000</span>
                        </div>
                        <div class="customer-pay button">
                            <span>Khách thanh toán</span>
                            <button class="button-bill span">
                                <span>0</span>
                            </button>
                        </div>
                    </div>
                    
                    <div class="payment-method">
                        <p>
                            <input type="radio" name="payment"> Tiền mặt
                        </p>
                        <p>
                            <input type="radio" name="payment"> Chuyển khoản
                        </p>
                    </div>

                    <div class="hint-price">
                        <div class="hint-price-top horver">
                            <button class="price">10,000</button>
                            <button class="price">20,000</button>
                            <button class="price">30,000</button>
                            <button class="price">50,000</button>
                        </div>
                        <div class="hint-price-bottom horver">
                            <button class="price">100,000</button>
                            <button class="price">200,000</button>
                            <button class="price">300,000</button>
                            <button class="price">500,000</button>
                        </div>
                    </div> 
                    <div class="payment-btn">
                        <button class="btn">Thanh toán</button>
                    </div>
                </div>
            </div>
        </div> 
        <!-- FOOTER -->
        <div class="background-footer">
            <div class="footer">
                <i class="fa-solid fa-phone"></i>
                <span>0363630653</span>
            </div>
        </div>
        <script src="View/JS/getdate.js"></script>
    </body>
</html>
