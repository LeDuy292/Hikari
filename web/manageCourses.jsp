<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản Lý Khóa Học - HIKARI</title>
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

      .filter-section input[type="text"] {
        flex: 1;
        min-width: 220px;
        background: linear-gradient(180deg, #ffffff, #f1f5f9);
      }

      .filter-section input[type="text"]::placeholder {
        color: #7f8c8d;
      }

      /* Custom styling for select dropdown to always show caret */
      .filter-section select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
        background-repeat: no-repeat;
        background-position-x: calc(100% - 10px);
        background-position-y: center;
        padding-right: 30px; /* Space for the caret */
      }
      .table { background: #ffffff; border-radius: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); }
      .table th, .table td { vertical-align: middle; color: var(--text-dark); }
      .table th { background-color: var(--table-header-color); color: var(--text-color); }
      .table thead { background-color: var(--table-header-color); color: var(--text-color); }
      
      
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

      /* Add Course Button */
      .btn-add-course {
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

      .btn-add-course:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(74, 144, 226, 0.4);
        background: linear-gradient(90deg, var(--accent-color), var(--primary-color));
      }

      /* Modal Styling */
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

      /* Form Modal Styling (Add/Edit) */
      .add-course-modal .modal-dialog,
      .edit-course-modal .modal-dialog {
        max-width: 600px;
      }

      .add-course-modal .section,
      .edit-course-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }

      .add-course-modal .section:hover,
      .edit-course-modal .section:hover {
        transform: translateY(-2px);
      }

      .add-course-modal .section-title,
      .edit-course-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .add-course-modal .section-title i,
      .edit-course-modal .section-title i {
        color: var(--primary-color);
      }

      .add-course-modal .form-group,
      .edit-course-modal .form-group {
        margin-bottom: 15px;
      }

      .add-course-modal label,
      .edit-course-modal label {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--text-dark);
        margin-bottom: 8px;
        display: block;
      }

      .add-course-modal input,
      .add-course-modal select,
      .add-course-modal textarea,
      .edit-course-modal input,
      .edit-course-modal select,
      .edit-course-modal textarea {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #d1d9e6;
        border-radius: 8px;
        font-size: 0.95rem;
        background: #ffffff;
        color: var(--text-dark);
        transition: border-color 0.3s, box-shadow 0.3s;
      }

      .add-course-modal textarea,
      .edit-course-modal textarea {
        resize: vertical;
        min-height: 100px;
      }

      .add-course-modal select,
      .edit-course-modal select {
        appearance: none;
        background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
        background-repeat: no-repeat;
        background-position-x: calc(100% - 10px);
        background-position-y: center;
        padding-right: 30px;
      }

      .add-course-modal input:focus,
      .add-course-modal select:focus,
      .add-course-modal textarea:focus,
      .edit-course-modal input:focus,
      .edit-course-modal select:focus,
      .edit-course-modal textarea:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 8px rgba(74, 144, 226, 0.4);
        outline: none;
      }

      .add-course-modal .optional-label,
      .edit-course-modal .optional-label {
        color: #7f8c8d;
        font-size: 0.85rem;
        margin-left: 5px;
      }

      /* Delete Modal Styling */
      .delete-course-modal .modal-dialog {
        max-width: 500px;
      }

      .delete-course-modal .modal-header {
        background: linear-gradient(90deg, #e74c3c, #c0392b);
      }

      .delete-course-modal .modal-body {
        padding: 30px;
        background: #f8fafc;
      }

      .delete-course-modal .warning-section {
        background: #ffffff;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
      }

      .delete-course-modal .warning-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #e74c3c;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .delete-course-modal .warning-title i {
        color: #e74c3c;
      }

      .delete-course-modal .info-item {
        font-size: 0.95rem;
        margin-bottom: 10px;
      }

      .delete-course-modal .info-item span {
        font-weight: 600;
        color: var(--text-dark);
      }

      .delete-course-modal .warning-text {
        font-size: 0.9rem;
        color: #555;
        margin-top: 10px;
      }

      /* Buttons */
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

      /* View Course Modal Styling (unchanged from previous) */
      .view-course-modal .modal-dialog {
        max-width: 600px;
      }

      .view-course-modal .modal-content {
        background: #ffffff;
        border-radius: 16px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
      }

      .view-course-modal .modal-header {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        padding: 20px;
        border-top-left-radius: 16px;
        border-top-right-radius: 16px;
      }

      .view-course-modal .modal-title {
        font-size: 1.5rem;
        font-weight: 700;
        display: flex;
        align-items: center;
        gap: 10px;
      }

      .view-course-modal .modal-title i {
        color: var(--text-color);
      }

      .view-course-modal .modal-body {
        padding: 30px;
        background: #f8fafc;
      }

      .view-course-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }

      .view-course-modal .section:hover {
        transform: translateY(-2px);
      }

      .view-course-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .view-course-modal .section-title i {
        color: var(--primary-color);
      }

      .view-course-modal .info-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 10px;
        font-size: 0.95rem;
      }

      .view-course-modal .info-label {
        font-weight: 500;
        color: var(--text-dark);
        width: 150px;
        flex-shrink: 0;
      }

      .view-course-modal .info-value {
        color: #555;
        flex: 1;
      }

      .view-course-modal .badge {
        font-size: 0.85rem;
        padding: 5px 10px;
      }

      .view-course-modal .modal-footer {
        padding: 15px 30px;
        background: #ffffff;
        border-bottom-left-radius: 16px;
        border-bottom-right-radius: 16px;
      }

      .view-course-modal .btn-cancel {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        color: var(--text-color);
        border: none;
        padding: 10px 20px;
        font-weight: 600;
      }

      .view-course-modal .btn-cancel:hover {
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
              <label for="teacherFilter">Giáo Viên:</label>
              <select class="form-select" id="teacherFilter">
                <option value="">Tất cả</option>
                <option value="Trần Thị B">Trần Thị B</option>
                <option value="Đỗ Thị F">Đỗ Thị F</option>
                <option value="Vũ Thị H">Vũ Thị H</option>
              </select>
              <label for="levelFilter">Cấp Độ:</label>
              <select class="form-select" id="levelFilter">
                <option value="">Tất cả</option>
                <option value="Sơ Cấp">Sơ Cấp</option>
                <option value="Trung Cấp">Trung Cấp</option>
                <option value="Cao Cấp">Cao Cấp</option>
              </select>
              <label for="statusFilter">Trạng Thái:</label>
              <select class="form-select" id="statusFilter">
                <option value="">Tất cả</option>
                <option value="Hoạt Động">Hoạt Động</option>
                <option value="Khóa">Khóa</option>
              </select>
              <label for="createdDateFilter">Ngày Tạo:</label>
              <input type="date" class="form-control" id="createdDateFilter" />
              <label for="nameSearch">Tìm Kiếm:</label>
              <input type="text" class="form-control" id="nameSearch" placeholder="Tìm theo tên khóa học..." />
            </div>
            <!-- Courses Table -->
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>TÊN KHÓA HỌC</th>
                    <th>GIẢNG VIÊN</th>
                    <th>HỌC VIÊN</th>
                    <th>CẤP ĐỘ</th>
                    <th>TRẠNG THÁI</th>
                    <th>NGÀY TẠO</th>
                    <th>MÃ GIẢM GIÁ</th>
                    <th>HÀNH ĐỘNG</th>
                  </tr>
                </thead>
                <tbody id="courseTableBody">
                  <tr>
                    <td>CRS001</td>
                    <td>Tiếng Nhật Sơ Cấp N5</td>
                    <td>Trần Thị B</td>
                    <td>25</td>
                    <td>Sơ Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-01</td>
                    <td><span class="badge badge-active">N5DISC10</span> (10%)</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS001" data-course-name="Tiếng Nhật Sơ Cấp N5" data-teacher="Trần Thị B" 
                              data-students="25" data-level="Sơ Cấp" data-status="Hoạt Động" data-created-date="2025-05-01" 
                              data-discount-code="N5DISC10" data-discount-percent="10" data-description="Khóa học nhập môn tiếng Nhật N5" 
                              data-duration="3 tháng" data-price="3000000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS001" data-course-name="Tiếng Nhật Sơ Cấp N5" data-teacher="Trần Thị B" 
                              data-level="Sơ Cấp" data-status="Hoạt Động" data-discount-code="N5DISC10" 
                              data-discount-percent="10" data-description="Khóa học nhập môn tiếng Nhật N5" 
                              data-duration="3 tháng" data-price="3000000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS001" data-course-name="Tiếng Nhật Sơ Cấp N5"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS002</td>
                    <td>Tiếng Nhật Trung Cấp N3</td>
                    <td>Đỗ Thị F</td>
                    <td>15</td>
                    <td>Trung Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-02</td>
                    <td><span class="badge badge-inactive">Không có</span></td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS002" data-course-name="Tiếng Nhật Trung Cấp N3" data-teacher="Đỗ Thị F" 
                              data-students="15" data-level="Trung Cấp" data-status="Hoạt Động" data-created-date="2025-05-02" 
                              data-discount-code="" data-discount-percent="0" data-description="Khóa học tiếng Nhật trình độ trung cấp N3" 
                              data-duration="4 tháng" data-price="4500000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS002" data-course-name="Tiếng Nhật Trung Cấp N3" data-teacher="Đỗ Thị F" 
                              data-level="Trung Cấp" data-status="Hoạt Động" data-discount-code="" data-discount-percent="0" 
                              data-description="Khóa học tiếng Nhật trình độ trung cấp N3" data-duration="4 tháng" 
                              data-price="4500000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS002" data-course-name="Tiếng Nhật Trung Cấp N3"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS003</td>
                    <td>Tiếng Nhật Cao Cấp N1</td>
                    <td>Vũ Thị H</td>
                    <td>10</td>
                    <td>Cao Cấp</td>
                    <td><span class="badge badge-inactive">Khóa</span></td>
                    <td>2025-05-03</td>
                    <td><span class="badge badge-active">N1DISC20</span> (20%)</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS003" data-course-name="Tiếng Nhật Cao Cấp N1" data-teacher="Vũ Thị H" 
                              data-students="10" data-level="Cao Cấp" data-status="Khóa" data-created-date="2025-05-03" 
                              data-discount-code="N1DISC20" data-discount-percent="20" data-description="Khóa học tiếng Nhật trình độ cao cấp N1" 
                              data-duration="6 tháng" data-price="6000000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS003" data-course-name="Tiếng Nhật Cao Cấp N1" data-teacher="Vũ Thị H" 
                              data-level="Cao Cấp" data-status="Khóa" data-discount-code="N1DISC20" data-discount-percent="20" 
                              data-description="Khóa học tiếng Nhật trình độ cao cấp N1" data-duration="6 tháng" 
                              data-price="6000000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS003" data-course-name="Tiếng Nhật Cao Cấp N1"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS004</td>
                    <td>Kanji Sơ Cấp</td>
                    <td>Trần Thị B</td>
                    <td>30</td>
                    <td>Sơ Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-04</td>
                    <td><span class="badge badge-inactive">Không có</span></td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS004" data-course-name="Kanji Sơ Cấp" data-teacher="Trần Thị B" 
                              data-students="30" data-level="Sơ Cấp" data-status="Hoạt Động" data-created-date="2025-05-04" 
                              data-discount-code="" data-discount-percent="0" data-description="Khóa học Kanji cơ bản" 
                              data-duration="2 tháng" data-price="2000000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS004" data-course-name="Kanji Sơ Cấp" data-teacher="Trần Thị B" 
                              data-level="Sơ Cấp" data-status="Hoạt Động" data-discount-code="" data-discount-percent="0" 
                              data-description="Khóa học Kanji cơ bản" data-duration="2 tháng" data-price="2000000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS004" data-course-name="Kanji Sơ Cấp"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS005</td>
                    <td>Luyện Thi JLPT N4</td>
                    <td>Đỗ Thị F</td>
                    <td>20</td>
                    <td>Trung Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-05</td>
                    <td><span class="badge badge-active">N4DISC15</span> (15%)</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS005" data-course-name="Luyện Thi JLPT N4" data-teacher="Đỗ Thị F" 
                              data-students="20" data-level="Trung Cấp" data-status="Hoạt Động" data-created-date="2025-05-05" 
                              data-discount-code="N4DISC15" data-discount-percent="15" data-description="Khóa luyện thi JLPT N4" 
                              data-duration="3 tháng" data-price="3500000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS005" data-course-name="Luyện Thi JLPT N4" data-teacher="Đỗ Thị F" 
                              data-level="Trung Cấp" data-status="Hoạt Động" data-discount-code="N4DISC15" 
                              data-discount-percent="15" data-description="Khóa luyện thi JLPT N4" data-duration="3 tháng" 
                              data-price="3500000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS005" data-course-name="Luyện Thi JLPT N4"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS006</td>
                    <td>Hội Thoại Tiếng Nhật</td>
                    <td>Vũ Thị H</td>
                    <td>18</td>
                    <td>Trung Cấp</td>
                    <td><span class="badge badge-inactive">Khóa</span></td>
                    <td>2025-05-06</td>
                    <td><span class="badge badge-inactive">Không có</span></td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS006" data-course-name="Hội Thoại Tiếng Nhật" data-teacher="Vũ Thị H" 
                              data-students="18" data-level="Trung Cấp" data-status="Khóa" data-created-date="2025-05-06" 
                              data-discount-code="" data-discount-percent="0" data-description="Khóa học hội thoại thực hành" 
                              data-duration="2 tháng" data-price="2500000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS006" data-course-name="Hội Thoại Tiếng Nhật" data-teacher="Vũ Thị H" 
                              data-level="Trung Cấp" data-status="Khóa" data-discount-code="" data-discount-percent="0" 
                              data-description="Khóa học hội thoại thực hành" data-duration="2 tháng" data-price="2500000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS006" data-course-name="Hội Thoại Tiếng Nhật"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS007</td>
                    <td>Tiếng Nhật Doanh Nghiệp</td>
                    <td>Trần Thị B</td>
                    <td>12</td>
                    <td>Cao Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-07</td>
                    <td><span class="badge badge-active">BIZDISC25</span> (25%)</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS007" data-course-name="Tiếng Nhật Doanh Nghiệp" data-teacher="Trần Thị B" 
                              data-students="12" data-level="Cao Cấp" data-status="Hoạt Động" data-created-date="2025-05-07" 
                              data-discount-code="BIZDISC25" data-discount-percent="25" data-description="Khóa học tiếng Nhật cho doanh nghiệp" 
                              data-duration="5 tháng" data-price="5500000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS007" data-course-name="Tiếng Nhật Doanh Nghiệp" data-teacher="Trần Thị B" 
                              data-level="Cao Cấp" data-status="Hoạt Động" data-discount-code="BIZDISC25" 
                              data-discount-percent="25" data-description="Khóa học tiếng Nhật cho doanh nghiệp" 
                              data-duration="5 tháng" data-price="5500000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS007" data-course-name="Tiếng Nhật Doanh Nghiệp"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS008</td>
                    <td>Ngữ Pháp N3</td>
                    <td>Đỗ Thị F</td>
                    <td>22</td>
                    <td>Trung Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-08</td>
                    <td><span class="badge badge-inactive">Không có</span></td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS008" data-course-name="Ngữ Pháp N3" data-teacher="Đỗ Thị F" 
                              data-students="22" data-level="Trung Cấp" data-status="Hoạt Động" data-created-date="2025-05-08" 
                              data-discount-code="" data-discount-percent="0" data-description="Khóa học ngữ pháp N3 chuyên sâu" 
                              data-duration="3 tháng" data-price="3200000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS008" data-course-name="Ngữ Pháp N3" data-teacher="Đỗ Thị F" 
                              data-level="Trung Cấp" data-status="Hoạt Động" data-discount-code="" data-discount-percent="0" 
                              data-description="Khóa học ngữ pháp N3 chuyên sâu" data-duration="3 tháng" data-price="3200000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS008" data-course-name="Ngữ Pháp N3"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS009</td>
                    <td>Kanji Cao Cấp</td>
                    <td>Vũ Thị H</td>
                    <td>8</td>
                    <td>Cao Cấp</td>
                    <td><span class="badge badge-inactive">Khóa</span></td>
                    <td>2025-05-09</td>
                    <td><span class="badge badge-active">KANJIDISC30</span> (30%)</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS009" data-course-name="Kanji Cao Cấp" data-teacher="Vũ Thị H" 
                              data-students="8" data-level="Cao Cấp" data-status="Khóa" data-created-date="2025-05-09" 
                              data-discount-code="KANJIDISC30" data-discount-percent="30" data-description="Khóa học Kanji trình độ cao cấp" 
                              data-duration="4 tháng" data-price="5000000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS009" data-course-name="Kanji Cao Cấp" data-teacher="Vũ Thị H" 
                              data-level="Cao Cấp" data-status="Khóa" data-discount-code="KANJIDISC30" 
                              data-discount-percent="30" data-description="Khóa học Kanji trình độ cao cấp" 
                              data-duration="4 tháng" data-price="5000000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS009" data-course-name="Kanji Cao Cấp"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>CRS010</td>
                    <td>Luyện Thi JLPT N2</td>
                    <td>Trần Thị B</td>
                    <td>14</td>
                    <td>Cao Cấp</td>
                    <td><span class="badge badge-active">Hoạt Động</span></td>
                    <td>2025-05-10</td>
                    <td><span class="badge badge-inactive">Không có</span></td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewCourseModal" 
                              data-course-id="CRS010" data-course-name="Luyện Thi JLPT N2" data-teacher="Trần Thị B" 
                              data-students="14" data-level="Cao Cấp" data-status="Hoạt Động" data-created-date="2025-05-10" 
                              data-discount-code="" data-discount-percent="0" data-description="Khóa luyện thi JLPT N2" 
                              data-duration="5 tháng" data-price="5200000"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editCourseModal" 
                              data-course-id="CRS010" data-course-name="Luyện Thi JLPT N2" data-teacher="Trần Thị B" 
                              data-level="Cao Cấp" data-status="Hoạt Động" data-discount-code="" data-discount-percent="0" 
                              data-description="Khóa luyện thi JLPT N2" data-duration="5 tháng" data-price="5200000"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteCourseModal" 
                              data-course-id="CRS010" data-course-name="Luyện Thi JLPT N2"><i class="fas fa-trash"></i></button>
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
            <!-- Add Course Modal -->
            <div class="modal fade add-course-modal" id="addCourseModal" tabindex="-1" aria-labelledby="addCourseModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="addCourseModalLabel"><i class="fas fa-plus-circle"></i> Thêm Khóa Học</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/AddCourseServlet" method="POST">
                    <div class="modal-body">
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-info-circle"></i> Thông Tin Khóa Học</h6>
                        <div class="form-group">
                          <label for="courseName">Tên Khóa Học <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="courseName" name="courseName" placeholder="Nhập tên khóa học" required />
                        </div>
                        <div class="form-group">
                          <label for="teacher">Giảng Viên <span class="text-danger">*</span></label>
                          <select class="form-select" id="teacher" name="teacher" required>
                            <option value="" disabled selected>Chọn giảng viên</option>
                            <option value="Trần Thị B">Trần Thị B</option>
                            <option value="Đỗ Thị F">Đỗ Thị F</option>
                            <option value="Vũ Thị H">Vũ Thị H</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="level">Cấp Độ <span class="text-danger">*</span></label>
                          <select class="form-select" id="level" name="level" required>
                            <option value="" disabled selected>Chọn cấp độ</option>
                            <option value="Sơ Cấp">Sơ Cấp</option>
                            <option value="Trung Cấp">Trung Cấp</option>
                            <option value="Cao Cấp">Cao Cấp</option>
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
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-file-alt"></i> Mô Tả & Thời Lượng</h6>
                        <div class="form-group">
                          <label for="description">Mô Tả <span class="optional-label">(Tùy chọn)</span></label>
                          <textarea class="form-control" id="description" name="description" placeholder="Nhập mô tả khóa học"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="duration">Thời Lượng <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="text" class="form-control" id="duration" name="duration" placeholder="Ví dụ: 3 tháng" />
                        </div>
                      </div>
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-money-bill-wave"></i> Giá & Giảm Giá</h6>
                        <div class="form-group">
                          <label for="price">Giá (VND) <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="number" class="form-control" id="price" name="price" min="0" placeholder="Nhập giá khóa học" />
                        </div>
                        <div class="form-group">
                          <label for="discountCode">Mã Giảm Giá <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="text" class="form-control" id="discountCode" name="discountCode" placeholder="Ví dụ: DISCOUNT10" />
                        </div>
                        <div class="form-group">
                          <label for="discountPercent">Phần Trăm Giảm Giá (%) <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="number" class="form-control" id="discountPercent" name="discountPercent" min="0" max="100" placeholder="0-100" />
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
            <!-- Edit Course Modal -->
            <div class="modal fade edit-course-modal" id="editCourseModal" tabindex="-1" aria-labelledby="editCourseModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editCourseModalLabel"><i class="fas fa-edit"></i> Chỉnh Sửa Khóa Học</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/EditCourseServlet" method="POST">
                    <div class="modal-body">
                      <input type="hidden" id="editCourseId" name="courseId" />
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-info-circle"></i> Thông Tin Khóa Học</h6>
                        <div class="form-group">
                          <label for="editCourseName">Tên Khóa Học <span class="text-danger">*</span></label>
                          <input type="text" class="form-control" id="editCourseName" name="courseName" placeholder="Nhập tên khóa học" required />
                        </div>
                        <div class="form-group">
                          <label for="editTeacher">Giảng Viên <span class="text-danger">*</span></label>
                          <select class="form-select" id="editTeacher" name="teacher" required>
                            <option value="" disabled selected>Chọn giảng viên</option>
                            <option value="Trần Thị B">Trần Thị B</option>
                            <option value="Đỗ Thị F">Đỗ Thị F</option>
                            <option value="Vũ Thị H">Vũ Thị H</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editLevel">Cấp Độ <span class="text-danger">*</span></label>
                          <select class="form-select" id="editLevel" name="level" required>
                            <option value="" disabled selected>Chọn cấp độ</option>
                            <option value="Sơ Cấp">Sơ Cấp</option>
                            <option value="Trung Cấp">Trung Cấp</option>
                            <option value="Cao Cấp">Cao Cấp</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editStatus">Trạng Thái <span class="text-danger">*</span></label>
                          <select class="form-select" id="editStatus" name="status" required>
                            <option value="" disabled selected>Chọn trạng thái</option>
                            <option value="Hoạt Động">Hoạt Động</option>
                            <option value="Khóa">Khóa</option>
                          </select>
                        </div>
                      </div>
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-file-alt"></i> Mô Tả & Thời Lượng</h6>
                        <div class="form-group">
                          <label for="editDescription">Mô Tả <span class="optional-label">(Tùy chọn)</span></label>
                          <textarea class="form-control" id="editDescription" name="description" placeholder="Nhập mô tả khóa học"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="editDuration">Thời Lượng <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="text" class="form-control" id="editDuration" name="duration" placeholder="Ví dụ: 3 tháng" />
                        </div>
                      </div>
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-money-bill-wave"></i> Giá & Giảm Giá</h6>
                        <div class="form-group">
                          <label for="editPrice">Giá (VND) <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="number" class="form-control" id="editPrice" name="price" min="0" placeholder="Nhập giá khóa học" />
                        </div>
                        <div class="form-group">
                          <label for="editDiscountCode">Mã Giảm Giá <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="text" class="form-control" id="editDiscountCode" name="discountCode" placeholder="Ví dụ: DISCOUNT10" />
                        </div>
                        <div class="form-group">
                          <label for="editDiscountPercent">Phần Trăm Giảm Giá (%) <span class="optional-label">(Tùy chọn)</span></label>
                          <input type="number" class="form-control" id="editDiscountPercent" name="discountPercent" min="0" max="100" placeholder="0-100" />
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
            <!-- View Course Details Modal -->
            <div class="modal fade view-course-modal" id="viewCourseModal" tabindex="-1" aria-labelledby="viewCourseModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="viewCourseModalLabel"><i class="fas fa-book"></i> Chi Tiết Khóa Học</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-info-circle"></i> Thông Tin Khóa Học</h6>
                      <div class="info-item">
                        <span class="info-label">ID Khóa Học:</span>
                        <span class="info-value" id="viewCourseId"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Tên Khóa Học:</span>
                        <span class="info-value" id="viewCourseName"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Giảng Viên:</span>
                        <span class="info-value" id="viewTeacher"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Số Học Viên:</span>
                        <span class="info-value" id="viewStudents"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Cấp Độ:</span>
                        <span class="info-value" id="viewLevel"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Trạng Thái:</span>
                        <span class="info-value" id="viewStatus"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Ngày Tạo:</span>
                        <span class="info-value" id="viewCreatedDate"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-file-alt"></i> Mô Tả & Thời Lượng</h6>
                      <div class="info-item">
                        <span class="info-label">Mô Tả:</span>
                        <span class="info-value" id="viewDescription"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Thời Lượng:</span>
                        <span class="info-value" id="viewDuration"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-money-bill-wave"></i> Giá & Giảm Giá</h6>
                      <div class="info-item">
                        <span class="info-label">Giá (VND):</span>
                        <span class="info-value" id="viewPrice"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Mã Giảm Giá:</span>
                        <span class="info-value" id="viewDiscountCode"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Phần Trăm Giảm Giá:</span>
                        <span class="info-value" id="viewDiscountPercent"></span>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Đóng</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- Delete Course Confirmation Modal -->
            <div class="modal fade delete-course-modal" id="deleteCourseModal" tabindex="-1" aria-labelledby="deleteCourseModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="deleteCourseModalLabel"><i class="fas fa-trash-alt"></i> Xác Nhận Xóa Khóa Học</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="warning-section">
                      <h6 class="warning-title"><i class="fas fa-exclamation-triangle"></i> Cảnh Báo</h6>
                      <div class="info-item">
                        Bạn có chắc chắn muốn xóa khóa học <span id="deleteCourseName"></span> (ID: <span id="deleteCourseId"></span>)?
                      </div>
                      <div class="warning-text">
                        Hành động này không thể hoàn tác. Vui lòng xác nhận.
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                    <form action="/DeleteCourseServlet" method="POST">
                      <input type="hidden" id="deleteCourseIdInput" name="courseId" />
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
      const allRows = Array.from(document.querySelectorAll('#courseTableBody tr'));

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
      document.querySelectorAll('#teacherFilter, #levelFilter, #statusFilter, #createdDateFilter, #nameSearch').forEach(filter => {
        filter.addEventListener('change', applyFilters);
        filter.addEventListener('input', applyFilters);
      });

      function applyFilters() {
        const teacher = document.getElementById('teacherFilter').value.toLowerCase();
        const level = document.getElementById('levelFilter').value.toLowerCase();
        const status = document.getElementById('statusFilter').value.toLowerCase();
        const createdDate = document.getElementById('createdDateFilter').value;
        const nameSearch = document.getElementById('nameSearch').value.toLowerCase();

        filteredRows = allRows.filter(row => {
          const teacherText = row.cells[2].textContent.toLowerCase();
          const levelText = row.cells[4].textContent.toLowerCase();
          const statusText = row.cells[5].textContent.toLowerCase().replace('hoạt động', 'hoạt động').replace('khóa', 'khóa');
          const createdDateText = row.cells[6].textContent;
          const nameText = row.cells[1].textContent.toLowerCase();

          const matchesTeacher = teacher === '' || teacherText.includes(teacher);
          const matchesLevel = level === '' || levelText.includes(level);
          const matchesStatus = status === '' || statusText.includes(status);
          const matchesDate = !createdDate || createdDateText === createdDate;
          const matchesName = !nameSearch || nameText.includes(nameSearch);

          return matchesTeacher && matchesLevel && matchesStatus && matchesDate && matchesName;
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

     
      // View course details modal logic
      document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', function () {
          const courseId = this.getAttribute('data-course-id');
          const courseName = this.getAttribute('data-course-name');
          const teacher = this.getAttribute('data-teacher');
          const students = this.getAttribute('data-students');
          const level = this.getAttribute('data-level');
          const status = this.getAttribute('data-status');
          const createdDate = this.getAttribute('data-created-date');
          const description = this.getAttribute('data-description');
          const duration = this.getAttribute('data-duration');
          const price = this.getAttribute('data-price');
          const discountCode = this.getAttribute('data-discount-code') || 'Không có';
          const discountPercent = this.getAttribute('data-discount-percent') || '0';

          document.getElementById('viewCourseId').textContent = courseId;
          document.getElementById('viewCourseName').textContent = courseName;
          document.getElementById('viewTeacher').textContent = teacher;
          document.getElementById('viewStudents').textContent = students;
          document.getElementById('viewLevel').textContent = level;
          document.getElementById('viewStatus').innerHTML = status === 'Hoạt Động' 
            ? '<span class="badge badge-active">Hoạt Động</span>' 
            : '<span class="badge badge-inactive">Khóa</span>';
          document.getElementById('viewCreatedDate').textContent = createdDate;
          document.getElementById('viewDescription').textContent = description || 'Không có mô tả';
          document.getElementById('viewDuration').textContent = duration || 'Không xác định';
          document.getElementById('viewPrice').textContent = Number(price).toLocaleString('vi-VN') + ' VND';
          document.getElementById('viewDiscountCode').innerHTML = discountCode !== 'Không có' 
            ? `<span class="badge badge-active">${discountCode}</span>` 
            : '<span class="badge badge-inactive">Không có</span>';
          document.getElementById('viewDiscountPercent').textContent = discountPercent + '%';
        });
      });

      // Edit course modal logic
      document.querySelectorAll('.btn-edit').forEach(button => {
        button.addEventListener('click', function () {
          const courseId = this.getAttribute('data-course-id');
          const courseName = this.getAttribute('data-course-name');
          const teacher = this.getAttribute('data-teacher');
          const level = this.getAttribute('data-level');
          const status = this.getAttribute('data-status');
          const description = this.getAttribute('data-description');
          const duration = this.getAttribute('data-duration');
          const price = this.getAttribute('data-price');
          const discountCode = this.getAttribute('data-discount-code') || '';
          const discountPercent = this.getAttribute('data-discount-percent') || '';

          document.getElementById('editCourseId').value = courseId;
          document.getElementById('editCourseName').value = courseName;
          document.getElementById('editTeacher').value = teacher;
          document.getElementById('editLevel').value = level;
          document.getElementById('editStatus').value = status;
          document.getElementById('editDescription').value = description;
          document.getElementById('editDuration').value = duration;
          document.getElementById('editPrice').value = price;
          document.getElementById('editDiscountCode').value = discountCode;
          document.getElementById('editDiscountPercent').value = discountPercent;
        });
      });

      // Delete course modal logic
      document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', function () {
          const courseId = this.getAttribute('data-course-id');
          const courseName = this.getAttribute('data-course-name');

          document.getElementById('deleteCourseId').textContent = courseId;
          document.getElementById('deleteCourseName').textContent = courseName;
          document.getElementById('deleteCourseIdInput').value = courseId;
        });
      });

      // Initial pagination setup
      updatePagination();
    </script>
  </body>
</html>