<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
        <link rel="stylesheet" href="CSS/login.css"/>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="login-container">
            <div class="login-box">
                <div class="logo">
                    <a href="#">
                        <img
                            src="#"
                            alt="KiotViet" />
                    </a>
                </div>
                <h3>Đăng nhập</h3>
                <form>
                    <div class="input-group">
                        <input type="text" placeholder="Tên đăng nhập" required />
                    </div>
                    <div class="input-group">
                        <input type="password" id="passwordField" placeholder="Mật khẩu" required />
                        <div class="input-group-append">
                            <a class="btn-icon" id="togglePassword">
                                <i class="far fs14 fa-eye-slash" id="passwordIcon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="remember-me">
                        <input type="checkbox" id="rememberMe" />
                        <label for="rememberMe">Duy trì đăng nhập</label>
                        <a href="#">Quên mật khẩu?</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="support">
            <p>Hỗ trợ: 190006522</p>
        </div>
        <script src="JS/hiddenpassword.js"></script>
    </body>
</html>
