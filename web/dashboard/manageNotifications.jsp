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
    <link href="css/dashboard/manaNotifications.css" rel="stylesheet" />
    
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <!-- Include Sidebar -->
        <%@ include file="sidebar.jsp" %>
        <div class="main-content">
          <div class="content-wrapper">
            <div class="header">
              <h2 class="header-title">Quản Lý Thông Báo</h2>
              <div class="header-actions">
                <button class="btn btn-add" data-bs-toggle="modal" data-bs-target="#createNotificationModal">
                  <i class="fas fa-plus"></i> Thêm Thông Báo
                </button>
                <div class="user-profile">
                  <img src="img/dashborad/defaultLogoAdmin.png" alt="Ảnh Đại Diện Quản Trị" class="avatar" />
                  <div class="user-info">
                    <span class="user-name">Xin Chào, Quản Trị</span>
                    <a href="/LogoutServlet" class="logout-btn">
                      <i class="fas fa-sign-out-alt"></i>
                      Đăng Xuất
                    </a>
                  </div>
                </div>
              </div>
            </div>
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
    <script src="js/dashboard/manaNotifications.js"></script>
  </body>
</html>