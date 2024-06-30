<%-- 
    Document   : AddStaff
    Created on : Jun 2, 2024, 3:13:09 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>System Log</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <link rel="stylesheet" type="text/css" href="View/CSS/main.css">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css"> 
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    </head>  
    <body class="app sidebar-mini rtl">
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
                    <ul class="app-breadcrumb breadcrumb">
                        <li class="breadcrumb-item"><a href="log">System Log</a></li>

                    </ul> 

                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="tile"> 
                            <div class="tile-body">
                                <div class="row element-button">
                                    <div class="col-sm-6"> 

                                        <strong>Hoạt động gần đây</strong>    

                                    </div> 

                                </div>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Nhân viên</th>
                                            <th>Thứ 2 </th>
                                            <th>Thứ 3</th>
                                            <th>Thứ 4</th>
                                            <th>Thứ 5</th>
                                            <th>Thứ 6</th>
                                            <th>Thứ 7</th>
                                            <th>Chủ nhật</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${scheduleList}" var="c">
                                        <tr class="item-log">
                                            <td>${c.getInfo().getName()}</td>
                                            <td class="add-schedule" value="${c.getUserID()}/t2"></td>
                                            <td class="add-schedule" value="${c.getUserID()}/t3"></td>
                                            <td class="add-schedule" value="${c.getUserID()}/t4"></td>
                                            <td class="add-schedule" value="${c.getUserID()}/t5"></td>
                                            <td class="add-schedule" value="${c.getUserID()}/t6"></td>
                                            <td class="add-schedule" value="${c.getUserID()}/t7"></td>
                                            <td class="add-schedule" value="${c.getUserID()}/cn"></td>   
                                        </tr>
                                    </c:forEach> 
                                </tbody>

                            </table>  
                            <div id="setWorkingTime">
                                <form method="post" id="setWorkingTimeForm">
                                    <table id="addInTable">
                                        <c:forEach items="${WorkSessionList}" var="c">
                                            <tr>
                                                <td> <input type="checkbox" name="checkboxTime" class="checkboxTime" value="${c.getWorkSessionId()} "></td>
                                                <td>${c.getWorkSessionName()} ${c.getStart_time()}-${c.getEnd_time()}</td>
                                            </tr>                              
                                        </c:forEach>
                                    </table>
                                    <span ><button id="addNewWorkingTime">Thêm mới  làm việc</button></span>
                                    <span ><button id="set">Chọn</button></span>
                                    <span class="closeWorkingTime">&times;</span> 
                                </form>
                            </div>
                            <div id="addWorkingTime">
                                <span class="CloseAddWorkingTime">&times;</span> 
                                <form action="schedule" method="post" class="form-container">
                                    <table>
                                        <tr>  
                                            <td><label>Bắt đầu từ :</label></td>
                                            <td><input type="time" required="" id="starttime" name="start_time"></td>
                                        </tr>
                                        <tr>
                                            <td> <label>Kết thúc vào :</label> </td>
                                            <td> <input type="time" required="" id="endtime" name="end_time"> </td>
                                        </tr>
                                        <tr>   
                                            <td> Tên ca : </td>
                                            <td><input type="text" required="" id="sessionWork"></td>
                                        </tr>
                                        <button id="Add" >Submit</button>
                                    </table>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </main> 

    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script>
        let checkboxTimeArray = [];
        let setBox = "";
        document.addEventListener("DOMContentLoaded", function () {

            const addSchedule = document.querySelectorAll(".add-schedule");
            addSchedule.forEach(function (cell) {
                cell.addEventListener("click", function () {
                    setBox = cell.getAttribute("value");
                    const popup = document.querySelector("#setWorkingTime");
                    popup.style.display = "block";
                });
            });

            const close = document.querySelector(".closeWorkingTime");
            close.addEventListener("click", function () {
                const popup = document.querySelector("#setWorkingTime");
                popup.style.display = "none";
            });

            const starttime = document.querySelector("#starttime");
            const endtime = document.querySelector("#endtime");
            const submit = document.querySelector("#Add");
            let sessionWork = document.querySelector("#sessionWork");
            starttime.addEventListener("input", CompareTime);
            endtime.addEventListener("input", CompareTime);
            sessionWork.addEventListener("input", function (e) {
                submit.disabled = sessionWork.value.trim() === "";
            });

            function CompareTime() {
                let getStartTime = starttime.value;
                let getEndTime = endtime.value;

                submit.disabled = (getStartTime >= getEndTime || getStartTime === "" || getEndTime === "" || sessionWork.value.trim() === "");
            }

            const addNewWorkingTime = document.querySelector("#addNewWorkingTime");
            addNewWorkingTime.addEventListener("click", function (event) {
                event.preventDefault();
                const addWorkingTime = document.querySelector("#addWorkingTime");
                addWorkingTime.style.display = "block";
                const popup = document.querySelector("#setWorkingTime");
                popup.style.display = "none";
            });

            const CloseAddWorkingTime = document.querySelector(".CloseAddWorkingTime");
            CloseAddWorkingTime.addEventListener("click", function () {
                const addWorkingTime = document.querySelector("#addWorkingTime");
                addWorkingTime.style.display = "none";
                const popup = document.querySelector("#setWorkingTime");
                popup.style.display = "block";
            });

            const addClick = document.getElementById('Add').addEventListener('click', function (event) {
                event.preventDefault();
                const http = new XMLHttpRequest();
                http.open("POST", "addsessiontime?starttime=" + starttime.value + "&endtime=" + endtime.value + "&name=" + sessionWork.value, true);

                http.send();
                http.onreadystatechange = function () {
                    if (this.readyState == 4) {
                        const calamviec = '<tr> <td> <input type="checkbox" name="checkboxTime" > </td> <td>' + http.responseText + " </td><tr>";
                        document.querySelector("#addInTable").innerHTML += calamviec;
                        document.querySelector("#addWorkingTime").style.display = "none";
                    }
                };
                const popup = document.querySelector("#setWorkingTime");
                popup.style.display = "block";
            });

            // Initial check for disabled state based on empty inputs
            submit.disabled = (starttime.value === "" || endtime.value === "" || sessionWork.value.trim() === "");
        });


        const setSessionWork = document.querySelector("#set");
        if (checkBoxChecked() == true) {
            setSessionWork.disabled = true;
        }
        setSessionWork.addEventListener("click", function (event) {
            event.preventDefault();
            if (checkBoxChecked === true) {
                setSessionWork.disabled = true;
            }
            const http = new XMLHttpRequest();
            console.log(setBox);
            console.log(checkboxTimeArray);
            http.open("POST", "setworksession?setsessionon=" + setBox + "&setsession=" + checkboxTimeArray, true);
            http.send();
            http.onreadystatechange = function () {
                if (this.readyState === 4) {
                    const row = document.querySelectorAll(".add-schedule");
                    row.forEach(function (cell) {
                        if (cell.getAttribute("value") === setBox) {
                            cell.innerHTML += http.responseText;
                            const popup = document.querySelector("#setWorkingTime");
                            popup.style.display = "none";
                            const checkboxTime = document.querySelectorAll(".checkboxTime");
                            checkboxTime.forEach(function (item) {
                                if (item.checked) {
                                    item.checked = false;
                                }
                            });
                        }

                    });
                }
            };

        });


        const checkboxTime = document.querySelectorAll(".checkboxTime");
        checkboxTime.forEach(function (checkbox) {
            checkbox.addEventListener('click', function () {

                const value = checkbox.getAttribute("value");
                if (checkbox.checked) {
                    if (!checkboxTimeArray.includes(value)) {
                        checkboxTimeArray.push(value);
                    }
                } else {
                    const index = checkboxTimeArray.indexOf(value);
                    if (index !== -1) {
                        checkboxTimeArray.splice(index, 1);
                    }
                }
                if (checkboxTimeArray.length === 0) {
                    setSessionWork.disabled = true;
                } else {
                    setSessionWork.disabled = false;
                }


            });

        });

        function checkBoxChecked() {
            let isTrue = true;
            const checkboxTime = document.querySelectorAll(".checkboxTime");
            checkboxTime.forEach(function (item) {
                if (item.checked) {
                    isTrue = false;
                }
            });
            return isTrue;
        }


    </script>
    <style>
        .add-schedule:hover::after {
            content: "+";
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 18px;
            color: green; /* Màu của dấu cộng */
        }
        table {
            height:400px
        }
        #addWorkingTime {

            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 700px;
            padding: 20px;
            background-color: #FFE9D0;
            border: 1px solid #ccc;
            z-index: 2; /* Đảm bảo popup hiển thị trên cùng dấu cộng */
            text-align: center;
        }
        .close {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
            cursor: pointer;
        }
        .form-container {

        }


        #setWorkingTime {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 700px;
            padding: 20px;
            background-color: #FFE9D0;
            border: 1px solid #ccc;
            z-index: 2; /* Đảm bảo popup hiển thị trên cùng dấu cộng */
            text-align: center;
        }

    </style>
</html>
