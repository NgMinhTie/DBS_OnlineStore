// logout.js
document.addEventListener("DOMContentLoaded", function () {
    // Tìm phần tử nút logout
    const logoutButton = document.querySelector(".logout");

    // Kiểm tra nếu nút logout tồn tại
    if (logoutButton) {
        // Gắn sự kiện click vào nút logout
        logoutButton.addEventListener("click", function (event) {
            // Ngăn chặn hành vi mặc định nếu cần
            event.preventDefault();

            // Chuyển hướng về trang login.html
            window.location.href = "../login/login.html"; // Updated path
        });
    } else {
        console.error("Logout button not found");
    }
});
