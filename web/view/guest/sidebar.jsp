
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<aside class="sidebar">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/assets/img/img_student/logoHikari.png" alt="Logo" />
        <div>
            <div class="logo-text">HIKARI</div>
            <div class="logo-sub">JAPAN</div>
        </div>
    </div>
    <div class="menu">
        <a href="index.jsp" class="menu-item"><i class="fa fa-home"></i>Trang chủ</a>
        <a href="index.jsp" class="menu-item sidebar-active"><i class="fa fa-book"></i>Tài liệu</a>
        <a href="courseInfo.jsp" class="menu-item"><i class="fa fa-play-circle"></i>Khóa học online</a>
        <a href="offlineCourses.jsp" class="menu-item"><i class="fa fa-chalkboard"></i>Khóa học offline</a>
        <a href="test.jsp" class="menu-item"><i class="fa fa-file-alt"></i>Bài kiểm tra</a>
        <a href="account.jsp" class="menu-item"><i class="fa fa-user"></i>Quản lý tài khoản</a>

    </div>
    <div class="bottom-section">
        <div class="image-placeholder">
            <img src="${pageContext.request.contextPath}/assets/img/img_student/study.jpg" alt="Placeholder Image" />
        </div>
        <a href="#" class="menu-item"><i class="fa fa-comments"></i>Chat</a>
    </div>
</aside>