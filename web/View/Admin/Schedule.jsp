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
                                            <td class="add-schedule"></td>
                                            <td class="add-schedule"></td>
                                            <td class="add-schedule"></td>
                                            <td class="add-schedule"></td>
                                            <td class="add-schedule"></td>
                                            <td class="add-schedule"></td>
                                            <td class="add-schedule"></td>   
                                        </tr>
                                    </c:forEach> 
                                </tbody>

                            </table>  
                            <div id="setWorkingTime">
                                <input type="checkbox" name="checkboxTime" > Ca sáng 
                                <input type="checkbox" name="checkboxTime" > Ca chiều  
                                <input type="checkbox" name="checkboxTime" > Ca tối  
                                <span ><button id="addNewWorkingTime">Thêm mới ca làm việc</button></span>
                                <span class="closeWorkingTime">&times;</span> 
                            </div>
                            <div id="addWorkingTime">
                                <span class="CloseAddWorkingTime">&times;</span> 
                                <form action="schedule" method="post" class="form-container">
                                    <label>Bắt đầu từ :</label>
                                    <input type="time" required="" id="starttime" name="start_time">
                                    <label>Kết thúc vào :</label>
                                    <input type="time" required="" id="endtime" name="end_time">
                                    <button id="Add" >Submit</button>
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
        document.addEventListener("DOMContentLoaded", function () {

            const addSchedule = document.querySelectorAll(".add-schedule");
            addSchedule.forEach(function (cell) {
                cell.addEventListener("click", function () {
                    const popup = document.querySelector("#setWorkingTime");
                    popup.style.display = "block";
                });
            });
        });
        const close = document.querySelector(".closeWorkingTime");
        close.addEventListener("click", function () {
            const popup = document.querySelector("#setWorkingTime");
            popup.style.display = "none";
        });
        const starttime = document.querySelector("#starttime");
        const endtime = document.querySelector("#endtime");
        starttime.addEventListener("input", CompareTime);
        endtime.addEventListener("input", CompareTime);
        let submit = document.querySelector("#Add");
        function  CompareTime() {
            let getStartTime = starttime.value;
            let getEndTime = endtime.value;
            
            if (getStartTime >= getEndTime || getStartTime==="" || getEndTime=="") {
                submit.disabled = true;
            } else  {
                submit.disabled = false;
            }
        }
        

            const addNewWorkingTime = document.querySelector("#addNewWorkingTime"); 
            addNewWorkingTime.addEventListener("click",function () {
               const  addWorkingTime = document.querySelector("#addWorkingTime");
               addWorkingTime.style.display="block";
            });
       
        
        const CloseAddWorkingTime = document.querySelector(".CloseAddWorkingTime");
        CloseAddWorkingTime.addEventListener("click",function() {
              const  addWorkingTime = document.querySelector("#addWorkingTime");
              addWorkingTime.style.display="none";
        });
        
   const addClick= document.getElementById('Add').addEventListener('click', function(event) {
      event.preventDefault();
     const  http = new XMLHttpRequest();
     http.open("POST","schedule?starttime="+starttime.value+"&endtime="+endtime.value,true);
    
     http.send();
     http.onreadystatechange =function () {
         if(this.readyState==4) {
             const calamviec ='<input type="checkbox" name="checkboxTime" >'+http.responseText;
             document.querySelector("#setWorkingTime").insertAdjacentHTML("afterbegin",calamviec);
             document.querySelector("#addWorkingTime").style.display="none";      
         }
     };
    });
    let addClickRemove=document.getElementById('Add');
    if(starttime.value === "" || endtime.value === "") {
       document.querySelector("#Add").disabled=true;
     }
     console.log(starttime.value);


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
            height: 200px;
            padding: 20px;
            background-color: white;
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
            display: flex;
            align-items: center;
        }

        .form-container label {
            margin-right: 10px;
        }
        #setWorkingTime {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 500px;
            height: 200px;
            padding: 20px;
            background-color: white;
            border: 1px solid #ccc;
            z-index: 2; /* Đảm bảo popup hiển thị trên cùng dấu cộng */
            text-align: center;
        }
        
    </style>
</html>
