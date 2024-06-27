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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css"> 
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> 

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  
        <link rel="stylesheet" href="View/CSS/staff.css">
        <style>
            #search-container {
                position: relative;
                width: 300px;
            }
            #results {
                border: 1px solid #ccc;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background-color: #fff;
                z-index: 1000;
                max-height: 200px;
                overflow-y: auto;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }
            .result-item {
                display: flex;
                padding: 10px;
                border-bottom: 1px solid #ddd;
                cursor: pointer;
            }
            .result-item:last-child {
                border-bottom: none;
            }
            .result-item:hover {
                background-color: #f1f1f1;
            }
        </style>
    </head>

    <body>
        <!-- HEADER -->
        <div class="background-header">
            <div class="header-all">
                <div class="header-left">

                    <input type="search" id="handleTextSearch" placeholder="Tìm hàng hóa">
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <div id="results"></div> 
                    <!--                    <div class="background-bill">
                                            <div class="bill">
                                                <b>Hóa đơn 1</b>
                                                <i class="fa-regular fa-circle-xmark"></i>
                                            </div>
                                            <div class="horver-icon">
                                                <i class="fa-regular fa-circle-xmark"></i>
                                            </div>
                                        </div>-->
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
                    <c:forEach items="${productOrder}" varStatus="pIndex" var="p">  
                        <div class="list-item">
                            <div class="item-left"> 
                                <span>${pIndex.index + 1}</span> 
                                <a href="#" onclick= "handleDelete('${p.getProductID()}')" >
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
                                                    <button class="quantity-item-minus" id="sub" onclick="handleQuantity('sub', '${p.getProductID()}', event)">-</button>
                                                    <span></span>
                                                    <input type="text" required min="1" id="quantity${p.getProductID()}" value="1" onchange="handleChange('${p.getProductID()}')"/>
                                                    <button class="quantity-item-plus" id="add" onclick="handleQuantity('add', '${p.getProductID()}', event)">+</button> 
                                                </div> 
                                                <div class="item-space"></div>
                                                <div class="item-price">
                                                    <div class="sale">
                                                        <span id="price${p.getProductID()}"><fmt:formatNumber>${p.getSale_price()}</fmt:formatNumber></span>
                                                            <hr>
                                                        </div>
                                                        <div class="totalSale">
                                                            <span id="getTotalPrice${p.getProductID()}"><fmt:formatNumber>${p.getSale_price()}</fmt:formatNumber></span>
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
            </div> 
            <div class="main-right">
                <div class="main-right-container">
                    <div class="cart-header-control">
                        <p></p>
                        <div class="getDate">date</div>
                    </div>
                    <hr class="hr">

                    <form>
                        <div class="main-right-body">
                            <h3>Khách hàng</h3>
                            <div class="customer-type">
                                <label>
                                    <input type="checkbox" />Khách lẻ
                                </label>
                                <div class="customer-type-info">
                                    <input id="phoneNumber" name="phone" type="text" placeholder="Nhập số điện thoại khách hàng" />
                                    <input id="nameCustomer"name="name" type="text" placeholder="Nhập tên khách hàng" />
                                </div> 
                            </div> 
                            <div class="total-price-bill">
                                <div class="total-price-bill-detail">
                                    <span>Tổng tiền hàng</span> 
                                </div>
                                <input readonly type="text" id="total-order"/>
                            </div>
                            <div class="sale button">
                                <span>Giảm giá (%)</span>
                                <input id="discount" type="text" value="0"/>
                            </div>
                            <div class="customer-need">
                                <span>Khách cần trả</span>
                                <input readonly type="text" id="total-pay"/>
                            </div>
                            <div class="customer-pay button">
                                <span>Khách thanh toán</span>
                                <input type="text" id="payed-money"/> 
                            </div>
                            <div class="customer-pay button">
                                <span>Tiền thừa: </span>
                                <input readonly type="text" id="refund-money"/> 
                            </div>
                        </div>

                        <div class="payment-method">
                            <p>
                                <input type="radio" name="payment" value="1"> Tiền mặt
                            </p>
                            <p>
                                <input type="radio" name="payment" value="2"> Chuyển khoản
                            </p>
                        </div> 
                        <div class="hint-price">
                            <div class="hint-price-top horver">
                                <button type="button" onclick="handleHint('10.000')" class="price">10.000</button>
                                <button type="button" onclick="handleHint('20.000')" class="price">20.000</button>
                                <button type="button" onclick="handleHint('30.000')" class="price">30.000</button>
                                <button type="button" onclick="handleHint('50.000')" class="price">50.000</button>
                            </div>
                            <div class="hint-price-bottom horver">
                                <button type="button" onclick="handleHint('100.000')" class="price">100.000</button>
                                <button type="button" onclick="handleHint('200.000')" class="price">200.000</button>
                                <button type="button" onclick="handleHint('300.000')" class="price">300.000</button>
                                <button type="button" onclick="handleHint('500.000')" class="price">500.000</button>
                            </div>
                        </div> 
                        <div class="payment-btn">
                            <button onclick="getQrCode()" id="payorder" class="btn" data-toggle="modal" data-target="#payOrder" type="button">Thanh toán</button>
                        </div>
                    </form> 
                </div>
            </div>
            <div class="modal fade" id="payOrder">
                <div class="modal-dialog modal-dialog-centered" >
                    <div class="modal-content"> 
                        <div class="modal-header">
                            <h4>Thông tin thanh toán</h4>
                        </div>
                        <div class="modal-body">
                            <img id="qrcode" src="" alt="QR Code" style="display:none; margin-top: 20px; width: 100%; max-width: 500px;">
                            <h4 style="text-align: center; color: blue" id="info"><i></i></h4>
                            <h4 style="text-align: center; color: blue" id="showtotal"><i></i></h4>
                        </div>
                        <div class="modal-footer">
                            <button id="submitForm" class="btn btn-success" type="submit">Hoàn tất</button>
                            &nbsp;
                            <button class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        </div>
                    </div>
                </div>
            </div> 
        </div>  
        <script src="View/JS/getdate.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
        <script>
                                document.addEventListener('DOMContentLoaded', function () {
                                    getTotalPay();
                                })
                                function getQrCode() {
                                    var total_pay = document.getElementById('total-pay');
                                    const Bank_ID = "MB";
                                    const Account_ID = "0352986307";
                                    const amount = formatNumber(total_pay.value);
                                    const decription = "Thanh toán đơn h";
                                    const accountName = "Dao Trong Khoi";
                                    var qr = document.getElementById('qrcode');
                                    var info = document.getElementById('info');
                                    var total = document.getElementById('showtotal');
                                    info.textContent = "Scan QR To Pay";
                                    total.textContent = "Tổng số tiền cần thanh toán: " + formatInput(amount);
                                    qr.src = "https://img.vietqr.io/image/" + Bank_ID + "-" + Account_ID + "-compact.png?amount=" + amount + "&addInfo=" + decription + "&accountName=" + accountName;
                                    qr.style.display = 'block';
                                    console.log(qr.src);
                                }
                                document.getElementById('discount').addEventListener('input', function () {
                                    var discount = document.getElementById('discount').value;
                                    var total_pay = document.getElementById('total-pay');
                                    var totalOrder = document.getElementById('total-order');
                                    var totalValue = formatNumber(totalOrder.value);
                                    if (discount > 0) {
                                        total_pay.value = formatInput((totalValue - (totalValue / 100 * discount)));
                                    } else {
                                        total_pay.value = totalValue;
                                    }
                                })
                                document.getElementById('payed-money').addEventListener('input', function () {
                                    var payedInput = document.getElementById('payed-money');
                                    var value = payedInput.value.replace(/\D/g, '');
                                    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
                                    payedInput.value = value;
                                    handleRefund();
                                })
                                function handleRefund() {
                                    var payed_input = document.getElementById('payed-money');
                                    var payedValue = formatNumber(payed_input.value);
                                    var refund_money = document.getElementById('refund-money');
                                    var total_pay = document.getElementById('total-pay');
                                    var refundValue = 0;
                                    var totalVlue = formatNumber(total_pay.value);
                                    if (payedValue - totalVlue >= 0) {
                                        refundValue = payedValue - totalVlue;
                                    }
                                    refund_money.value = refundValue == 0 ? 0 : formatInput(refundValue);
                                }
                                function formatInput(value) {
                                    value = value.toString().replace(/\D/g, '');
                                    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
                                }
                                function formatNumber(input) {
                                    return input.replace(/\D/g, '');
                                }
                                function handleHint(price) {
                                    var payed_input = document.getElementById('payed-money');
                                    payed_input.value = price;
                                    handleRefund();
                                }
                                function getTotalPay() {
                                    var total = 0;
                                    var productItems = document.querySelectorAll('.totalSale span');
                                    var totalOrder = document.getElementById('total-order');
                                    var totalPay = document.getElementById('total-pay');
                                    productItems.forEach((productItem) => {
                                        var value = formatNumber(productItem.textContent);
                                        total += parseFloat(value);
                                    });
                                    totalOrder.value = formatInput(total);
                                    totalPay.value = formatInput(total);
                                }
                                function handleChange(pID) {
                                    var quantity = document.getElementById('quantity' + pID).value;
                                    var totalPrice = document.getElementById('getTotalPrice' + pID);
                                    var price = formatNumber((document.getElementById('price' + pID).textContent));
                                    if (quantity > 0) {
                                        totalPrice.textContent = formatInput(quantity * parseFloat(price));
                                    }
                                    getTotalPay();
                                    handleRefund();
                                }
                                function handleQuantity(type, pID, event) {
                                    event.preventDefault();
                                    var quantity = document.getElementById('quantity' + pID);
                                    var quantityValue = parseInt(quantity.value);
                                    var price = formatNumber((document.getElementById('price' + pID).textContent));
                                    var totalPrice = document.getElementById('getTotalPrice' + pID);
                                    if (type === "add") {
                                        quantityValue += 1;
                                    } else {
                                        if (quantityValue > 1) {
                                            quantityValue -= 1;
                                        }
                                    }
                                    quantity.value = quantityValue;
                                    totalPrice.textContent = formatInput(quantityValue * parseFloat(price));
                                    getTotalPay();
                                    handleRefund();
                                }
                                function handleDelete(pID) {
                                    var productItems = document.querySelectorAll('.list-item');
                                    productItems.forEach((product, index) => {
                                        var productID = product.querySelector('.item-info-top span').textContent;
                                        if (productID === pID) {
                                            productItems[index].remove();
                                        }
                                    })
                                    getTotalPay();
                                    handleRefund();
                                }
                                function handleSubmit(id) {
                                    var form = document.getElementById('formSubmit');
                                    form.action = "search?pID=" + id;
                                    form.submit();
                                }
                                document.getElementById('phoneNumber').addEventListener('input', function () {
                                    var text = document.getElementById('phoneNumber');
                                    var inputName = document.getElementById('nameCustomer');
                                    $.ajax({
                                        url: 'CustomerSearch',
                                        type: 'GET',
                                        data: {
                                            textSearch: text.value
                                        },
                                        success: function (response) {
                                            $('#results').empty();
                                            if (response.length > 0) {
                                                response.forEach(function (customer) {
                                                    var items = $(
                                                            '<div class="result-item"><form id="formSubmit" method="post"><div class="item-name">' +
                                                            customer.name +
                                                            '</div></form></div>'
                                                            );
                                                    items.on('click', function () {
                                                        text.value = customer.phoneNumber;
                                                        inputName.value = customer.name;
                                                        $('#results').empty();
                                                    });
                                                    $('#results').append(items);
                                                });
                                            } else {
                                                $('#results').empty();
                                            }
                                        }
                                    });
                                });
                                document.getElementById('handleTextSearch').addEventListener('input', function () {
                                    var text = document.getElementById('handleTextSearch');
                                    $.ajax({
                                        url: 'search',
                                        type: 'GET',
                                        data: {
                                            textSearch: text.value
                                        },
                                        success: function (response) {
                                            $('#results').empty();
                                            if (response.length > 0) {
                                                response.forEach(function (product) {
                                                    var items = $(
                                                            '<div class="result-item"><form id="formSubmit" method="post"><div class="item-name" id="handleitemselected">' +
                                                            product.productName +
                                                            '</div></form></div>'
                                                            );
                                                    items.on('click', function () {
                                                        handleSubmit(product.productID);
                                                        text.value = "";
                                                        $('#results').empty();
                                                    });
                                                    $('#results').append(items);
                                                });
                                            } else {
                                                $('#results').empty();
                                                $('#results').append('<div class="result-item">Không tìm thấy sản phẩm.</div>');
                                            }
                                        }
                                    });
                                });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
