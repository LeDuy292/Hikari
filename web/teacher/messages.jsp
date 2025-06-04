<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Nhắn Tin - Nền Tảng Giáo Dục</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/message.css" />

    </head>
    <body>
        <div class="container-fluid">
          <div class="row">
            <!-- Sidebar -->
            <%@ include file="sidebar.jsp" %>
            <!-- Main Content -->
            <main class="main-content">
                <div class="content-wrapper">
                    <!-- Header -->
                    <%@ include file="header.jsp" %>
                    <!-- Main Content -->
                    <main class="main-content">
                        <div class="content-wrapper">
                            <header class="header">
                                <h1 class="header-title" id="headerTitle">Quản Lý Khóa Học</h1>
                                <div class="header-actions">
                                    <div class="user-profile">
                                        <img src="${pageContext.request.contextPath}/assets/images/defaultLogoAdmin.png" alt="Ảnh đại diện" class="avatar" />
                                        <div class="user-info">
                                            <span class="user-name" id="userName">${userName}</span>
                                            <a href="/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Đăng Xuất</a>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <a href="/manageCourses" class="back-btn"><i class="fas fa-arrow-left"></i> Quay lại Quản Lý Khóa Học</a>
                            <div class="chat-container">
                                <div class="chat-list">
                                    <c:forEach var="conversation" items="${conversations}">
                                        <div class="chat-item ${conversation.active ? 'active' : ''}" data-conversation-id="${conversation.id}">
                                            <img src="${conversation.avatarUrl}" alt="${conversation.name}" class="chat-avatar" />
                                            <div class="chat-info">
                                                <div class="chat-name">${conversation.name}</div>
                                                <div class="chat-preview">${conversation.preview}</div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="chat-panel">
                                    <div class="chat-messages" id="chatMessages">
                                        <!-- Messages populated by JavaScript -->
                                    </div>
                                    <div class="chat-input">
                                        <textarea rows="2" placeholder="Nhập tin nhắn..." id="chatInput"></textarea>
                                        <button class="btn" id="sendMessageBtn">Gửi</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/message.js"></script>
            <meta name="csrf-token" content="${csrfToken}">
            </body>
            </html>