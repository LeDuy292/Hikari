<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản Lý Tài Khoản - HIKARI</title>
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
        width: 160px;
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

      .filter-section input[type="number"] {
        width: 120px;
      }

      .filter-section input[type="text"] {
        flex: 1;
        min-width: 220px;
        background: linear-gradient(180deg, #ffffff, #f1f5f9);
      }

      .filter-section input[type="text"]::placeholder {
        color: #7f8c8d;
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

      .table { background: #ffffff; border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); }
      .table th, .table td { vertical-align: middle; color: var(--text-dark); }
      
      .table th { background-color: var(--table-header-color); color: var(--text-color); } 
      .table thead { background-color: var(--table-header-color); color: var(--text-color); }

      .table td img { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }
      .btn-action { margin-right: 5px; }
      .badge-active { background-color: #2ecc71; color: white; padding: 5px 10px; border-radius: 12px; }
      .badge-inactive { background-color: #f39c12; color: white; padding: 5px 10px; border-radius: 12px; }
      tbody .btn-view { background-color: #4a90e2; border: none; padding: 5px 10px; border-radius: 5px; }
      tbody .btn-edit { background-color: #f39c12; border: none; padding: 5px 10px; border-radius: 5px; }
      tbody .btn-delete { background-color: #e74c3c; border: none; padding: 5px 10px; border-radius: 5px; }
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

      .btn-add-user {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        color: var(--text-color);
        border: none;
        padding: 8px 16px;
        border-radius: 8px;
        font-size: 0.9rem;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 5px;
        transition: transform 0.2s, box-shadow 0.2s;
      }

      .btn-add-user:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 144, 226, 0.4);
        background: linear-gradient(90deg, var(--accent-color), var(--primary-color));
      }

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
      }

      .modal-title i {
        color: var(--text-color);
      }

      .modal-body {
        padding: 30px;
        background: #f8fafc;
      }

      .modal-footer {
        padding: 15px 30px;
        border-top: none;
        background: #ffffff;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
      }

      .add-user-modal .modal-dialog,
      .edit-user-modal .modal-dialog {
        max-width: 600px;
      }

      .add-user-modal .section,
      .edit-user-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }

      .add-user-modal .section:hover,
      .edit-user-modal .section:hover {
        transform: translateY(-2px);
      }

      .add-user-modal .section-title,
      .edit-user-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .add-user-modal .section-title i,
      .edit-user-modal .section-title i {
        color: var(--primary-color);
      }

      .add-user-modal .form-group,
      .edit-user-modal .form-group {
        margin-bottom: 15px;
      }

      .add-user-modal label,
      .edit-user-modal label {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--text-dark);
        margin-bottom: 8px;
        display: block;
      }

      .add-user-modal input,
      .add-user-modal select,
      .edit-user-modal input,
      .edit-user-modal select {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #d1d9e6;
        border-radius: 8px;
        font-size: 0.95rem;
        background: #ffffff;
        color: var(--text-dark);
        transition: border-color 0.3s, box-shadow 0.3s;
      }

      .add-user-modal select,
      .edit-user-modal select {
        appearance: none;
        background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
        background-repeat: no-repeat;
        background-position-x: calc(100% - 10px);
        background-position-y: center;
        padding-right: 30px;
      }

      .add-user-modal input:focus,
      .add-user-modal select:focus,
      .edit-user-modal input:focus,
      .edit-user-modal select:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 8px rgba(74, 144, 226, 0.4);
        outline: none;
      }

      .add-user-modal .optional-label,
      .edit-user-modal .optional-label {
        color: #7f8c8d;
        font-size: 0.85rem;
        margin-left: 5px;
      }

      .delete-user-modal .modal-dialog {
        max-width: 500px;
      }

      .delete-user-modal .modal-header {
        background: linear-gradient(90deg, #e74c3c, #c0392b);
      }

      .delete-user-modal .modal-body {
        padding: 30px;
        background: #f8fafc;
      }

      .delete-user-modal .warning-section {
        background: #ffffff;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
      }

      .delete-user-modal .warning-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #e74c3c;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .delete-user-modal .warning-title i {
        color: #e74c3c;
      }

      .delete-user-modal .info-item {
        font-size: 0.95rem;
        margin-bottom: 10px;
      }

      .delete-user-modal .info-item span {
        font-weight: 600;
        color: var(--text-dark);
      }

      .delete-user-modal .warning-text {
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

      .view-user-modal .modal-dialog {
        max-width: 600px;
      }

      .view-user-modal .modal-content {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
      }

      .view-user-modal .modal-header {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        padding: 20px;
        border-top-left-radius: 16px;
        border-top-right-radius: 16px;
      }

      .view-user-modal .modal-title {
        font-size: 1.5rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .view-user-modal .modal-title i {
        color: var(--text-color);
      }

      .view-user-modal .modal-body {
        padding: 30px;
        background: #f8fafc;
      }

      .view-user-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }

      .view-user-modal .section:hover {
        transform: translateY(-2px);
      }

      .view-user-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .view-user-modal .section-title i {
        color: var(--primary-color);
      }

      .view-user-modal .info-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 10px;
        font-size: 0.95rem;
      }

      .view-user-modal .info-label {
        font-weight: 500;
        color: var(--text-dark);
        width: 150px;
        flex-shrink: 0;
      }

      .view-user-modal .info-value {
        color: #555;
        flex: 1;
      }

      .view-user-modal .badge {
        font-size: 0.85rem;
        padding: 5px 10px;
      }

      .view-user-modal .modal-footer {
        padding: 15px 30px;
        background: #ffffff;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
      }

      .view-user-modal .btn-cancel {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        color: var(--text-color);
        border: none;
        padding: 10px 20px;
        font-weight: 600;
      }

      .view-user-modal .btn-cancel:hover {
        background: linear-gradient(90deg, var(--accent-color), var(--primary-color));
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 144, 226, 0.4);
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
              <label for="roleFilter">Vai Trò:</label>
              <select class="form-select" id="roleFilter">
                <option value="">Tất cả</option>
                <option value="Học Viên">Học Viên</option>
                <option value="Giảng Viên">Giảng Viên</option>
                <option value="Quản Trị">Quản Trị</option>
              </select>
              <label for="statusFilter">Trạng Thái:</label>
              <select class="form-select" id="statusFilter">
                <option value="">Tất cả</option>
                <option value="Hoạt Động">Hoạt Động</option>
                <option value="Khóa">Khóa</option>
              </select>
              <label for="createdDateFilter">Ngày Tạo:</label>
              <input type="date" class="form-control" id="createdDateFilter" />
              <label for="courseFilter">Số Khóa Học:</label>
              <input type="number" class="form-control" id="courseFilter" min="0" value="0" />
              <label for="nameSearch">Tìm Tên:</label>
              <input type="text" class="form-control" id="nameSearch" placeholder="Tìm theo tên..." />
            </div>
            <!-- Users Table -->
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>AVATAR</th>
                    <th>HỌ TÊN</th>
                    <th>USERNAME</th>
                    <th>EMAIL</th>
                    <th>VAI TRÒ</th>
                    <th>TRẠNG THÁI</th>
                    <th>SỐ KHÓA HỌC</th>
                    <th>NGÀY TẠO</th>
                    <th>HÀNH ĐỘNG</th>
                  </tr>
                </thead>
                <tbody id="userTableBody">
                  <tr>
                    <td>USR001</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>nguyenvana</td>
                    <td>nguyenvana@example.com</td>
                    <td>Học Viên</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>3</td>
                    <td>2025-05-01</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR001" data-full-name="Nguyễn Văn A" data-username="nguyenvana" 
                              data-email="nguyenvana@example.com" data-role="Học Viên" data-status="Hoạt Động" 
                              data-courses="3" data-created-date="2025-05-01"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR001" data-full-name="Nguyễn Văn A" data-username="nguyenvana" 
                              data-email="nguyenvana@example.com" data-role="Học Viên" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR001" data-full-name="Nguyễn Văn A"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR002</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Trần Thị B</td>
                    <td>tranb</td>
                    <td>tranb@example.com</td>
                    <td>Giảng Viên</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2</td>
                    <td>2025-05-02</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR002" data-full-name="Trần Thị B" data-username="tranb" 
                              data-email="tranb@example.com" data-role="Giảng Viên" data-status="Hoạt Động" 
                              data-courses="2" data-created-date="2025-05-02"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR002" data-full-name="Trần Thị B" data-username="tranb" 
                              data-email="tranb@example.com" data-role="Giảng Viên" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR002" data-full-name="Trần Thị B"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR003</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>levanc</td>
                    <td>levanc@example.com</td>
                    <td>Học Viên</td>
                    <td><span class="badge badge-inactive">Khóa</span></td>
                    <td>1</td>
                    <td>2025-05-03</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR003" data-full-name="Lê Văn C" data-username="levanc" 
                              data-email="levanc@example.com" data-role="Học Viên" data-status="Khóa" 
                              data-courses="1" data-created-date="2025-05-03"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR003" data-full-name="Lê Văn C" data-username="levanc" 
                              data-email="levanc@example.com" data-role="Học Viên" data-status="Khóa"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR003" data-full-name="Lê Văn C"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR004</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Phạm Thị D</td>
                    <td>phamd</td>
                    <td>phamd@example.com</td>
                    <td>Quản Trị</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>0</td>
                    <td>2025-05-04</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR004" data-full-name="Phạm Thị D" data-username="phamd" 
                              data-email="phamd@example.com" data-role="Quản Trị" data-status="Hoạt Động" 
                              data-courses="0" data-created-date="2025-05-04"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR004" data-full-name="Phạm Thị D" data-username="phamd" 
                              data-email="phamd@example.com" data-role="Quản Trị" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR004" data-full-name="Phạm Thị D"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR005</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>hoange</td>
                    <td>hoange@example.com</td>
                    <td>Học Viên</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>4</td>
                    <td>2025-05-05</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR005" data-full-name="Hoàng Văn E" data-username="hoange" 
                              data-email="hoange@example.com" data-role="Học Viên" data-status="Hoạt Động" 
                              data-courses="4" data-created-date="2025-05-05"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR005" data-full-name="Hoàng Văn E" data-username="hoange" 
                              data-email="hoange@example.com" data-role="Học Viên" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR005" data-full-name="Hoàng Văn E"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR006</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Đỗ Thị F</td>
                    <td>dof1</td>
                    <td>dof1@example.com</td>
                    <td>Giảng Viên</td>
                    <td><span class="badge badge-inactive">Khóa</span></td>
                    <td>1</td>
                    <td>2025-05-06</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR006" data-full-name="Đỗ Thị F" data-username="dof1" 
                              data-email="dof1@example.com" data-role="Giảng Viên" data-status="Khóa" 
                              data-courses="1" data-created-date="2025-05-06"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR006" data-full-name="Đỗ Thị F" data-username="dof1" 
                              data-email="dof1@example.com" data-role="Giảng Viên" data-status="Khóa"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR006" data-full-name="Đỗ Thị F"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR007</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Ngô Văn G</td>
                    <td>ngog</td>
                    <td>ngog@example.com</td>
                    <td>Học Viên</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>5</td>
                    <td>2025-05-07</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR007" data-full-name="Ngô Văn G" data-username="ngog" 
                              data-email="ngog@example.com" data-role="Học Viên" data-status="Hoạt Động" 
                              data-courses="5" data-created-date="2025-05-07"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR007" data-full-name="Ngô Văn G" data-username="ngog" 
                              data-email="ngog@example.com" data-role="Học Viên" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR007" data-full-name="Ngô Văn G"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR008</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Vũ Thị H</td>
                    <td>vuh</td>
                    <td>vuh@example.com</td>
                    <td>Giảng Viên</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2</td>
                    <td>2025-05-08</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR008" data-full-name="Vũ Thị H" data-username="vuh" 
                              data-email="vuh@example.com" data-role="Giảng Viên" data-status="Hoạt Động" 
                              data-courses="2" data-created-date="2025-05-08"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR008" data-full-name="Vũ Thị H" data-username="vuh" 
                              data-email="vuh@example.com" data-role="Giảng Viên" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR008" data-full-name="Vũ Thị H"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR009</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Bùi Văn I</td>
                    <td>buii</td>
                    <td>buii@example.com</td>
                    <td>Học Viên</td>
                    <td><span class="badge badge-inactive">Khóa</span></td>
                    <td>1</td>
                    <td>2025-05-09</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR009" data-full-name="Bùi Văn I" data-username="buii" 
                              data-email="buii@example.com" data-role="Học Viên" data-status="Khóa" 
                              data-courses="1" data-created-date="2025-05-09"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR009" data-full-name="Bùi Văn I" data-username="buii" 
                              data-email="buii@example.com" data-role="Học Viên" data-status="Khóa"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR009" data-full-name="Bùi Văn I"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>USR010</td>
                    <td><img src="img/dashborad/defaultAvatar.jpg" alt="Avatar" /></td>
                    <td>Lý Thị K</td>
                    <td>lyk</td>
                    <td>lyk@example.com</td>
                    <td>Quản Trị</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>0</td>
                    <td>2025-05-10</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewUserModal" 
                              data-user-id="USR010" data-full-name="Lý Thị K" data-username="lyk" 
                              data-email="lyk@example.com" data-role="Quản Trị" data-status="Hoạt Động" 
                              data-courses="0" data-created-date="2025-05-10"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editUserModal" 
                              data-user-id="USR010" data-full-name="Lý Thị K" data-username="lyk" 
                              data-email="lyk@example.com" data-role="Quản Trị" data-status="Hoạt Động"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteUserModal" 
                              data-user-id="USR010" data-full-name="Lý Thị K"><i class="fas fa-trash"></i></button>
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
            <!-- Add User Modal -->
            <div class="modal fade add-user-modal" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel"><i class="fas fa-plus-circle"></i> Thêm Tài Khoản</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/AddUserServlet" method="POST">
                    <div class="modal-body">
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-user"></i> Thông Tin Cá Nhân</h6>
                        <div class="form-group">
                          <label for="fullName">Họ Tên <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Nhập họ tên" required />
                        </div>
                      </div>
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-user-shield"></i> Thông Tin Tài Khoản</h6>
                        <div class="form-group">
                          <label for="username">Username <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="username" name="username" placeholder="Nhập username" required />
                        </div>
                        <div class="form-group">
                          <label for="email">Email <span class="text-danger">*</span></label>
                          <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email" required />
                        </div>
                        <div class="form-group">
                          <label for="password">Mật Khẩu <span class="text-danger">*</span></label>
                          <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required />
                        </div>
                        <div class="form-group">
                          <label for="role">Vai Trò <span class="text-danger">*</span></label>
                          <select class="form-select" id="role" name="role" required>
                            <option value="" disabled selected>Chọn vai trò</option>
                            <option value="Học Viên">Học Viên</option>
                            <option value="Giảng Viên">Giảng Viên</option>
                            <option value="Quản Trị">Quản Trị</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="status">Trạng Thái <span class="text-danger">*</span></label>
                          <select class="form-select" id="status" name="status" required>
                            <option value="" disabled selected>Chọn trạng thái</option>
                            <option value="Hoạt Động">Hoạt Động</option>
                            <option value="Khóa">Khóa</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                      <button type="submit" class="btn btn-submit">Thêm</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <!-- View User Modal -->
            <div class="modal fade view-user-modal" id="viewUserModal" tabindex="-1" aria-labelledby="viewUserModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="viewUserModalLabel"><i class="fas fa-user"></i> Chi Tiết Tài Khoản</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-user"></i> Thông Tin Cá Nhân</h6>
                      <div class="info-item">
                        <span class="info-label">ID Tài Khoản:</span>
                        <span class="info-value" id="viewUserId"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Họ Tên:</span>
                        <span class="info-value" id="viewFullName"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-user-shield"></i> Thông Tin Tài Khoản</h6>
                      <div class="info-item">
                        <span class="info-label">Username:</span>
                        <span class="info-value" id="viewUsername"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Email:</span>
                        <span class="info-value" id="viewEmail"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Vai Trò:</span>
                        <span class="info-value" id="viewRole"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Trạng Thái:</span>
                        <span class="info-value" id="viewStatus"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Số Khóa Học:</span>
                        <span class="info-value" id="viewCourses"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Ngày Tạo:</span>
                        <span class="info-value" id="viewCreatedDate"></span>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Đóng</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- Edit User Modal -->
            <div class="modal fade edit-user-modal" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel"><i class="fas fa-edit"></i> Chỉnh Sửa Tài Khoản</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/EditUserServlet" method="POST">
                    <div class="modal-body">
                      <input type="hidden" id="editUserId" name="userId" />
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-user"></i> Thông Tin Cá Nhân</h6>
                        <div class="form-group">
                          <label for="editFullName">Họ Tên <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="editFullName" name="fullName" placeholder="Nhập họ tên" required />
                        </div>
                      </div>
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-user-shield"></i> Thông Tin Tài Khoản</h6>
                        <div class="form-group">
                          <label for="editUsername">Username <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="editUsername" name="username" placeholder="Nhập username" required />
                        </div>
                        <div class="form-group">
                          <label for="editEmail">Email <span class="text-danger">*</span></label>
                          <input type="email" class="form-control" id="editEmail" name="email" placeholder="Nhập email" required />
                        </div>
                        <div class="form-group">
                          <label for="editPassword">Mật Khẩu <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="password" class="form-control" id="editPassword" name="password" placeholder="Nhập mật khẩu mới (nếu muốn thay đổi)" />
                        </div>
                        <div class="form-group">
                          <label for="editRole">Vai Trò <span class="text-danger">*</span></label>
                          <select class="form-select" id="editRole" name="role" required>
                            <option value="" disabled>Chọn vai trò</option>
                            <option value="Học Viên">Học Viên</option>
                            <option value="Giảng Viên">Giảng Viên</option>
                            <option value="Quản Trị">Quản Trị</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editStatus">Trạng Thái <span class="text-danger">*</span></label>
                          <select class="form-select" id="editStatus" name="status" required>
                            <option value="" disabled>Chọn trạng thái</option>
                            <option value="Hoạt Động">Hoạt Động</option>
                            <option value="Khóa">Khóa</option>
                          </select>
                        </div>
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
            <!-- Delete User Modal -->
            <div class="modal fade delete-user-modal" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="deleteUserModalLabel"><i class="fas fa-trash-alt"></i> Xác Nhận Xóa Tài Khoản</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="warning-section">
                      <h6 class="warning-title"><i class="fas fa-exclamation-triangle"></i> Cảnh Báo</h6>
                      <div class="info-item">
                        Bạn có chắc chắn muốn xóa tài khoản <span id="deleteFullName"></span> (ID: <span id="deleteUserId"></span>)?
                      </div>
                      <div class="warning-text">
                        Hành động này không thể hoàn tác. Vui lòng xác nhận.
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                    <form action="/DeleteUserServlet" method="POST">
                      <input type="hidden" id="deleteUserIdInput" name="userId" />
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
      // Pagination and filtering logic
      const rowsPerPage = 10;
      let currentPage = 1;
      let filteredRows = [];

      // Get all rows
      const allRows = Array.from(document.querySelectorAll('#userTableBody tr'));

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
      document.querySelectorAll('#roleFilter, #statusFilter, #createdDateFilter, #courseFilter, #nameSearch').forEach(filter => {
        filter.addEventListener('change', applyFilters);
        filter.addEventListener('input', applyFilters);
      });

      function applyFilters() {
        const role = document.getElementById('roleFilter').value.toLowerCase();
        const status = document.getElementById('statusFilter').value.toLowerCase();
        const createdDate = document.getElementById('createdDateFilter').value;
        const courseCount = document.getElementById('courseFilter').value;
        const nameSearch = document.getElementById('nameSearch').value.toLowerCase();

        filteredRows = allRows.filter(row => {
          const roleText = row.cells[5].textContent.toLowerCase();
          const statusText = row.cells[6].textContent.toLowerCase().replace('hoạt động', 'hoạt động').replace('khóa', 'khóa');
          const createdDateText = row.cells[8].textContent;
          const courseText = parseInt(row.cells[7].textContent) || 0;
          const nameText = row.cells[2].textContent.toLowerCase();

          const matchesRole = role === '' || roleText.includes(role);
          const matchesStatus = status === '' || statusText.includes(status);
          const matchesDate = !createdDate || createdDateText === createdDate;
          const matchesCourses = courseCount === '' || courseText >= parseInt(courseCount);
          const matchesName = !nameSearch || nameText.includes(nameSearch);

          return matchesRole && matchesStatus && matchesDate && matchesCourses && matchesName;
        });

        currentPage = 1; // Reset to first page on filter change
        updatePagination();
      }

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

      // View user details modal logic
      document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', function () {
          const userId = this.getAttribute('data-user-id');
          const fullName = this.getAttribute('data-full-name');
          const username = this.getAttribute('data-username');
          const email = this.getAttribute('data-email');
          const role = this.getAttribute('data-role');
          const status = this.getAttribute('data-status');
          const courses = this.getAttribute('data-courses');
          const createdDate = this.getAttribute('data-created-date');

          document.getElementById('viewUserId').textContent = userId;
          document.getElementById('viewFullName').textContent = fullName;
          document.getElementById('viewUsername').textContent = username;
          document.getElementById('viewEmail').textContent = email;
          document.getElementById('viewRole').textContent = role;
          document.getElementById('viewStatus').innerHTML = status === 'Hoạt Động' 
            ? '<span class="badge badge-active">Hoạt Động</span>' 
            : '<span class="badge badge-inactive">Khóa</span>';
          document.getElementById('viewCourses').textContent = courses;
          document.getElementById('viewCreatedDate').textContent = createdDate;
        });
      });

      // Edit user modal logic
      document.querySelectorAll('.btn-edit').forEach(button => {
        button.addEventListener('click', function () {
          const userId = this.getAttribute('data-user-id');
          const fullName = this.getAttribute('data-full-name');
          const username = this.getAttribute('data-username');
          const email = this.getAttribute('data-email');
          const role = this.getAttribute('data-role');
          const status = this.getAttribute('data-status');

          document.getElementById('editUserId').value = userId;
          document.getElementById('editFullName').value = fullName;
          document.getElementById('editUsername').value = username;
          document.getElementById('editEmail').value = email;
          document.getElementById('editRole').value = role;
          document.getElementById('editStatus').value = status;
          document.getElementById('editPassword').value = ''; // Clear password field
        });
      });

      // Delete user modal logic
      document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', function () {
          const userId = this.getAttribute('data-user-id');
          const fullName = this.getAttribute('data-full-name');

          document.getElementById('deleteUserId').textContent = userId;
          document.getElementById('deleteFullName').textContent = fullName;
          document.getElementById('deleteUserIdInput').value = userId;
        });
      });

      // Initial pagination setup
      updatePagination();
    </script>
  </body>
</html>