<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Diễn đàn luyện thi JLPT</title>
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
      rel="stylesheet"
    />
    <link href="${pageContext.request.contextPath}/assets/css/main-forum.css" rel="stylesheet" />
  </head>
  <body>
    <!-- TopBar -->
    <div class="topbar">
      <div class="logo">
        <div class="logo-icon">
          <img src="${pageContext.request.contextPath}/assets/img/logo.png" alt="Logo" class="logo-img" />
        </div>
        Diễn đàn luyện thi JLPT
      </div>
      <nav class="nav">
        <a href="#"><i class="fas fa-home"></i> Trang chủ</a>
        <a href="#"><i class="fas fa-phone"></i> Liên hệ</a>
        <div class="account-dropdown" id="accountDropdown">
          <button class="account-btn" onclick="toggleDropdown(event)">
            <div class="avatar sm">
              <img src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="Avatar" />
            </div>
            <%= request.getAttribute("username") != null ? request.getAttribute("username") : "Tài khoản" %> <i class="fas fa-caret-down"></i>
          </button>
          <div class="dropdown-menu">
            <a href="#"><i class="fas fa-user"></i> Hồ sơ cá nhân</a>
            <a href="#"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a>
          </div>
        </div>
      </nav>
    </div>

    <!-- Layout -->
    <div class="layout">
      <!-- Sidebar Left -->
      <aside class="sidebar-left">
        <div class="topics">
          <div class="topics-title">Chủ đề thảo luận</div>
          <ul class="topic-list">
            <li>
              <a href="#" data-filter="all" class="active"><i class="fas fa-star"></i> Tất cả</a>
            </li>
            <li>
              <a href="#" data-filter="JLPT N5"><i class="fas fa-star"></i> JLPT N5</a>
            </li>
            <li>
              <a href="#" data-filter="JLPT N4"><i class="fas fa-star"></i> JLPT N4</a>
            </li>
            <li>
              <a href="#" data-filter="JLPT N3"><i class="fas fa-star"></i> JLPT N3</a>
            </li>
            <li>
              <a href="#" data-filter="JLPT N2"><i class="fas fa-star"></i> JLPT N2</a>
            </li>
            <li>
              <a href="#" data-filter="JLPT N1"><i class="fas fa-star"></i> JLPT N1</a>
            </li>
            <li>
              <a href="#" data-filter="Từ vựng"><i class="fas fa-book"></i> Từ vựng</a>
            </li>
            <li>
              <a href="#" data-filter="Ngữ pháp"><i class="fas fa-language"></i> Ngữ pháp</a>
            </li>
            <li>
              <a href="#" data-filter="Kinh nghiệm thi"><i class="fas fa-lightbulb"></i> Kinh nghiệm thi</a>
            </li>
            <li>
              <a href="#" data-filter="Luyện nghe"><i class="fas fa-headphones"></i> Luyện nghe</a>
            </li>
            <li>
              <a href="#" data-filter="Luyện đọc"><i class="fas fa-book-open"></i> Luyện đọc</a>
            </li>
            <li>
              <a href="#" data-filter="Hỏi đáp chung"><i class="fas fa-question-circle"></i> Hỏi đáp chung</a>
            </li>
          </ul>
        </div>
      </aside>

      <!-- Main Content -->
      <main class="main-content">
        <!-- Forum Toolbar -->
        <div class="forum-toolbar">
          <h1>Bài viết mới nhất</h1>
          <div class="toolbar-actions">
            <button class="btn btn-primary" onclick="openPostModal()">
              <i class="fas fa-plus"></i> Tạo bài viết mới
            </button>
            <div class="filters">
              <select id="sortSelect" onchange="handleSortChange()">
                <option value="newest">Mới nhất</option>
                <option value="popular">Phổ biến</option>
                <option value="most-liked">Được thích nhiều</option>
              </select>
              <select id="filterSelect" onchange="handleFilterChange()">
                <option value="all">Tất cả</option>
                <option value="with-replies">Có phản hồi</option>
                <option value="no-replies">Chưa có phản hồi</option>
              </select>
            </div>
          </div>
        </div>

        <!-- Post List -->
        <div class="post-list">
          <%
            // Sample dynamic post list (replace with actual data from backend)
            List<Object[]> posts = (List<Object[]>) request.getAttribute("posts");
            if (posts == null) {
              posts = new ArrayList<>();
              posts.add(new Object[]{"Trần Thị B", "Cách sử dụng particle は (wa) và が (ga)", "Ngữ pháp,JLPT N4", "2 giờ trước", 120, 2, 15});
              posts.add(new Object[]{"Yamada Sensei", "Bài tập luyện Hiragana cho người mới bắt đầu", "Bài tập,JLPT N5", "5 giờ trước", 98, 1, 32});
              posts.add(new Object[]{"Admin Coordinator", "Thông báo: Lịch thi JLPT N5 tháng 12", "Thông báo,JLPT N5", "1 ngày trước", 210, 0, 28});
              posts.add(new Object[]{"Nguyễn Văn C", "Chia sẻ kinh nghiệm thi JLPT N3 lần đầu", "Kinh nghiệm,JLPT N3", "2 ngày trước", 156, 8, 45});
              posts.add(new Object[]{"Lê Thị D", "Tổng hợp từ vựng JLPT N2 theo chủ đề", "Từ vựng,JLPT N2", "3 ngày trước", 89, 3, 22});
              posts.add(new Object[]{"Tanaka Sensei", "Phương pháp học Kanji hiệu quả", "Kanji,Phương pháp học", "4 ngày trước", 234, 12, 67});
              posts.add(new Object[]{"Phạm Văn E", "Luyện nghe JLPT N4 - Bài tập số 1", "Luyện nghe,JLPT N4", "5 ngày trước", 145, 5, 38});
              posts.add(new Object[]{"Suzuki Sensei", "Cách phân biệt các thì trong tiếng Nhật", "Ngữ pháp,Thì", "1 tuần trước", 178, 9, 52});
            }
            for (Object[] post : posts) {
              String author = (String) post[0];
              String title = (String) post[1];
              String tags = (String) post[2];
              String time = (String) post[3];
              int views = (Integer) post[4];
              int comments = (Integer) post[5];
              int likes = (Integer) post[6];
          %>
          <div class="post-card" data-tags="<%= tags %>">
            <div class="post-image">
              <img src="img/dashborad/logo.png" alt="Post image" />
            </div>
            <div class="post-content">
              <div class="post-header">
                <div class="avatar">
                  <img src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="Avatar" />
                </div>
                <div class="author-info">
                  <span class="author-name"><%= author %></span>
                  <div class="post-meta">
                    <span><i class="fas fa-clock"></i> <%= time %></span>
                    <span><i class="fas fa-eye"></i> <%= views %></span>
                    <span><i class="fas fa-comments"></i> <%= comments %></span>
                  </div>
                </div>
                <div class="post-tags">
                  <% for (String tag : tags.split(",")) { %>
                    <span class="tag"><%= tag %></span>
                  <% } %>
                </div>
              </div>
              <a class="post-title" href="#"><%= title %></a>
              <div class="post-actions">
                <button class="action-btn">
                  <i class="fas fa-thumbs-up"></i> <%= likes %>
                </button>
                <button class="action-btn">
                  <i class="fas fa-comment"></i> <%= comments %>
                </button>
              </div>
            </div>
          </div>
          <% } %>
        </div>
      </main>

      <!-- Sidebar Right -->
      <aside class="sidebar-right">
        <!-- Top Users Widget -->
        <div class="widget">
          <h3 class="widget-title">
            <i class="fas fa-trophy"></i> Top tương tác
          </h3>
          <ul class="top-users">
            <li class="top-user">
              <div class="rank">1</div>
              <div class="avatar">
                <img src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="Avatar" />
              </div>
              <div class="user-info">
                <div class="user-name">Yamada Sensei</div>
                <div class="user-role">Giáo viên</div>
                <div class="user-points">2500 điểm</div>
              </div>
            </li>
            <li class="top-user">
              <div class="rank">2</div>
              <div class="avatar">
                <img src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="Avatar" />
              </div>
              <div class="user-info">
                <div class="user-name">Nguyễn Văn A</div>
                <div class="user-role">Học viên</div>
                <div class="user-points">1250 điểm</div>
              </div>
            </li>
            <li class="top-user">
              <div class="rank">3</div>
              <div class="avatar">
                <img src="${pageContext.request.contextPath}/assets/img/avatar.png" alt="Avatar" />
              </div>
              <div class="user-info">
                <div class="user-name">Lê Thị C</div>
                <div class="user-role">Học viên</div>
                <div class="user-points">980 điểm</div>
              </div>
            </li>
          </ul>
        </div>

        <!-- Quick Links Widget -->
        <div class="widget">
          <h3 class="widget-title">
            <i class="fas fa-link"></i> Liên kết nhanh
          </h3>
          <button class="btn btn-blue btn-block">
            <i class="fas fa-book"></i> Từ vựng hôm nay
          </button>
          <button class="btn btn-yellow btn-block">
            <i class="fas fa-language"></i> Ngữ pháp cơ bản
          </button>
          <button class="btn btn-primary btn-block">
            <i class="fas fa-clipboard-check"></i> Kiểm tra trình độ
          </button>
        </div>

        <!-- Image Widget -->
        <div class="widget">
          <div class="widget-image">
            <img src="${pageContext.request.contextPath}/assets/img/learning.jpg" alt="Featured image" />
          </div>
        </div>
      </aside>
    </div>

    <!-- Create Post Modal -->
    <div class="modal-overlay" id="createPostModal">
      <div class="modal">
        <div class="modal-header">
          <h2 class="modal-title">Tạo bài viết mới</h2>
        </div>
        <div class="modal-body">
          <form id="createPostForm" action="createPost" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label class="form-label" for="postTitle">Tiêu đề</label>
              <input
                type="text"
                class="form-control"
                id="postTitle"
                name="postTitle"
                placeholder="Nhập tiêu đề bài viết..."
              />
            </div>
            <div class="form-group">
              <label class="form-label" for="postCategory">Chủ đề</label>
              <select class="form-control" id="postCategory" name="postCategory">
                <option value="">Chọn chủ đề</option>
                <option value="jlpt-n5">JLPT N5</option>
                <option value="jlpt-n4">JLPT N4</option>
                <option value="jlpt-n3">JLPT N3</option>
                <option value="jlpt-n2">JLPT N2</option>
                <option value="jlpt-n1">JLPT N1</option>
                <option value="vocabulary">Từ vựng</option>
                <option value="grammar">Ngữ pháp</option>
                <option value="experience">Kinh nghiệm thi</option>
                <option value="listening">Luyện nghe</option>
                <option value="reading">Luyện đọc</option>
              </select>
            </div>
            <div class="form-group">
              <label class="form-label" for="postContent">Nội dung</label>
              <textarea
                class="form-control"
                id="postContent"
                name="postContent"
                rows="6"
                placeholder="Nhập nội dung bài viết..."
              ></textarea>
            </div>
            <div class="form-group">
              <label class="form-label">Hình ảnh</label>
              <div
                class="image-upload"
                onclick="document.getElementById('imageInput').click()"
              >
                <input
                  type="file"
                  id="imageInput"
                  name="imageInput"
                  accept="image/*"
                  onchange="previewImage(event)"
                />
                <i
                  class="fas fa-cloud-upload-alt"
                  style="font-size: 2em; margin-bottom: 10px"
                ></i>
                <p>Nhấp để chọn hình ảnh hoặc kéo thả vào đây</p>
                <img
                  id="imagePreview"
                  class="image-preview"
                  style="display: none"
                />
              </div>
            </div>
            <div class="form-group">
              <label class="form-label" for="postTags">Tags (phân cách bằng dấu phẩy)</label>
              <input
                type="text"
                class="form-control"
                id="postTags"
                name="postTags"
                placeholder="VD: ngữ pháp, JLPT N4"
              />
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" onclick="document.getElementById('createPostForm').submit()">Đăng bài</button>
          <button class="btn" onclick="closePostModal()">Hủy</button>
        </div>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/main-forum.js"></script>
  </body>
</html>