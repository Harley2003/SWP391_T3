function updateDate() {
  // Lấy thời gian hiện tại
  var now = new Date();

  // Format ngày tháng năm
  var date = now.getDate();
  var month = now.getMonth() + 1; // Tháng bắt đầu từ 0
  var year = now.getFullYear();

  // Format giờ phút giây
  var hours = now.getHours();
  var minutes = now.getMinutes();
  var seconds = now.getSeconds();

  // Chuyển đổi sang chuỗi ngày tháng năm và giờ phút giây
  var formattedDate = year + "-" + month + "-" + date;
  var formattedTime = hours + ":" + minutes + ":" + seconds;

  // Hiển thị ngày và giờ vào phần tử có class là "getDate"
  var dateElement = document.querySelector(".getDate");
  if (dateElement) {
    dateElement.innerHTML = formattedDate + " " + formattedTime;
    dateElement.style.display = "flex";
    dateElement.style.justifyContent = "center";
    dateElement.style.alignItems = "center";
  }
}

// Gọi hàm updateDate để cập nhật ngày và giờ ban đầu
updateDate();

// Cập nhật ngày và giờ mỗi giây
setInterval(updateDate, 1000);
