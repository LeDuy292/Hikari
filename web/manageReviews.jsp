<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản Lý Đánh Giá - HIKARI</title>
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
      .rating-stars { color: #f39c12; }
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
      .table-avatar { width: 40px; height: 40px; border-radius: 50%; object-fit: cover; }
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
      .view-review-modal .modal-dialog {
        max-width: 800px;
      }
      .view-review-modal .reviewer-info {
        display: flex;
        align-items: center;
        gap: 15px;
        margin-bottom: 10px;
      }
      .view-review-modal .reviewer-avatar { width: 50px; height: 50px; border-radius: 50%; object-fit: cover; }
      .view-review-modal .section,
      .edit-review-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }
      .view-review-modal .section:hover,
      .edit-review-modal .section:hover {
        transform: translateY(-2px);
      }
      .view-review-modal .section-title,
      .edit-review-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }
      .view-review-modal .section-title i,
      .edit-review-modal .section-title i {
        color: var(--primary-color);
      }
      .view-review-modal .info-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 10px;
        font-size: 0.95rem;
      }
      .view-review-modal .info-label {
        font-weight: 500;
        color: var(--text-dark);
        width: 150px;
        flex-shrink: 0;
      }
      .view-review-modal .info-value {
        color: #555;
        font-size: 0.95rem;
      }
      .view-review-modal ul {
        list-style-type: none;
        padding-left: 20px;
        margin: 0 0 10px;
      }
      .view-review-modal ul li {
        position: relative;
        margin-bottom: 5px;
        font-size: 0.95rem;
      }
      .view-review-modal ul li:before {
        content: '•';
        position: absolute;
        left: -15px;
        color: var(--accent-color);
        font-size: 1.2rem;
      }
      .view-review-modal .progress {
        height: 10px;
        border-radius: 5px;
        margin-bottom: 10px;
      }
      .view-review-modal .progress-bar {
        background-color: var(--primary-color);
      }
      .edit-review-modal .modal-dialog {
        max-width: 600px;
      }
      .edit-review-modal .form-group {
        margin-bottom: 15px;
      }
      .edit-review-modal label {
        font-size: 0.9rem;
        font-weight: 500;
        color: var(--text-dark);
        margin-bottom: 8px;
        display: block;
      }
      .edit-review-modal input,
      .edit-review-modal select,
      .edit-review-modal textarea {
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #d1d9e6;
        border-radius: 8px;
        font-size: 0.95rem;
        background: #ffffff;
        color: var(--text-dark);
        transition: border-color 0.3s, box-shadow 0.3s;
      }
      .edit-review-modal textarea {
        resize: vertical;
        min-height: 100px;
      }
      .edit-review-modal select {
        appearance: none;
        background-image: url("data:image/svg+xml;utf8,<svg fill='black' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
        background-repeat: no-repeat;
        background-position-x: calc(100% - 10px);
        background-position-y: center;
        padding-right: 30px;
      }
      .edit-review-modal input:focus,
      .edit-review-modal select:focus,
      .edit-review-modal textarea:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 8px rgba(74, 144, 226, 0.4);
        outline: none;
      }
      .delete-review-modal .modal-dialog {
        max-width: 500px;
      }
      .delete-review-modal .modal-header {
        background: linear-gradient(90deg, #e74c3c, #c0392b);
      }
      .delete-review-modal .modal-body {
        padding: 30px;
        background: #f8fafc;
      }
      .delete-review-modal .warning-section {
        background: #ffffff;
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
      }
      .delete-review-modal .warning-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: #e74c3c;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }
      .delete-review-modal .warning-title i {
        color: #e74c3c;
      }
      .delete-review-modal .info-item {
        font-size: 0.95rem;
        margin-bottom: 10px;
      }
      .delete-review-modal .info-item span {
        font-weight: 600;
        color: var(--text-dark);
      }
      .delete-review-modal .warning-text {
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
        <%@ include file="sidebar.jsp" %><
        <div class="main-content">
          <div class="content-wrapper">
            <!-- Include Header -->
            <%@ include file="header.jsp" %>
            <!-- Filter Section -->
            <div class="filter-section">
              <div class="filter-row">
                <label for="reviewerFilter">Người Đánh Giá:</label>
                <select class="form-select" id="reviewerFilter">
                  <option value="">Tất cả</option>
                  <option value="Nguyễn Văn A">Nguyễn Văn A</option>
                  <option value="Lê Văn C">Lê Văn C</option>
                  <option value="Hoàng Văn E">Hoàng Văn E</option>
                </select>
                <label for="instructorFilter">Giảng Viên:</label>
                <select class="form-select" id="instructorFilter">
                  <option value="">Tất cả</option>
                  <option value="Trần Thị B">Trần Thị B</option>
                  <option value="Phạm Văn D">Phạm Văn D</option>
                  <option value="Nguyễn Thị F">Nguyễn Thị F</option>
                </select>
                <label for="courseFilter">Khóa Học:</label>
                <select class="form-select" id="courseFilter">
                  <option value="">Tất cả</option>
                  <option value="Tiếng Nhật Sơ Cấp N5">Tiếng Nhật Sơ Cấp N5</option>
                  <option value="Tiếng Nhật Trung Cấp N3">Tiếng Nhật Trung Cấp N3</option>
                  <option value="Tiếng Nhật Cao Cấp N1">Tiếng Nhật Cao Cấp N1</option>
                  <option value="Kanji Sơ Cấp">Kanji Sơ Cấp</option>
                  <option value="Luyện Thi JLPT N4">Luyện Thi JLPT N4</option>
                  <option value="Hội Thoại Tiếng Nhật">Hội Thoại Tiếng Nhật</option>
                  <option value="Tiếng Nhật Doanh Nghiệp">Tiếng Nhật Doanh Nghiệp</option>
                  <option value="Ngữ Pháp N3">Ngữ Pháp N3</option>
                  <option value="Kanji Cao Cấp">Kanji Cao Cấp</option>
                  <option value="Luyện Thi JLPT N2">Luyện Thi JLPT N2</option>
                </select>
                <label for="ratingFilter">Điểm Đánh Giá:</label>
                <select class="form-select" id="ratingFilter">
                  <option value="">Tất cả</option>
                  <option value="5">5 Sao</option>
                  <option value="4">4 Sao</option>
                  <option value="3">3 Sao</option>
                  <option value="2">2 Sao</option>
                  <option value="1">1 Sao</option>
                </select>
                <label for="reviewDateFilter">Ngày Đánh Giá:</label>
                <input type="date" class="form-control" id="reviewDateFilter" />
              </div>
              <div class="search-row">
                <label for="search">Tìm Kiếm:</label>
                <input type="text" class="form-control" id="search" placeholder="Tìm theo ID hoặc người đánh giá..." />
              </div>
            </div>
            <!-- Reviews Table -->
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>AVATAR</th>
                    <th>NGƯỜI ĐÁNH GIÁ</th>
                    <th>GIẢNG VIÊN</th>
                    <th>KHÓA HỌC</th>
                    <th>ĐIỂM ĐÁNH GIÁ</th>
                    <th>NGÀY ĐÁNH GIÁ</th>
                    <th>HÀNH ĐỘNG</th>
                  </tr>
                </thead>
                <tbody id="reviewTableBody">
                  <tr data-review-id="REV001">
                    <td>REV001</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Trần Thị B</td>
                    <td>Tiếng Nhật Sơ Cấp N5</td>
                    <td><span class="rating-stars">★★★★★</span> (5)</td>
                    <td>2025-05-01</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV001"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV001"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV001" data-reviewer="Nguyễn Văn A"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV002">
                    <td>REV002</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>Phạm Văn D</td>
                    <td>Tiếng Nhật Trung Cấp N3</td>
                    <td><span class="rating-stars">★★★★☆</span> (4)</td>
                    <td>2025-05-02</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV002"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV002"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV002" data-reviewer="Lê Văn C"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV003">
                    <td>REV003</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>Nguyễn Thị F</td>
                    <td>Tiếng Nhật Cao Cấp N1</td>
                    <td><span class="rating-stars">★★★☆☆</span> (3)</td>
                    <td>2025-05-03</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV003"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV003"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV003" data-reviewer="Hoàng Văn E"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV004">
                    <td>REV004</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Trần Thị B</td>
                    <td>Kanji Sơ Cấp</td>
                    <td><span class="rating-stars">★★★★★</span> (5)</td>
                    <td>2025-05-04</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV004"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV004"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV004" data-reviewer="Nguyễn Văn A"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV005">
                    <td>REV005</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>Phạm Văn D</td>
                    <td>Luyện Thi JLPT N4</td>
                    <td><span class="rating-stars">★★★★☆</span> (4)</td>
                    <td>2025-05-05</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV005"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV005"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV005" data-reviewer="Lê Văn C"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV006">
                    <td>REV006</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>Nguyễn Thị F</td>
                    <td>Hội Thoại Tiếng Nhật</td>
                    <td><span class="rating-stars">★★★☆☆</span> (3)</td>
                    <td>2025-05-06</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV006"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV006"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV006" data-reviewer="Hoàng Văn E"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV007">
                    <td>REV007</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Trần Thị B</td>
                    <td>Tiếng Nhật Doanh Nghiệp</td>
                    <td><span class="rating-stars">★★★★★</span> (5)</td>
                    <td>2025-05-07</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV007"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV007"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV007" data-reviewer="Nguyễn Văn A"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV008">
                    <td>REV008</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>Phạm Văn D</td>
                    <td>Ngữ Pháp N3</td>
                    <td><span class="rating-stars">★★☆☆☆</span> (2)</td>
                    <td>2025-05-08</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV008"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV008"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV008" data-reviewer="Lê Văn C"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV009">
                    <td>REV009</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>Nguyễn Thị F</td>
                    <td>Kanji Cao Cấp</td>
                    <td><span class="rating-stars">★★★★☆</span> (4)</td>
                    <td>2025-05-09</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV009"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV009"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV009" data-reviewer="Hoàng Văn E"><i class="fas fa-trash"></i></button>
                    </td>
                  </tr>
                  <tr data-review-id="REV010">
                    <td>REV010</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Trần Thị B</td>
                    <td>Luyện Thi JLPT N2</td>
                    <td><span class="rating-stars">★★★★★</span> (5)</td>
                    <td>2025-05-10</td>
                    <td>
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewReviewModal" data-review-id="REV010"><i class="fas fa-eye"></i></button>
                      <button class="btn btn-edit btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#editReviewModal" data-review-id="REV010"><i class="fas fa-edit"></i></button>
                      <button class="btn btn-delete btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#deleteReviewModal" data-review-id="REV010" data-reviewer="Nguyễn Văn A"><i class="fas fa-trash"></i></button>
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
            <!-- View Review Modal -->
            <div class="modal fade view-review-modal" id="viewReviewModal" tabindex="-1" aria-labelledby="viewReviewModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-lg">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="viewReviewModalLabel"><i class="fas fa-star"></i> Chi Tiết Đánh Giá</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-info-circle"></i> Thông Tin Đánh Giá</h6>
                      <div class="reviewer-info">
                        <img id="modalReviewerAvatar" src="img/dashborad/defaultAvatar.png" alt="Reviewer Avatar" class="reviewer-avatar" />
                        <div>
                          <div class="info-item">
                            <span class="info-label">ID:</span>
                            <span class="info-value" id="modalReviewId"></span>
                          </div>
                          <div class="info-item">
                            <span class="info-label">Người Đánh Giá:</span>
                            <span class="info-value" id="modalReviewer"></span>
                          </div>
                        </div>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Giảng Viên:</span>
                        <span class="info-value" id="modalInstructor"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Khóa Học:</span>
                        <span class="info-value" id="modalCourse"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Điểm Đánh Giá:</span>
                        <span class="info-value" id="modalRating"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Ngày Đánh Giá:</span>
                        <span class="info-value" id="modalReviewDate"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-comment"></i> Lời Nhận Xét</h6>
                      <div class="info-item">
                        <span class="info-label">Ưu Điểm:</span>
                        <ul id="modalPros"></ul>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Nhược Điểm:</span>
                        <ul id="modalCons"></ul>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Gợi Ý Cải Thiện:</span>
                        <ul id="modalSuggestions"></ul>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Phản Hồi từ Giảng Viên:</span>
                        <span class="info-value" id="modalInstructorResponse"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-chart-bar"></i> Ý Nghĩa Đánh Giá</h6>
                      <p id="modalSignificance"></p>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-graduation-cap"></i> Thông Tin Bổ Sung</h6>
                      <div class="info-item">
                        <span class="info-label">Thời Gian Hoàn Thành Khóa Học:</span>
                        <span class="info-value" id="modalCompletionDate"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Thời Lượng Khóa Học:</span>
                        <span class="info-value" id="modalCourseDuration"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Tiến Độ Hoàn Thành:</span>
                        <div class="progress">
                          <div id="modalProgressBar" class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-user-graduate"></i> Chi Tiết Học Viên</h6>
                      <div class="info-item">
                        <span class="info-label">Ngày Tham Gia Nền Tảng:</span>
                        <span class="info-value" id="modalEnrollmentDate"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Tổng Số Khóa Học Đã Tham Gia:</span>
                        <span class="info-value" id="modalTotalCourses"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-chalkboard-teacher"></i> Chi Tiết Giảng Viên</h6>
                      <div class="info-item">
                        <span class="info-label">Tổng Số Khóa Học Đã Giảng Dạy:</span>
                        <span class="info-value" id="modalCoursesTaught"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Đánh Giá Trung Bình:</span>
                        <span class="info-value" id="modalOverallRating"></span>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Đóng</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- Edit Review Modal -->
            <div class="modal fade edit-review-modal" id="editReviewModal" tabindex="-1" aria-labelledby="editReviewModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="editReviewModalLabel"><i class="fas fa-edit"></i> Chỉnh Sửa Đánh Giá</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="/EditReviewServlet" method="POST">
                    <div class="modal-body">
                      <input type="hidden" id="editReviewId" name="reviewId" />
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-info-circle"></i> Thông Tin Đánh Giá</h6>
                        <div class="form-group">
                          <label for="editReviewer">Người Đánh Giá <span class="text-danger">*</span></label>
                          <select class="form-select" id="editReviewer" name="reviewer" required>
                            <option value="" disabled>Chọn người đánh giá</option>
                            <option value="Nguyễn Văn A">Nguyễn Văn A</option>
                            <option value="Lê Văn C">Lê Văn C</option>
                            <option value="Hoàng Văn E">Hoàng Văn E</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editInstructor">Giảng Viên <span class="text-danger">*</span></label>
                          <select class="form-select" id="editInstructor" name="instructor" required>
                            <option value="" disabled>Chọn giảng viên</option>
                            <option value="Trần Thị B">Trần Thị B</option>
                            <option value="Phạm Văn D">Phạm Văn D</option>
                            <option value="Nguyễn Thị F">Nguyễn Thị F</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editCourse">Khóa Học <span class="text-danger">*</span></label>
                          <select class="form-select" id="editCourse" name="course" required>
                            <option value="" disabled>Chọn khóa học</option>
                            <option value="Tiếng Nhật Sơ Cấp N5">Tiếng Nhật Sơ Cấp N5</option>
                            <option value="Tiếng Nhật Trung Cấp N3">Tiếng Nhật Trung Cấp N3</option>
                            <option value="Tiếng Nhật Cao Cấp N1">Tiếng Nhật Cao Cấp N1</option>
                            <option value="Kanji Sơ Cấp">Kanji Sơ Cấp</option>
                            <option value="Luyện Thi JLPT N4">Luyện Thi JLPT N4</option>
                            <option value="Hội Thoại Tiếng Nhật">Hội Thoại Tiếng Nhật</option>
                            <option value="Tiếng Nhật Doanh Nghiệp">Tiếng Nhật Doanh Nghiệp</option>
                            <option value="Ngữ Pháp N3">Ngữ Pháp N3</option>
                            <option value="Kanji Cao Cấp">Kanji Cao Cấp</option>
                            <option value="Luyện Thi JLPT N2">Luyện Thi JLPT N2</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editRating">Điểm Đánh Giá <span class="text-danger">*</span></label>
                          <select class="form-select" id="editRating" name="rating" required>
                            <option value="" disabled>Chọn điểm</option>
                            <option value="5">5 Sao</option>
                            <option value="4">4 Sao</option>
                            <option value="3">3 Sao</option>
                            <option value="2">2 Sao</option>
                            <option value="1">1 Sao</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="editReviewDate">Ngày Đánh Giá <span class="text-danger">*</span></label>
                          <input type="date" class="form-control" id="editReviewDate" name="reviewDate" required />
                        </div>
                      </div>
                      <div class="section">
                        <h6 class="section-title"><i class="fas fa-comment"></i> Lời Nhận Xét</h6>
                        <div class="form-group">
                          <label for="editPros">Ưu Điểm</label>
                          <textarea class="form-control" id="editPros" name="pros" placeholder="Nhập ưu điểm, mỗi dòng một ý"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="editCons">Nhược Điểm</label>
                          <textarea class="form-control" id="editCons" name="cons" placeholder="Nhập nhược điểm, mỗi dòng một ý"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="editSuggestions">Gợi Ý Cải Thiện</label>
                          <textarea class="form-control" id="editSuggestions" name="suggestions" placeholder="Nhập gợi ý, mỗi dòng một ý"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="editInstructorResponse">Phản Hồi từ Giảng Viên</label>
                          <textarea class="form-control" id="editInstructorResponse" name="instructorResponse" placeholder="Nhập phản hồi từ giảng viên"></textarea>
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
            <!-- Delete Review Modal -->
            <div class="modal fade delete-review-modal" id="deleteReviewModal" tabindex="-1" aria-labelledby="deleteReviewModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="deleteReviewModalLabel"><i class="fas fa-trash-alt"></i> Xác Nhận Xóa Đánh Giá</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="warning-section">
                      <h6 class="warning-title"><i class="fas fa-exclamation-triangle"></i> Cảnh Báo</h6>
                      <div class="info-item">
                        Bạn có chắc chắn muốn xóa đánh giá <span id="deleteReviewId"></span> của <span id="deleteReviewer"></span>?
                      </div>
                      <div class="warning-text">
                        Hành động này không thể hoàn tác. Vui lòng xác nhận.
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Hủy</button>
                    <form action="/DeleteReviewServlet" method="POST">
                      <input type="hidden" id="deleteReviewIdInput" name="reviewId" />
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
      // Mock review details data
      const reviewDetails = {
        REV001: {
          pros: ["Giảng viên nhiệt tình", "Tài liệu chi tiết", "Hỗ trợ ngoài giờ học"],
          cons: [],
          suggestions: ["Thêm bài tập thực hành"],
          completionDate: "2025-04-28",
          courseDuration: "3 tháng",
          progressPercentage: 100,
          instructorResponse: "Cảm ơn bạn đã đánh giá cao! Tôi sẽ bổ sung thêm bài tập trong các khóa sau.",
          enrollmentDate: "2024-12-01",
          totalCourses: 3,
          coursesTaught: 5,
          overallRating: 4.8,
          instructorAverageRating: 4.8,
          totalReviews: 10,
          ratingTrend: "tăng từ 4.7",
          reviewWeight: "1/10"
        },
        REV002: {
          pros: ["Phương pháp giảng dạy sáng tạo", "Tương tác tốt với học viên"],
          cons: ["Bài tập còn ít"],
          suggestions: ["Cung cấp thêm tài liệu thực hành"],
          completionDate: "2025-04-29",
          courseDuration: "4 tháng",
          progressPercentage: 95,
          instructorResponse: "Cảm ơn góp ý, tôi sẽ tăng cường bài tập trong tương lai!",
          enrollmentDate: "2024-11-15",
          totalCourses: 2,
          coursesTaught: 4,
          overallRating: 4.2,
          instructorAverageRating: 4.2,
          totalReviews: 8,
          ratingTrend: "ổn định",
          reviewWeight: "1/8"
        },
        REV003: {
          pros: ["Kiến thức chuyên môn tốt"],
          cons: ["Tốc độ giảng bài nhanh", "Ít thời gian thực hành"],
          suggestions: ["Giảm tốc độ giảng dạy", "Tăng bài tập thực hành"],
          completionDate: "2025-04-30",
          courseDuration: "5 tháng",
          progressPercentage: 90,
          instructorResponse: "",
          enrollmentDate: "2024-10-01",
          totalCourses: 4,
          coursesTaught: 6,
          overallRating: 3.9,
          instructorAverageRating: 3.9,
          totalReviews: 12,
          ratingTrend: "giảm từ 4.0",
          reviewWeight: "1/12"
        },
        REV004: {
          pros: ["Ví dụ thực tế phong phú", "Giảng viên tận tâm"],
          cons: [],
          suggestions: ["Thêm video minh họa"],
          completionDate: "2025-05-01",
          courseDuration: "2 tháng",
          progressPercentage: 100,
          instructorResponse: "Cảm ơn bạn! Tôi sẽ xem xét thêm video minh họa.",
          enrollmentDate: "2024-12-01",
          totalCourses: 3,
          coursesTaught: 5,
          overallRating: 4.8,
          instructorAverageRating: 4.8,
          totalReviews: 10,
          ratingTrend: "tăng từ 4.7",
          reviewWeight: "1/10"
        },
        REV005: {
          pros: ["Giảng viên thân thiện", "Nội dung dễ hiểu"],
          cons: ["Lịch học kém linh hoạt"],
          suggestions: ["Tăng tính linh hoạt lịch học"],
          completionDate: "2025-05-02",
          courseDuration: "3 tháng",
          progressPercentage: 98,
          instructorResponse: "Cảm ơn góp ý, tôi sẽ đề xuất điều chỉnh lịch học.",
          enrollmentDate: "2024-11-15",
          totalCourses: 2,
          coursesTaught: 4,
          overallRating: 4.2,
          instructorAverageRating: 4.2,
          totalReviews: 8,
          ratingTrend: "ổn định",
          reviewWeight: "1/8"
        },
        REV006: {
          pros: ["Nội dung bài học phù hợp"],
          cons: ["Thiếu tài liệu bổ sung"],
          suggestions: ["Cung cấp thêm tài liệu tham khảo"],
          completionDate: "2025-05-03",
          courseDuration: "2.5 tháng",
          progressPercentage: 92,
          instructorResponse: "",
          enrollmentDate: "2024-10-01",
          totalCourses: 4,
          coursesTaught: 6,
          overallRating: 3.9,
          instructorAverageRating: 3.9,
          totalReviews: 12,
          ratingTrend: "giảm từ 4.0",
          reviewWeight: "1/12"
        },
        REV007: {
          pros: ["Giảng viên chuyên nghiệp", "Hỗ trợ tận tình"],
          cons: [],
          suggestions: ["Thêm bài kiểm tra định kỳ"],
          completionDate: "2025-05-04",
          courseDuration: "4 tháng",
          progressPercentage: 100,
          instructorResponse: "Cảm ơn bạn! Tôi sẽ cân nhắc thêm bài kiểm tra.",
          enrollmentDate: "2024-12-01",
          totalCourses: 3,
          coursesTaught: 5,
          overallRating: 4.8,
          instructorAverageRating: 4.8,
          totalReviews: 10,
          ratingTrend: "tăng từ 4.7",
          reviewWeight: "1/10"
        },
        REV008: {
          pros: [],
          cons: ["Cách truyền đạt khó hiểu", "Nội dung chưa hấp dẫn"],
          suggestions: ["Cải thiện cách giảng dạy", "Thêm ví dụ thực tế"],
          completionDate: "2025-05-05",
          courseDuration: "3 tháng",
          progressPercentage: 85,
          instructorResponse: "",
          enrollmentDate: "2024-11-15",
          totalCourses: 2,
          coursesTaught: 4,
          overallRating: 4.2,
          instructorAverageRating: 4.2,
          totalReviews: 8,
          ratingTrend: "ổn định",
          reviewWeight: "1/8"
        },
        REV009: {
          pros: ["Kiến thức sâu rộng", "Giảng viên nhiệt tình"],
          cons: ["Bài giảng thiếu logic"],
          suggestions: ["Tổ chức bài giảng rõ ràng hơn"],
          completionDate: "2025-05-06",
          courseDuration: "3.5 tháng",
          progressPercentage: 95,
          instructorResponse: "Cảm ơn góp ý, tôi sẽ cải thiện cấu trúc bài giảng.",
          enrollmentDate: "2024-10-01",
          totalCourses: 4,
          coursesTaught: 6,
          overallRating: 3.9,
          instructorAverageRating: 3.9,
          totalReviews: 12,
          ratingTrend: "giảm từ 4.0",
          reviewWeight: "1/12"
        },
        REV010: {
          pros: ["Giảng viên tận tâm", "Nội dung thực tế"],
          cons: [],
          suggestions: ["Thêm bài tập nhóm"],
          completionDate: "2025-05-07",
          courseDuration: "4 tháng",
          progressPercentage: 100,
          instructorResponse: "Cảm ơn bạn! Tôi sẽ xem xét thêm bài tập nhóm.",
          enrollmentDate: "2024-12-01",
          totalCourses: 3,
          coursesTaught: 5,
          overallRating: 4.8,
          instructorAverageRating: 4.8,
          totalReviews: 10,
          ratingTrend: "tăng từ 4.7",
          reviewWeight: "1/10"
        }
      };

      // Function to generate star rating
      function generateStars(rating) {
        const fullStar = '★';
        const emptyStar = '☆';
        return fullStar.repeat(rating) + emptyStar.repeat(5 - rating);
      }

      // Function to show review details in view modal
      function showReviewDetails(reviewId) {
        const row = document.querySelector(`tr[data-review-id="${reviewId}"]`);
        const details = reviewDetails[reviewId];

        // Thông Tin Đánh Giá
        document.getElementById('modalReviewId').textContent = row.cells[0].textContent;
        document.getElementById('modalReviewer').textContent = row.cells[2].textContent;
        document.getElementById('modalReviewerAvatar').src = "img/dashborad/defaultAvatar.png";
        document.getElementById('modalInstructor').textContent = row.cells[3].textContent;
        document.getElementById('modalCourse').textContent = row.cells[4].textContent;
        document.getElementById('modalRating').innerHTML = row.cells[5].innerHTML;
        document.getElementById('modalReviewDate').textContent = row.cells[6].textContent;

        // Lời Nhận Xét
        const prosList = document.getElementById('modalPros');
        const consList = document.getElementById('modalCons');
        const suggestionsList = document.getElementById('modalSuggestions');
        prosList.innerHTML = details.pros.length ? details.pros.map(item => `<li>${item}</li>`).join('') : '<li>Không có</li>';
        consList.innerHTML = details.cons.length ? details.cons.map(item => `<li>${item}</li>`).join('') : '<li>Không có</li>';
        suggestionsList.innerHTML = details.suggestions.length ? details.suggestions.map(item => `<li>${item}</li>`).join('') : '<li>Không có</li>';
        document.getElementById('modalInstructorResponse').textContent = details.instructorResponse || "Không có phản hồi";

        // Ý Nghĩa Đánh Giá
        const ratingMatch = row.cells[5].textContent.match(/\((\d)\)/);
        const ratingValue = ratingMatch ? parseInt(ratingMatch[1]) : 0;
        let impactMessage;
        if (ratingValue >= 4) {
          impactMessage = "Đánh giá cao này nâng cao uy tín của giảng viên, giúp thu hút thêm học viên trên nền tảng HIKARI.";
        } else if (ratingValue === 3) {
          impactMessage = "Đánh giá trung bình này cho thấy giảng viên cần cải thiện để đáp ứng tốt hơn kỳ vọng của học viên.";
        } else {
          impactMessage = "Đánh giá thấp này có thể ảnh hưởng đến uy tín của giảng viên, cần xem xét cải thiện chất lượng giảng dạy.";
        }
        document.getElementById('modalSignificance').innerHTML = `
          Điểm <strong>${ratingValue}/5</strong> từ đánh giá này (${details.reviewWeight} đánh giá) góp phần vào đánh giá trung bình của giảng viên là <strong>${details.instructorAverageRating}/5</strong> (dựa trên ${details.totalReviews} đánh giá). 
          Đánh giá trung bình ${details.ratingTrend}.<br/>
          ${impactMessage}
        `;

        // Thông Tin Bổ Sung
        document.getElementById('modalCompletionDate').textContent = details.completionDate;
        document.getElementById('modalCourseDuration').textContent = details.courseDuration;
        const progressBar = document.getElementById('modalProgressBar');
        progressBar.style.width = `${details.progressPercentage}%`;
        progressBar.setAttribute('aria-valuenow', details.progressPercentage);
        progressBar.textContent = `${details.progressPercentage}%`;

        // Chi Tiết Học Viên
        document.getElementById('modalEnrollmentDate').textContent = details.enrollmentDate;
        document.getElementById('modalTotalCourses').textContent = details.totalCourses;

        // Chi Tiết Giảng Viên
        document.getElementById('modalCoursesTaught').textContent = details.coursesTaught;
        document.getElementById('modalOverallRating').textContent = `${details.overallRating}/5`;
      }

      // Function to populate edit review modal
      function populateEditReviewModal(reviewId) {
        const row = document.querySelector(`tr[data-review-id="${reviewId}"]`);
        const details = reviewDetails[reviewId];

        document.getElementById('editReviewId').value = row.cells[0].textContent;
        document.getElementById('editReviewer').value = row.cells[2].textContent;
        document.getElementById('editInstructor').value = row.cells[3].textContent;
        document.getElementById('editCourse').value = row.cells[4].textContent;
        const ratingMatch = row.cells[5].textContent.match(/\((\d)\)/);
        document.getElementById('editRating').value = ratingMatch ? ratingMatch[1] : '';
        document.getElementById('editReviewDate').value = row.cells[6].textContent;
        document.getElementById('editPros').value = details.pros.join('\n');
        document.getElementById('editCons').value = details.cons.join('\n');
        document.getElementById('editSuggestions').value = details.suggestions.join('\n');
        document.getElementById('editInstructorResponse').value = details.instructorResponse;
      }

      // Function to populate delete review modal
      function populateDeleteReviewModal(reviewId, reviewer) {
        document.getElementById('deleteReviewId').textContent = reviewId;
        document.getElementById('deleteReviewer').textContent = reviewer;
        document.getElementById('deleteReviewIdInput').value = reviewId;
      }

      // Add event listeners to buttons
      document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', () => {
          const reviewId = button.getAttribute('data-review-id');
          showReviewDetails(reviewId);
        });
      });

      document.querySelectorAll('.btn-edit').forEach(button => {
        button.addEventListener('click', () => {
          const reviewId = button.getAttribute('data-review-id');
          populateEditReviewModal(reviewId);
        });
      });

      document.querySelectorAll('.btn-delete').forEach(button => {
        button.addEventListener('click', () => {
          const reviewId = button.getAttribute('data-review-id');
          const reviewer = button.getAttribute('data-reviewer');
          populateDeleteReviewModal(reviewId, reviewer);
        });
      });

      // Pagination and filtering logic
      const rowsPerPage = 10;
      let currentPage = 1;
      let filteredRows = [];

      // Get all rows
      const allRows = Array.from(document.querySelectorAll('#reviewTableBody tr'));

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
      document.querySelectorAll('#reviewerFilter, #instructorFilter, #courseFilter, #ratingFilter, #reviewDateFilter, #search').forEach(filter => {
        filter.addEventListener('change', applyFilters);
        filter.addEventListener('input', applyFilters);
      });

      function applyFilters() {
        const reviewer = document.getElementById('reviewerFilter').value.toLowerCase();
        const instructor = document.getElementById('instructorFilter').value.toLowerCase();
        const course = document.getElementById('courseFilter').value.toLowerCase();
        const rating = document.getElementById('ratingFilter').value;
        const reviewDate = document.getElementById('reviewDateFilter').value;
        const search = document.getElementById('search').value.toLowerCase();

        filteredRows = allRows.filter(row => {
          const reviewerText = row.cells[2].textContent.toLowerCase();
          const instructorText = row.cells[3].textContent.toLowerCase();
          const courseText = row.cells[4].textContent.toLowerCase();
          const ratingText = row.cells[5].textContent.match(/\d/) ? row.cells[5].textContent.match(/\d/)[0] : '';
          const reviewDateText = row.cells[6].textContent;
          const idText = row.cells[0].textContent.toLowerCase();

          const matchesReviewer = reviewer === '' || reviewerText.includes(reviewer);
          const matchesInstructor = instructor === '' || instructorText.includes(instructor);
          const matchesCourse = course === '' || courseText.includes(course);
          const matchesRating = rating === '' || ratingText === rating;
          const matchesDate = !reviewDate || reviewDateText === reviewDate;
          const matchesSearch = !search || idText.includes(search) || reviewerText.includes(search);

          return matchesReviewer && matchesInstructor && matchesCourse && matchesRating && matchesDate && matchesSearch;
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

      // Initial pagination setup
      updatePagination();
    </script>
  </body>
</html>