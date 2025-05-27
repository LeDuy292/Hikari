<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản Lý Thanh Toán - HIKARI</title>
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

      .filter-section input[type="number"] {
        width: 100px;
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

      .table td.actions {
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .btn-action { margin-right: 5px; }
      .badge-success { background-color: #2ecc71; color: white; padding: 5px 10px; border-radius: 12px; }
      .badge-failed { background-color: #e74c3c; color: white; padding: 5px 10px; border-radius: 12px; }
      .badge-pending { background-color: #f39c12; color: white; padding: 5px 10px; border-radius: 12px; }
      tbody .btn-view { 
        background-color: #4a90e2; 
        border: none; 
        padding: 5px 10px; 
        border-radius: 5px; 
        display: inline-flex; 
        align-items: center; 
        justify-content: center; 
      }
      
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

      .view-payment-modal .modal-dialog {
        max-width: 600px;
      }

      .view-payment-modal .section {
        margin-bottom: 20px;
        padding: 15px;
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s;
      }

      .view-payment-modal .section:hover {
        transform: translateY(-2px);
      }

      .view-payment-modal .section-title {
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--secondary-color);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
      }

      .view-payment-modal .section-title i {
        color: var(--primary-color);
      }

      .view-payment-modal .info-item {
        display: flex;
        align-items: flex-start;
        margin-bottom: 10px;
        font-size: 0.95rem;
      }

      .view-payment-modal .info-label {
        font-weight: 500;
        color: var(--text-dark);
        width: 150px;
        flex-shrink: 0;
      }

      .view-payment-modal .info-value {
        color: #555;
        font-size: 0.95rem;
      }

      .view-payment-modal .badge {
        font-size: 0.85rem;
        padding: 5px 10px;
      }

      .view-payment-modal .btn-cancel {
        background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
        color: var(--text-color);
        border: none;
        padding: 10px 20px;
        font-weight: 600;
      }

      .view-payment-modal .btn-cancel:hover {
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
              <div class="filter-row">
                <label for="payerFilter">Người Thanh Toán:</label>
                <select class="form-select" id="payerFilter">
                  <option value="">Tất cả</option>
                  <option value="Nguyễn Văn A">Nguyễn Văn A</option>
                  <option value="Lê Văn C">Lê Văn C</option>
                  <option value="Hoàng Văn E">Hoàng Văn E</option>
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
                <label for="statusFilter">Trạng Thái:</label>
                <select class="form-select" id="statusFilter">
                  <option value="">Tất cả</option>
                  <option value="Thành Công">Thành Công</option>
                  <option value="Thất Bại">Thất Bại</option>
                  <option value="Đang Chờ">Đang Chờ</option>
                </select>
                <label for="paymentDateFilter">Ngày Thanh Toán:</label>
                <input type="date" class="form-control" id="paymentDateFilter" />
                <label for="minAmountFilter">Khoảng Tiền (VND):</label>
                <input type="number" class="form-control" id="minAmountFilter" placeholder="Tối thiểu" min="0" />
                <input type="number" class="form-control" id="maxAmountFilter" placeholder="Tối đa" min="0" />
              </div>
              <div class="search-row">
                <label for="search">Tìm Kiếm:</label>
                <input type="text" class="form-control" id="search" placeholder="Tìm theo ID hoặc người thanh toán..." />
              </div>
            </div>
            <!-- Payments Table -->
            <div class="table-responsive">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>AVATAR</th>
                    <th>NGƯỜI THANH TOÁN</th>
                    <th>KHÓA HỌC</th>
                    <th>SỐ TIỀN</th>
                    <th>TRẠNG THÁI</th>
                    <th>NGÀY THANH TOÁN</th>
                    <th>HÀNH ĐỘNG</th>
                  </tr>
                </thead>
                <tbody id="paymentTableBody">
                  <tr>
                    <td>PAY001</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Tiếng Nhật Sơ Cấp N5</td>
                    <td>1,500,000</td>
                    <td><span class="badge badge-success">Thành Công</span></td>
                    <td>2025-05-01</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY001" data-payer="Nguyễn Văn A" data-course="Tiếng Nhật Sơ Cấp N5" 
                              data-amount="1500000" data-status="Thành Công" data-payment-date="2025-05-01" 
                              data-payment-method="Credit Card"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY002</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>Tiếng Nhật Trung Cấp N3</td>
                    <td>2,000,000</td>
                    <td><span class="badge badge-success">Thành Công</span></td>
                    <td>2025-05-02</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY002" data-payer="Lê Văn C" data-course="Tiếng Nhật Trung Cấp N3" 
                              data-amount="2000000" data-status="Thành Công" data-payment-date="2025-05-02" 
                              data-payment-method="Bank Transfer"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY003</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>Tiếng Nhật Cao Cấp N1</td>
                    <td>2,500,000</td>
                    <td><span class="badge badge-failed">Thất Bại</span></td>
                    <td>2025-05-03</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY003" data-payer="Hoàng Văn E" data-course="Tiếng Nhật Cao Cấp N1" 
                              data-amount="2500000" data-status="Thất Bại" data-payment-date="2025-05-03" 
                              data-payment-method="Credit Card"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY004</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Kanji Sơ Cấp</td>
                    <td>1,200,000</td>
                    <td><span class="badge badge-success">Thành Công</span></td>
                    <td>2025-05-04</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY004" data-payer="Nguyễn Văn A" data-course="Kanji Sơ Cấp" 
                              data-amount="1200000" data-status="Thành Công" data-payment-date="2025-05-04" 
                              data-payment-method="Bank Transfer"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY005</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>Luyện Thi JLPT N4</td>
                    <td>1,800,000</td>
                    <td><span class="badge badge-pending">Đang Chờ</span></td>
                    <td>2025-05-05</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY005" data-payer="Lê Văn C" data-course="Luyện Thi JLPT N4" 
                              data-amount="1800000" data-status="Đang Chờ" data-payment-date="2025-05-05" 
                              data-payment-method="Credit Card"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY006</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>Hội Thoại Tiếng Nhật</td>
                    <td>1,600,000</td>
                    <td><span class="badge badge-success">Thành Công</span></td>
                    <td>2025-05-06</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY006" data-payer="Hoàng Văn E" data-course="Hội Thoại Tiếng Nhật" 
                              data-amount="1600000" data-status="Thành Công" data-payment-date="2025-05-06" 
                              data-payment-method="Bank Transfer"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY007</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Tiếng Nhật Doanh Nghiệp</td>
                    <td>2,200,000</td>
                    <td><span class="badge badge-success">Thành Công</span></td>
                    <td>2025-05-07</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY007" data-payer="Nguyễn Văn A" data-course="Tiếng Nhật Doanh Nghiệp" 
                              data-amount="2200000" data-status="Thành Công" data-payment-date="2025-05-07" 
                              data-payment-method="Credit Card"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY008</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Lê Văn C</td>
                    <td>Ngữ Pháp N3</td>
                    <td>1,900,000</td>
                    <td><span class="badge badge-failed">Thất Bại</span></td>
                    <td>2025-05-08</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY008" data-payer="Lê Văn C" data-course="Ngữ Pháp N3" 
                              data-amount="1900000" data-status="Thất Bại" data-payment-date="2025-05-08" 
                              data-payment-method="Bank Transfer"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY009</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Hoàng Văn E</td>
                    <td>Kanji Cao Cấp</td>
                    <td>2,300,000</td>
                    <td><span class="badge badge-success">Thành Công</span></td>
                    <td>2025-05-09</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY009" data-payer="Hoàng Văn E" data-course="Kanji Cao Cấp" 
                              data-amount="2300000" data-status="Thành Công" data-payment-date="2025-05-09" 
                              data-payment-method="Credit Card"><i class="fas fa-eye"></i></button>
                    </td>
                  </tr>
                  <tr>
                    <td>PAY010</td>
                    <td><img src="img/dashborad/defaultAvatar.png" alt="Avatar" class="table-avatar" /></td>
                    <td>Nguyễn Văn A</td>
                    <td>Luyện Thi JLPT N2</td>
                    <td>2,400,000</td>
                    <td><span class="badge badge-pending">Đang Chờ</span></td>
                    <td>2025-05-10</td>
                    <td class="actions">
                      <button class="btn btn-view btn-sm btn-action" data-bs-toggle="modal" data-bs-target="#viewPaymentModal" 
                              data-payment-id="PAY010" data-payer="Nguyễn Văn A" data-course="Luyện Thi JLPT N2" 
                              data-amount="2400000" data-status="Đang Chờ" data-payment-date="2025-05-10" 
                              data-payment-method="Bank Transfer"><i class="fas fa-eye"></i></button>
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
            <!-- View Payment Modal -->
            <div class="modal fade view-payment-modal" id="viewPaymentModal" tabindex="-1" aria-labelledby="viewPaymentModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="viewPaymentModalLabel"><i class="fas fa-credit-card"></i> Chi Tiết Thanh Toán</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-money-bill"></i> Thông Tin Thanh Toán</h6>
                      <div class="info-item">
                        <span class="info-label">ID Thanh Toán:</span>
                        <span class="info-value" id="viewPaymentId"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Người Thanh Toán:</span>
                        <span class="info-value" id="viewPayer"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Số Tiền:</span>
                        <span class="info-value" id="viewAmount"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Trạng Thái:</span>
                        <span class="info-value" id="viewStatus"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Phương Thức:</span>
                        <span class="info-value" id="viewPaymentMethod"></span>
                      </div>
                      <div class="info-item">
                        <span class="info-label">Ngày Thanh Toán:</span>
                        <span class="info-value" id="viewPaymentDate"></span>
                      </div>
                    </div>
                    <div class="section">
                      <h6 class="section-title"><i class="fas fa-book"></i> Thông Tin Khóa Học</h6>
                      <div class="info-item">
                        <span class="info-label">Khóa Học:</span>
                        <span class="info-value" id="viewCourse"></span>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-cancel" data-bs-dismiss="modal">Đóng</button>
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
      const allRows = Array.from(document.querySelectorAll('#paymentTableBody tr'));

      // Format number as VND
      function formatVND(amount) {
        return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(amount);
      }

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
      document.querySelectorAll('#payerFilter, #courseFilter, #statusFilter, #paymentDateFilter, #minAmountFilter, #maxAmountFilter, #search').forEach(filter => {
        filter.addEventListener('change', applyFilters);
        filter.addEventListener('input', applyFilters);
      });

      function applyFilters() {
        const payer = document.getElementById('payerFilter').value.toLowerCase();
        const course = document.getElementById('courseFilter').value.toLowerCase();
        const status = document.getElementById('statusFilter').value.toLowerCase();
        const paymentDate = document.getElementById('paymentDateFilter').value;
        const minAmount = parseFloat(document.getElementById('minAmountFilter').value) || 0;
        const maxAmount = parseFloat(document.getElementById('maxAmountFilter').value) || Infinity;
        const search = document.getElementById('search').value.toLowerCase();

        filteredRows = allRows.filter(row => {
          const payerText = row.cells[2].textContent.toLowerCase();
          const courseText = row.cells[3].textContent.toLowerCase();
          const statusText = row.cells[5].textContent.toLowerCase();
          const paymentDateText = row.cells[6].textContent;
          const amountText = parseFloat(row.cells[4].textContent.replace(/,/g, '')) || 0;
          const idText = row.cells[0].textContent.toLowerCase();

          const matchesPayer = payer === '' || payerText.includes(payer);
          const matchesCourse = course === '' || courseText.includes(course);
          const matchesStatus = status === '' || statusText.includes(status);
          const matchesDate = !paymentDate || paymentDateText === paymentDate;
          const matchesAmount = amountText >= minAmount && amountText <= maxAmount;
          const matchesSearch = !search || idText.includes(search) || payerText.includes(search);

          return matchesPayer && matchesCourse && matchesStatus && matchesDate && matchesAmount && matchesSearch;
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

      // View payment details modal logic
      document.querySelectorAll('.btn-view').forEach(button => {
        button.addEventListener('click', function () {
          const paymentId = this.getAttribute('data-payment-id');
          const payer = this.getAttribute('data-payer');
          const course = this.getAttribute('data-course');
          const amount = parseFloat(this.getAttribute('data-amount'));
          const status = this.getAttribute('data-status');
          const paymentDate = this.getAttribute('data-payment-date');
          const paymentMethod = this.getAttribute('data-payment-method');

          document.getElementById('viewPaymentId').textContent = paymentId;
          document.getElementById('viewPayer').textContent = payer;
          document.getElementById('viewCourse').textContent = course;
          document.getElementById('viewAmount').textContent = formatVND(amount);
          document.getElementById('viewStatus').innerHTML = 
            status === 'Thành Công' ? '<span class="badge badge-success">Thành Công</span>' :
            status === 'Thất Bại' ? '<span class="badge badge-failed">Thất Bại</span>' :
            '<span class="badge badge-pending">Đang Chờ</span>';
          document.getElementById('viewPaymentDate').textContent = paymentDate;
          document.getElementById('viewPaymentMethod').textContent = paymentMethod;
        });
      });

      // Initial pagination setup
      updatePagination();
    </script>
  </body>
</html>