<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản Lý Thông Báo - HIKARI</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet" />
    <style>
      :root {
        --primary-color: #4a90e2;
        --secondary-color: #34495e;
        --accent-color: #f39c12;
        --background-color: #f7f9fb;
        --text-color: #ffffff;
        --text-dark: #333333;
        --table-header-color: #34495e;
        --yellow-accent: #ffca28;
      }
      body { background-color: var(--background-color); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, sans-serif; display: flex; min-height: 100vh; margin: 0; padding: 0; }
      .container-fluid { display: flex; width: 100%; margin: 0; padding: 0; }
      .row { display: flex; width: 100%; margin: 0; padding: 0; }
       
      .main-content { flex: 1; padding: 32px; margin-left: 300px; background-color: #f1f5f9; }
      .content-wrapper { background: white; border-radius: 24px; padding: 32px; height: calc(100vh - 64px); overflow-y: auto; background-color: #f1f5f9; }
      .header { display: flex; justify-content: space-between; align-items: center; padding: 1rem 2rem; background: #ffffff; border-radius: 10px; margin-bottom: 2rem; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.25); }
      .header-title { font-size: 1.5rem; font-weight: 600; color: var(--text-dark); margin: 0; }
      .header-actions { display: flex; align-items: center; gap: 1rem; }
      .user-profile { display: flex; align-items: center; gap: 1rem; margin-left: 1.5rem; padding-left: 1.5rem; border-left: 1px solid rgba(0, 0, 0, 0.2); }
      .avatar { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }
      .user-info { display: flex; flex-direction: column; gap: 0.25rem; }
      .user-name { font-size: 0.9rem; color: var(--text-dark); font-weight: 500; }
      .logout-btn { display: flex; align-items: center; gap: 0.5rem; color: var(--text-dark); font-size: 0.85rem; text-decoration: none; transition: color 0.2s; }
      .logout-btn:hover { color: var(--accent-color); }
       
      .filter-section {
        margin-bottom: 20px;
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        align-items: center;
        background: linear-gradient(135deg, #ffffff, #f1f5f9);
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        border-left: 6px solid var(--yellow-accent);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
      }
      .filter-section:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 144, 226, 0.3);
      }
      .filter-section label {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--secondary-color);
        margin-right: 8px;
        display: flex;
        align-items: center;
        gap: 5px;
      }
      .filter-section select,
      .filter-section input {
        padding: 10px 12px;
        border: 1px solid #d1d9e6;
        border-radius: 8px;
        font-size: 0.95rem;
        background: linear-gradient(180deg, #ffffff, #f1f5f9);
        color: var(--text-dark);
        transition: border-color 0.3s, box-shadow 0.3s, background 0.3s;
        position: relative;
      }
      .filter-section select:focus,
      .filter-section input:focus {
        border-color: var(--primary-color);
        background: #ffffff;
        box-shadow: 0 0 8px rgba(74, 144, 226, 0.4);
        outline: none;
      }
      .filter-section input[type="text"] {
        flex: 1;
        min-width: 0;
      }
      .filter-section input[type="text"]::placeholder {
        color: #7f8c8d;
      }
      .filter-section select {
        width: 140px;
      }
      .filter-section input[type="date"] {
        width: 140px;
      }
      .filter-section select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
        background-repeat: no-repeat;
        background-position-x: calc(100% - 10px);
        background-position-y: center;
        padding-right: 30px;
      }
      .filter-row {
        display: flex;
        flex-wrap: nowrap;
        gap: 12px;
        align-items: center;
        width: 100%;
      }
      .search-row {
        display: flex;
        align-items: center;
        gap: 12px;
        width: 100%;
        margin-top: 12px;
      }
      .search-row label {
        flex: 0 0 auto;
      }
      .search-row input {
        flex: 1;
        min-width: 0;
      }
      .table { background: #ffffff; border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); }
      .table th, .table td { vertical-align: middle; color: var(--text-dark); }
      .table th { background-color: var(--table-header-color); color: var(--text-color); }
      .table thead { background-color: var(--table-header-color); color: var(--text-color); }
      
      .btn-action { margin-right: 5px; }
      tbody .btn-view { background-color: #4a90e2; border: none; padding: 5px 10px; border-radius: 5px; }
      tbody .btn-edit { background-color: #f39c12; border: none; padding: 5px 10px; border-radius: 5px; }
      tbody .btn-delete { background-color: #e74c3c; border: none; padding: 5px 10px; border-radius: 5px; }
      tbody .btn-add { background-color: #28a745; border: none; padding: 8px 16px; border-radius: 8px; color: var(--text-color); font-weight: 500; transition: transform 0.2s, background 0.2s; }
      tbody .btn-add:hover { background-color: #218838; transform: translateY(-2px); }
      .pagination {
        margin-top: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
      }
      .pagination button {
        padding: 8px 16px;
        border: 1px solid var(--primary-color);
        background: linear-gradient(180deg, #ffffff, #f1f5f9);
        color: var(--text-dark);
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s, transform 0.2s;
      }
      .pagination button:hover {
        background: var(--primary-color);
        color: var(--text-color);
        transform: translateY(-2px);
      }
      .pagination button:disabled {
        background: #e0e0e0;
        border-color: #d1d9e6;
        color: #7f8c8d;
        cursor: not-allowed;
      }
      .pagination span {
        font-size: 0.95rem;
        color: var(--text-dark);
        font-weight: 500;
      }
      /* Modal Styles */
      .modal-content {
        border-radius: 16px;
        border: none;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        background: #ffffff;
      }
      .modal-header {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        color: var(--text-color);
        border-top-left-radius: 16px;
        border-top-right-radius: 16px;
        padding: 20px;
        border-bottom: none;
      }
      .modal-title {
        font-size: 1.5rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 10px;
        font-family: 'Dancing Script', cursive;
      }
      .modal-title i {
        color: var(--text-color);
      }
      .modal-body {
        padding: 30px;
        background: #f8fafc;
        max-height: 70vh;
        overflow-y: auto;
      }
      .modal-footer {
        padding: 15px 30px;
        border-top: none;
        background: #ffffff;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
      }
      .view-notification-modal .modal-dialog {
        max-width: 800px;
      }
      .view-notification-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }
      .view-notification-modal .section:hover {
        transform: translateY(-2px);
      }
      .view-notification-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }
      .view-notification-modal .section-title i {
        color: var(--primary-color);
      }
      .view-notification-modal .info-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 10px;
        font-size: 0.95rem;
      }
      .view-notification-modal .info-label {
        font-weight: 500;
        color: var(--text-dark);
        width: 150px;
        flex-shrink: 0;
      }
      .view-notification-modal .info-value {
        color: #555;
        font-size: 0.95rem;
        white-space: pre-wrap;
        word-break: break-word;
      }
      .create-notification-modal .modal-dialog,
      .edit-notification-modal .modal-dialog {
        max-width: 600px;
      }
      .create-notification-modal .form-group,
      .edit-notification-modal .form-group {
        margin-bottom: 15px;
      }
      .create-notification-modal label,
      .edit-notification-modal label {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--text-dark);
        margin-bottom: 8px;
        display: block;
      }
      .create-notification-modal input,
      .create-notification-modal select,
      .create-notification-modal textarea,
      .edit-notification-modal input,
      .edit-notification-modal select,
      .edit-notification-modal textarea {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #d1d9e6;
        border-radius: 8px;
        font-size: 0.95rem;
        background: #ffffff;
        color: var(--text-dark);
        transition: border-color 0.3s, box-shadow 0.3s;
      }
      .create-notification-modal textarea,
      .edit-notification-modal textarea {
        resize: vertical;
        min-height: 100px;
      }
      .create-notification-modal select,
      .edit-notification-modal select {
        appearance: none;
        background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
        background-repeat: no-repeat;
        background-position-x: calc(100% - 10px);
        background-position-y: center;
        padding-right: 30px;
      }
      .create-notification-modal input:focus,
      .create-notification-modal select:focus,
      .create-notification-modal textarea:focus,
      .edit-notification-modal input:focus,
      .edit-notification-modal select:focus,
      .edit-notification-modal textarea:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 8px rgba(74, 144, 226, 0.4);
        outline: none;
      }
      .delete-notification-modal .modal-dialog {
        max-width: 500px;
      }
      .delete-notification-modal .modal-header {
        background: linear-gradient(90deg, #e74c3c, #c0392b);
      }
      .delete-notification-modal .modal-body {
        padding: 30px;
        background: #f8fafc;
      }
      .delete-notification-modal .warning-section {
        background: #ffffff;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
      }
      .delete-notification-modal .warning-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #e74c3c;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }
      .delete-notification-modal .warning-title i {
        color: #e74c3c;
      }
      .delete-notification-modal .info-item {
        font-size: 0.95rem;
        margin-bottom: 10px;
      }
      .delete-notification-modal .info-item span {
        font-weight: 600;
        color: var(--text-dark);
      }
      .delete-notification-modal .warning-text {
        font-size: 0.9rem;
        color: #555;
        margin-top: 10px;
      }
      .btn-submit {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        color: var(--text-color);
        border: none;
        padding: 10px 20px;
        border-radius: 8px;
        font-size: 0.9rem;
        font-weight: 600;
        transition: transform 0.2s, box-shadow 0.2s;
      }
      .btn-submit:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 144, 226, 0.4);
        background: linear-gradient(90deg, var(--accent-color), var(--primary-color));
      }
      .btn-cancel {
        background: #e0e0e0;
        color: var(--text-dark);
        border: none;
        padding: 10px 20px;
        border-radius: 8px;
        font-size: 0.9rem;
        font-weight: 600;
        transition: transform 0.2s, background 0.2s;
      }
      .btn-cancel:hover {
        background: #d1d9e6;
        transform: translateY(-2px);
      }
      .btn-confirm-delete {
        background-color: #e74c3c;
        color: var(--text-color);
        border: none;
        padding: 10px 20px;
        border-radius: 8px;
        font-size: 0.9rem;
        font-weight: 600;
        transition: transform 0.2s, box-shadow 0.2s;
      }
      .btn-confirm-delete:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(231, 76, 60, 0.4);
        background-color: #c0392b;
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <!-- Include Sidebar -->
        <%@ include file="sidebar.jsp" %>
        <div class="main-content">
          <div class="content-wrapper">
            <!-- Include Header -->
            <%@ include file="header.jsp" %>
            <!-- Filter Section -->
            <div class="filter-section">
              <div class="filter-row">
                <label for="typeFilter">Loại Thông Báo:</label>
                <select class="form-select" id="typeFilter">
                  <option value="">Tất cả</option>
                  <option value="Sự Kiện">Sự Kiện</option>
                  <option value="Cập Nhật Khóa Học">Cập Nhật Khóa Học</option>
                  <option value="Thông Báo Hệ Thống">Thông Báo Hệ Thống</option>
                </select>
                <label for="sendDateFilter">Ngày Gửi:</label>
                <input type="date" class="form-control" id="sendDateFilter" />
              </div>
              <div class="search-row">
                <label for="search">Tìm Kiếm:</label>
                <input type="text" class="form-control" id="search" placeholder="Tìm theo tiêu đề hoặc nội dung..." />
              </div>
            </div>
            <!-- Notifications Table -->
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>TIÊU ĐỀ</th>
                    <th>LOẠI THÔNG BÁO</th>
                    <th>NỘI DUNG</th>
                    <th>NGÀY GỬI</th>
                    <th>HÀNH ĐỘNG</th>
                  </tr>
                </thead>
                <tbody id="notificationTableBody">
                  <tr data-notification-id="NOT001">
                    <td>NOT001</td>
                    <td>Khóa Học N5 Mới</td>
                    <td>Cập Nhật Khóa Học</td>
                    <td>Khóa học Tiếng Nhật Sơ Cấp N5 mới sẽ bắt đầu vào 01/06/2025...</td>
                    <td>2025-05-01</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT001"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT001"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT001" data-title="Khóa Học N5 Mới"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT002">
                    <td>NOT002</td>
                    <td>Đăng Ký JLPT N3</td>
                    <td>Sự Kiện</td>
                    <td>Hạn đăng ký thi JLPT N3 là 30/06/2025. Đăng ký ngay tại J-Learning...</td>
                    <td>2025-05-02</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT002"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT002"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT002" data-title="Đăng Ký JLPT N3"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT003">
                    <td>NOT003</td>
                    <td>Lễ Hội Hanami 2025</td>
                    <td>Sự Kiện</td>
                    <td>Tham gia lớp học làm bánh Mochi tại lễ hội Hanami vào 15/06/2025...</td>
                    <td>2025-05-03</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT003"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT003"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT003" data-title="Lễ Hội Hanami 2025"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT004">
                    <td>NOT004</td>
                    <td>Bảo Trì Hệ Thống</td>
                    <td>Thông Báo Hệ Thống</td>
                    <td>Hệ thống J-Learning sẽ bảo trì từ 00:00 đến 02:00 ngày 10/05/2025...</td>
                    <td>2025-05-04</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT004"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT004"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT004" data-title="Bảo Trì Hệ Thống"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT005">
                    <td>NOT005</td>
                    <td>Lớp Học Trà Đạo</td>
                    <td>Sự Kiện</td>
                    <td>Tham gia lớp học Trà Đạo Nhật Bản vào 20/06/2025 tại HIKARI...</td>
                    <td>2025-05-05</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT005"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT005"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT005" data-title="Lớp Học Trà Đạo"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT006">
                    <td>NOT006</td>
                    <td>Khóa Học Kanji N4</td>
                    <td>Cập Nhật Khóa Học</td>
                    <td>Khóa học Kanji N4 mới đã được cập nhật với tài liệu mới...</td>
                    <td>2025-05-06</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT006"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT006"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT006" data-title="Khóa Học Kanji N4"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT007">
                    <td>NOT007</td>
                    <td>Hội Thảo JLPT N2</td>
                    <td>Sự Kiện</td>
                    <td>Hội thảo ôn thi JLPT N2 sẽ diễn ra vào 25/06/2025...</td>
                    <td>2025-05-07</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT007"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT007"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT007" data-title="Hội Thảo JLPT N2"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT008">
                    <td>NOT008</td>
                    <td>Cập Nhật Ứng Dụng</td>
                    <td>Thông Báo Hệ Thống</td>
                    <td>Ứng dụng J-Learning đã được cập nhật phiên bản 2.1.0...</td>
                    <td>2025-05-08</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT008"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT008"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT008" data-title="Cập Nhật Ứng Dụng"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT009">
                    <td>NOT009</td>
                    <td>Lớp Hội Thoại N3</td>
                    <td>Cập Nhật Khóa Học</td>
                    <td>Lớp hội thoại N3 mới sẽ khai giảng vào 01/07/2025...</td>
                    <td>2025-05-09</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT009"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT009"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT009" data-title="Lớp Hội Thoại N3"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-notification-id="NOT010">
                    <td>NOT010</td>
                    <td>Cuộc Thi Kanji 2025</td>
                    <td>Sự Kiện</td>
                    <td>Đăng ký cuộc thi Kanji toàn quốc 2025 tại HIKARI...</td>
                    <td>2025-05-10</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="NOT010"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="NOT010"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="NOT010" data-title="Cuộc Thi Kanji 2025"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- Pagination -->
            <div class="pagination" id="pagination">
              <button id="prevPage" disabled>Trước</button>
              <span id="pageInfo"></span>
              <button id="nextPage">Sau</button>
            </div>
            <!-- View Notification Modal -->
            <div class="modal fade view-notification-modal" id="viewNotificationModal" tabindex="-1" aria-labelledby="viewNotificationModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="viewNotificationModalLabel"><i class="fas fa-bell"></i> Chi Tiết Thông Báo</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-info-circle"></i> Thông Tin Thông Báo</h6>
                      <div class="info-item">
                        <span class="info-label">ID:</span>
                        <span class="info-value" id="modalNotificationId"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Tiêu Đề:</span>
                        <span class="info-value" id="modalTitle"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Loại Thông Báo:</span>
                        <span class="info-value" id="modalType"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Nội Dung:</span>
                        <span class="info-value" id="modalContent"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Ngày Gửi:</span>
                        <span class="info-value" id="modalSendDate"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Đối Tượng:</span>
                        <span class="info-value" id="modalRecipient"></span>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Đóng</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- Create Notification Modal -->
            <div class="modal fade create-notification-modal" id="createNotificationModal" tabindex="-1" aria-labelledby="createNotificationModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="createNotificationModalLabel"><i class="fas fa-plus"></i> Tạo Thông Báo Mới</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form id="createNotificationForm">
                    <div class="modal-body">
                      <div class="form-group">
                        <label for="createTitle">Tiêu Đề <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="createTitle" name="title" placeholder="Nhập tiêu đề thông báo..." required />
                      </div>
                      <div class="form-group">
                        <label for="createType">Loại Thông Báo <span class="text-danger">*</span></label>
                        <select class="form-select" id="createType" name="type" required>
                          <option value="" disabled selected>Chọn loại thông báo</option>
                          <option value="Sự Kiện">Sự Kiện</option>
                          <option value="Cập Nhật Khóa Học">Cập Nhật Khóa Học</option>
                          <option value="Thông Báo Hệ Thống">Thông Báo Hệ Thống</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="createContent">Nội Dung <span class="text-danger">*</span></label>
                        <textarea class="form-control" id="createContent" name="content" placeholder="Nhập nội dung thông báo..." required></textarea>
                      </div>
                      <div class="form-group">
                        <label for="createRecipient">Đối Tượng <span class="text-danger">*</span></label>
                        <select class="form-select" id="createRecipient" name="recipient" required>
                          <option value="" disabled selected>Chọn đối tượng</option>
                          <option value="Tất Cả Học Viên">Tất Cả Học Viên</option>
                          <option value="Học Viên N5">Học Viên N5</option>
                          <option value="Học Viên N4">Học Viên N4</option>
                          <option value="Học Viên N3">Học Viên N3</option>
                          <option value="Học Viên N2">Học Viên N2</option>
                          <option value="Học Viên N1">Học Viên N1</option>
                          <option value="Giảng Viên">Giảng Viên</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="createSendDate">Ngày Gửi <span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="createSendDate" name="sendDate" required />
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                      <button type="submit" class="btn btn-submit">Tạo</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <!-- Edit Notification Modal -->
            <div class="modal fade edit-notification-modal" id="editNotificationModal" tabindex="-1" aria-labelledby="editNotificationModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editNotificationModalLabel"><i class="fas fa-edit"></i> Chỉnh Sửa Thông Báo</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/EditNotificationServlet" method="POST">
                    <div class="modal-body">
                      <input type="hidden" id="editNotificationId" name="notificationId" />
                      <div class="form-group">
                        <label for="editTitle">Tiêu Đề <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="editTitle" name="title" placeholder="Nhập tiêu đề thông báo..." required />
                      </div>
                      <div class="form-group">
                        <label for="editType">Loại Thông Báo <span class="text-danger">*</span></label>
                        <select class="form-select" id="editType" name="type" required>
                          <option value="" disabled>Chọn loại thông báo</option>
                          <option value="Sự Kiện">Sự Kiện</option>
                          <option value="Cập Nhật Khóa Học">Cập Nhật Khóa Học</option>
                          <option value="Thông Báo Hệ Thống">Thông Báo Hệ Thống</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="editContent">Nội Dung <span class="text-danger">*</span></label>
                        <textarea class="form-control" id="editContent" name="content" placeholder="Nhập nội dung thông báo..." required></textarea>
                      </div>
                      <div class="form-group">
                        <label for="editRecipient">Đối Tượng <span class="text-danger">*</span></label>
                        <select class="form-select" id="editRecipient" name="recipient" required>
                          <option value="" disabled>Chọn đối tượng</option>
                          <option value="Tất Cả Học Viên">Tất Cả Học Viên</option>
                          <option value="Học Viên N5">Học Viên N5</option>
                          <option value="Học Viên N4">Học Viên N4</option>
                          <option value="Học Viên N3">Học Viên N3</option>
                          <option value="Học Viên N2">Học Viên N2</option>
                          <option value="Học Viên N1">Học Viên N1</option>
                          <option value="Giảng Viên">Giảng Viên</option>
                        </select>
                      </div>
                      <div class="form-group">
                        <label for="editSendDate">Ngày Gửi <span class="text-danger">*</span></label>
                        <input type="date" class="form-control" id="editSendDate" name="sendDate" required />
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                      <button type="submit" class="btn btn-submit">Cập Nhật</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <!-- Delete Notification Modal -->
            <div class="modal fade delete-notification-modal" id="deleteNotificationModal" tabindex="-1" aria-labelledby="deleteNotificationModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="deleteNotificationModalLabel"><i class="fas fa-trash-alt"></i> Xác Nhận Xóa Thông Báo</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="warning-section">
                      <h6 class="warning-title"><i class="fas fa-exclamation-triangle"></i> Cảnh Báo</h6>
                      <div class="info-item">
                        Bạn có chắc chắn muốn xóa thông báo <span id="deleteNotificationId"></span> với tiêu đề "<span id="deleteTitle"></span>"?
                      </div>
                      <div class="warning-text">
                        Hành động này không thể hoàn tác. Vui lòng xác nhận.
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                    <form action="/DeleteNotificationServlet" method="POST">
                      <input type="hidden" id="deleteNotificationIdInput" name="notificationId" />
                      <button type="submit" class="btn btn-confirm-delete">Xóa</button>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      // Mock notification details data
      const notificationDetails = {
        NOT001: {
          title: "Khóa Học N5 Mới",
          type: "Cập Nhật Khóa Học",
          content: "Khóa học Tiếng Nhật Sơ Cấp N5 mới sẽ bắt đầu vào 01/06/2025. Đăng ký ngay để nhận ưu đãi giảm 20% học phí!",
          sendDate: "2025-05-01",
          recipient: "Tất Cả Học Viên"
        },
        NOT002: {
          title: "Đăng Ký JLPT N3",
          type: "Sự Kiện",
          content: "Hạn đăng ký thi JLPT N3 là 30/06/2025. Đăng ký ngay tại J-Learning để nhận tài liệu ôn thi miễn phí!",
          sendDate: "2025-05-02",
          recipient: "Học Viên N3"
        },
        NOT003: {
          title: "Lễ Hội Hanami 2025",
          type: "Sự Kiện",
          content: "Tham gia lớp học làm bánh Mochi tại lễ hội Hanami vào 15/06/2025. Đăng ký trước 10/06 để nhận vé miễn phí!",
          sendDate: "2025-05-03",
          recipient: "Tất Cả Học Viên"
        },
        NOT004: {
          title: "Bảo Trì Hệ Thống",
          type: "Thông Báo Hệ Thống",
          content: "Hệ thống J-Learning sẽ bảo trì từ 00:00 đến 02:00 ngày 10/05/2025. Vui lòng đăng nhập lại sau thời gian này.",
          sendDate: "2025-05-04",
          recipient: "Tất Cả Học Viên"
        },
        NOT005: {
          title: "Lớp Học Trà Đạo",
          type: "Sự Kiện",
          content: "Tham gia lớp học Trà Đạo Nhật Bản vào 20/06/2025 tại HIKARI. Số lượng giới hạn, đăng ký sớm!",
          sendDate: "2025-05-05",
          recipient: "Học Viên N3"
        },
        NOT006: {
          title: "Khóa Học Kanji N4",
          type: "Cập Nhật Khóa Học",
          content: "Khóa học Kanji N4 mới đã được cập nhật với tài liệu mới và bài tập thực hành. Đăng ký ngay hôm nay!",
          sendDate: "2025-05-06",
          recipient: "Học Viên N4"
        },
        NOT007: {
          title: "Hội Thảo JLPT N2",
          type: "Sự Kiện",
          content: "Hội thảo ôn thi JLPT N2 sẽ diễn ra vào 25/06/2025. Đăng ký để nhận tài liệu và gặp gỡ giảng viên hàng đầu!",
          sendDate: "2025-05-07",
          recipient: "Học Viên N2"
        },
        NOT008: {
          title: "Cập Nhật Ứng Dụng",
          type: "Thông Báo Hệ Thống",
          content: "Ứng dụng J-Learning đã được cập nhật phiên bản 2.1.0 với giao diện mới và tính năng học Kanji cải tiến.",
          sendDate: "2025-05-08",
          recipient: "Tất Cả Học Viên"
        },
        NOT009: {
          title: "Lớp Hội Thoại N3",
          type: "Cập Nhật Khóa Học",
          content: "Lớp hội thoại N3 mới sẽ khai giảng vào 01/07/2025. Đăng ký để nâng cao kỹ năng giao tiếp tiếng Nhật!",
          sendDate: "2025-05-09",
          recipient: "Học Viên N3"
        },
        NOT010: {
          title: "Cuộc Thi Kanji 2025",
          type: "Sự Kiện",
          content: "Đăng ký cuộc thi Kanji toàn quốc 2025 tại HIKARI. Giải thưởng hấp dẫn đang chờ bạn!",
          sendDate: "2025-05-10",
          recipient: "Tất Cả Học Viên"
        }
      };

      // Function to show notification details in view modal
      function showNotificationDetails(notificationId) {
        const row = document.querySelector(`tr[data-notification-id="${notificationId}"]`);
        const details = notificationDetails[notificationId];

        document.getElementById('modalNotificationId').textContent = row.cells[0].textContent;
        document.getElementById('modalTitle').textContent = row.cells[1].textContent;
        document.getElementById('modalType').textContent = row.cells[2].textContent;
        document.getElementById('modalContent').textContent = details.content;
        document.getElementById('modalSendDate').textContent = row.cells[4].textContent;
        document.getElementById('modalRecipient').textContent = details.recipient;
      }

      // Function to populate edit notification modal
      function populateEditNotificationModal(notificationId) {
        const row = document.querySelector(`tr[data-notification-id="${notificationId}"]`);
        const details = notificationDetails[notificationId];

        document.getElementById('editNotificationId').value = row.cells[0].textContent;
        document.getElementById('editTitle').value = row.cells[1].textContent;
        document.getElementById('editType').value = row.cells[2].textContent;
        document.getElementById('editContent').value = details.content;
        document.getElementById('editRecipient').value = details.recipient;
        document.getElementById('editSendDate').value = row.cells[4].textContent;
      }

      // Function to populate delete notification modal
      function populateDeleteNotificationModal(notificationId, title) {
        document.getElementById('deleteNotificationId').textContent = notificationId;
        document.getElementById('deleteTitle').textContent = title;
        document.getElementById('deleteNotificationIdInput').value = notificationId;
      }

      // Function to create a new notification row
      function createNotificationRow(id, title, type, content, sendDate, recipient) {
        const truncatedContent = content.length > 50 ? content.substring(0, 50) + '...' : content;
        const row = document.createElement('tr');
        row.setAttribute('data-notification-id', id);
        row.innerHTML = `
          <td>${id}</td>
          <td>${title}</td>
          <td>${type}</td>
          <td>${truncatedContent}</td>
          <td>${sendDate}</td>
          <td>
            <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewNotificationModal" data-notification-id="${id}"><i class="fas fa-eye"></i></button>
            <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editNotificationModal" data-notification-id="${id}"><i class="fas fa-edit"></i></button>
            <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteNotificationModal" data-notification-id="${id}" data-title="${title}"><i class="fas fa-trash"></i></button>
          </td>
        `;
        return row;
      }

      // Handle create notification form submission
      document.getElementById('createNotificationForm').addEventListener('submit', (e) => {
        e.preventDefault();
        const form = e.target;
        if (!form.checkValidity()) {
          form.reportValidity();
          return;
        }

        const title = document.getElementById('createTitle').value;
        const type = document.getElementById('createType').value;
        const content = document.getElementById('createContent').value;
        const recipient = document.getElementById('createRecipient').value;
        const sendDate = document.getElementById('createSendDate').value;

        // Generate new ID
        const existingIds = Object.keys(notificationDetails).map(id => parseInt(id.replace('NOT', '')));
        const newIdNum = Math.max(...existingIds, 0) + 1;
        const newId = `NOT${newIdNum.toString().padStart(3, '0')}`;

        // Add to notificationDetails
        notificationDetails[newId] = { title, type, content, sendDate, recipient };

        // Add to table
        const newRow = createNotificationRow(newId, title, type, content, sendDate, recipient);
        document.getElementById('notificationTableBody').prepend(newRow);

        // Update pagination
        applyFilters();

        // Close modal and reset form
        const modal = bootstrap.Modal.getInstance(document.getElementById('createNotificationModal'));
        modal.hide();
        form.reset();
        document.getElementById('createSendDate').value = new Date().toISOString().split('T')[0];
      });

      // Set default send date to today for create modal
      document.getElementById('createSendDate').value = new Date().toISOString().split('T')[0];

      // Add event listeners to buttons
      document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', () => {
          const notificationId = button.getAttribute('data-notification-id');
          showNotificationDetails(notificationId);
        });
      });

      document.querySelectorAll('.btn-edit').forEach(button => {
        button.addEventListener('click', () => {
          const notificationId = button.getAttribute('data-notification-id');
          populateEditNotificationModal(notificationId);
        });
      });

      document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', () => {
          const notificationId = button.getAttribute('data-notification-id');
          const title = button.getAttribute('data-title');
          populateDeleteNotificationModal(notificationId, title);
        });
      });

      // Pagination and filtering logic
      const rowsPerPage = 10;
      let currentPage = 1;
      let filteredRows = [];

      // Get all rows
      const allRows = Array.from(document.querySelectorAll('#notificationTableBody tr'));

      // Initialize pagination
      function updatePagination() {
        const totalRows = filteredRows.length || allRows.length;
        const totalPages = Math.ceil(totalRows / rowsPerPage);
        currentPage = Math.max(1, Math.min(currentPage, totalPages));

        // Show/hide rows based on current page
        const start = (currentPage - 1) * rowsPerPage;
        const end = start + rowsPerPage;

        allRows.forEach(row => row.style.display = 'none');
        (filteredRows.length ? filteredRows : allRows).slice(start, end).forEach(row => row.style.display = '');

        // Update pagination info
        document.getElementById('pageInfo').textContent = `Trang ${currentPage} / ${totalPages}`;

        // Enable/disable buttons
        document.getElementById('prevPage').disabled = currentPage === 1;
        document.getElementById('nextPage').disabled = currentPage === totalPages;
      }

      // Filter logic
      function applyFilters() {
        const type = document.getElementById('typeFilter').value.toLowerCase();
        const sendDate = document.getElementById('sendDateFilter').value;
        const search = document.getElementById('search').value.toLowerCase();

        filteredRows = Array.from(document.querySelectorAll('#notificationTableBody tr')).filter(row => {
          const typeText = row.cells[2].textContent.toLowerCase();
          const sendDateText = row.cells[4].textContent;
          const titleText = row.cells[1].textContent.toLowerCase();
          const contentText = notificationDetails[row.getAttribute('data-notification-id')].content.toLowerCase();

          const matchesType = type === '' || typeText.includes(type);
          const matchesDate = !sendDate || sendDateText === sendDate;
          const matchesSearch = !search || titleText.includes(search) || contentText.includes(search);

          return matchesType && matchesDate && matchesSearch;
        });

        currentPage = 1; // Reset to first page on filter change
        updatePagination();
      }

      // Add filter event listeners
      document.querySelectorAll('#typeFilter, #sendDateFilter, #search').forEach(filter => {
        filter.addEventListener('change', applyFilters);
        filter.addEventListener('input', applyFilters);
      });

      // Pagination button listeners
      document.getElementById('prevPage').addEventListener('click', () => {
        if (currentPage > 1) {
          currentPage--;
          updatePagination();
        }
      });

      document.getElementById('nextPage').addEventListener('click', () => {
        const totalRows = filteredRows.length || allRows.length;
        const totalPages = Math.ceil(totalRows / rowsPerPage);
        if (currentPage < totalPages) {
          currentPage++;
          updatePagination();
        }
      });

      // Initial pagination setup
      updatePagination();
    </script>
  </body>
</html>