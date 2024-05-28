<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico"> 
    <link rel="stylesheet" href="View/CSS/header-navbar.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  </head>
  <body> 
    <!-- main header -->
    <header id="mainHeader">
      <div class="container">
        <!-- section header top -->
        <section class="kv-header-top"> 
          <div class="kv-navbar kv-navbar-top">
            <ul class="kv-navbar-items">  
              <li class="kv-navbar-item">
                <p class="account-number">baday</p>
                <i class="kv-navbar-item-icon fas fa-solid fa-solid fa-user"></i>
                <ul class="kv-dropdown-list">
                  <li class="show-mobile"> 
                    <a class="kv-dropdown-link" onclick="EditProfile()"><i
                        class="far fa-user-circle fa-fw icon-item"></i><span class="binding">Tài
                        khoản</span></a>
                  </li> 
                  <li class="show-mobile">
                      <a class="kv-dropdown-link" href="Logout"><i
                        class="fa-solid fa-right-from-bracket fa-fw icon-item"></i><span
                        class="binding">Đăng xuất</span></a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </section>
      </div>
      <!-- section navbar main -->
      <section class="kv-navbar kv-navbar-main">
        <div class="container kv-navbar-container">
          <ul class="kv-navbar-items">
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-eye"></i>
              <p class="kv-navbar-item-content">Tổng quan</p>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-cube"></i>
              <p class="kv-navbar-item-content">Hàng hóa</p>
              <ul class="kv-dropdown-list scope">
                <li class="scope">
                  <a class="kv-dropdown-link" id="showProductLink" href="#"><i
                      class="fa-fw fas fa-solid fa-table-list icon-item"></i><span
                      class="binding">Danh mục</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link" id="showPriceBookLink" href="#"><i
                      class="fa-fw fas fa-solid fa-tags icon-item"></i><span
                      class="binding">Thiết lập giá</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link" id="showStockTakesLink" href="#"><i
                      class="fa-fw fas fa-solid fa-clipboard-check icon-item"></i><span
                      class="binding">Kiểm kho</span></a>
                </li>
              </ul>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-exchange"></i>
              <p class="kv-navbar-item-content">Giao dịch</p>
              <ul class="kv-dropdown-list scope">
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-inbox icon-item"></i><span
                      class="binding">Đặt
                      hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-file-invoice-dollar icon-item"></i><span
                      class="binding">Hóa đơn</span>
                  </a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-file-edit icon-item"></i><span
                      class="binding">Vận
                      đơn</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fa fa-reply-all icon-item"></i><span
                      class="binding">Trả
                      hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-solid fa-cart-flatbed icon-item"></i><span
                      class="binding">Nhập hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-solid fa-inbox icon-item"></i><span
                      class="binding">Trả hàng nhập</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-solid fa-hand-holding-dollar icon-item"></i><span
                      class="binding">Xuất hủy</span></a>
                </li>
              </ul>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-user-tie"></i>
              <p class="kv-navbar-item-content">Đối tác</p>
              <ul class="kv-dropdown-list scope">
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-user-alt icon-item"></i><span
                      class="binding">Khách
                      hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-users-line icon-item"></i><span
                      class="binding">Nhà
                      cung cấp</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-solid fa-people-carry-box icon-item"></i><span
                      class="binding">Đối tác giao hàng</span></a>
                </li>
              </ul>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-user-group"></i>
              <p class="kv-navbar-item-content">Nhân viên</p>
              <ul class="kv-dropdown-list scope">
                <li class="scope">
                  <a class="kv-dropdown-link" id="showEmployeeLink" href="#">
                    <i class="fa-fw fas fa-user-friends icon-item"></i>
                    <span class="binding">Nhân viên</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-calendar-alt icon-item"></i><span
                      class="binding">Chấm công</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-coins icon-item"></i><span
                      class="binding">Bảng tính
                      lương</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-sack-dollar icon-item"></i><span class="binding">Bảng
                      hoa hồng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fa fa-cog icon-item"></i><span
                      class="binding">Thiết lập
                      chung</span></a>
                </li>
              </ul>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-circle-dollar-to-slot"></i>
              <p class="kv-navbar-item-content">Sổ quỹ</p>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-chart-simple"></i>
              <p class="kv-navbar-item-content">Báo cáo</p>
              <ul class="kv-dropdown-list scope">
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-chart-pie icon-item"></i><span
                      class="binding">Cuối
                      ngày</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-paste icon-item"></i><span
                      class="binding">Bán
                      hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-inbox icon-item"></i><span
                      class="binding">Đặt
                      hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fa fa-cube icon-item"></i><span
                      class="binding">Hàng
                      hóa</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i class="fa-fw fas fa-user-alt icon-item"></i><span
                      class="binding">Khách
                      hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-solid fa-users-line icon-item"></i><span
                      class="binding">Nhà cung cấp</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link report_popup"><i
                      class="fa-fw fas fa-id-badge icon-item"></i><span
                      class="binding">Nhân viên</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link report_popup"><i
                      class="fa-fw fab fa-slideshare icon-item"></i><span
                      class="binding">Kênh bán hàng</span></a>
                </li>
                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fa-fw fas fa-solid fa-chart-line icon-item"></i><span
                      class="binding">Tài chính</span></a>
                </li>
              </ul>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-cart-shopping"></i>
              <p class="account-number">Bán Online</p>
              <ul class="kv-dropdown-list scope">
                <li>
                  <a class="kv-dropdown-link scope" target="_blank"><i
                      class="fab fa-facebook-messenger icon-item"></i><span class="binding">Bán hàng
                      Facebook</span></a>
                </li>

                <li>
                  <a class="kv-dropdown-link kol-menu-item scope"><i
                      class="fa-solid fa-bag-shopping icon-item"></i><span
                      class="binding">Bán hàng trên sàn TMĐT</span></a>
                </li>

                <li class="scope">
                  <a class="kv-dropdown-link"><i
                      class="fas fa-solid fa-window-maximize icon-item"></i><span
                      class="binding">Website bán hàng</span></a>
                </li>
              </ul>
            </li>
            <li class="kv-navbar-item">
              <i class="kv-navbar-item-icon fas fa-solid fa-basket-shopping"></i>
              <p class="account-number">Bán hàng</p>
            </li>
          </ul>
        </div>
      </section>

      <!-- support bottom -->
      <div class="support-bottom">
        <a id="toTop" rel="nofollow" title="Lên đầu trang"><i class="fa fa-angle-up"></i></a>
        <script src="../js/totop.js"></script> 
      </div>
    </header>

    <script src="../js/account.js"></script>
    <script src="../js/fontawesome.js" crossorigin="anonymous"></script>
  </body>
</html>