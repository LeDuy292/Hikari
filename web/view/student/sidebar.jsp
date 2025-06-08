<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="sidebar">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/img/student/cat-icon.png" alt="Logo" />
        <div>
            <div class="logo-text">HIKARI</div>
            <div class="logo-sub">JAPAN</div>
        </div>
    </div>
    <div class="menu">
        <a href="home.html" class="menu-item"><i class="fa fa-home"></i>Trang chủ</a>
        <a href="documents.jsp?type=paid" class="menu-item "><i class="fa fa-book"></i>Tài liệu</a>
        <a href="index.html" class="menu-item"><i class="fa fa-play-circle"></i>Khóa học online</a>
        <a href="#" class="menu-item"><i class="fa fa-chalkboard"></i>Khóa học offline</a>
        <a href="#" class="menu-item"><i class="fa fa-file-alt"></i>Bài kiểm tra</a>
        <a href="#" class="menu-item"><i class="fa fa-user"></i>Quản lý tài khoản</a>
    </div>
    <div class="bottom-section">
        <div class="image-placeholder">
            <img src="${pageContext.request.contextPath}/assets/img/student/Yamanakako-lake-in-fall.jpeg" alt="Placeholder Image" />
        </div>
        <a href="#" class="menu-item"><i class="fa fa-comments"></i>Chat</a>
    </div>
</aside>