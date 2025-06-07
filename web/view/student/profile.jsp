<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Hồ sơ học viên</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/profile.css"/>
   <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/sidebar.css"/>
  <link rel="stylesheet" href="css/header.css"/>
  <link rel="stylesheet" href="css/footer.css"/>
</head>
<body class="bg-[#f7f7fa] font-['Poppins']">
  <div class="flex min-h-screen">
    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>

    <!-- Main content -->
    <main class="flex-1 pl-[19rem] pr-8 py-6 flex flex-col min-h-screen">
      <!-- Header -->
      <%@include file="header.jsp" %>

      <!-- Profile Content -->
      <div id="contentArea" class="grid grid-cols-1 lg:grid-cols-3 gap-7 mb-10 transition-all duration-500 ease-in-out">
        <!-- Personal Information -->
        <div class="bg-white p-6 rounded-2xl shadow-lg animate-fadeIn">
          <h2 class="text-xl font-semibold text-gray-700 mb-4">Thông tin cá nhân</h2>
          <div class="flex items-center mb-4">
            <img src="img/Yamanakako-lake-in-fall.jpeg" alt="Avatar" class="w-16 h-16 rounded-full shadow border-2 border-orange-200 mr-4">
            <div>
              <h3 id="profileName" class="text-lg font-semibold">Dat Tung</h3>
              <p class="text-gray-500 text-sm">Học viên HIKARI</p>
            </div>
          </div>
          <div class="space-y-3">
            <p><span class="font-medium">Tên đăng nhập:</span> <span id="profileUsername">VanTung222</span></p>
            <p><span class="font-medium">Họ và tên:</span> <span id="profileFullName">Dat Tung</span></p>
            <p><span class="font-medium">Email:</span> <span id="profileEmail">TungTVDE180109@fpt.edu.vn</span></p>
            <p><span class="font-medium">Số điện thoại:</span> <span id="profilePhone">0842737475</span></p>
            <p><span class="font-medium">Địa chỉ:</span> <span id="profileAddress">Thôn 2, Xã Khuê Ngọc Điền</span></p>
            <p><span class="font-medium">Ngày sinh:</span> <span id="profileDob">12/01/2004</span></p>
            <p><span class="font-medium">Giới tính:</span> <span id="profileGender">Nam</span></p>
            <p><span class="font-medium">Ngày tham gia:</span> 15/03/2024</p>
            <p><span class="font-medium">Cấp độ:</span> N5</p>
            <button id="editProfileBtn" class="bg-orange-500 text-white px-5 py-2 rounded-full font-semibold shadow hover:bg-orange-600 transition w-full mt-4">Chỉnh sửa thông tin</button>
          </div>
        </div>

        <!-- Learning Progress -->
        <div class="bg-white p-6 rounded-2xl shadow-lg animate-fadeIn lg:col-span-2">
          <h2 class="text-xl font-semibold text-gray-700 mb-4">Tiến độ học tập</h2>
          <div class="flex flex-col gap-6">
            <!-- Online Courses Section -->
            <div class="flex-1">
              <h3 class="text-lg font-semibold text-gray-600 mb-3">Khóa học online</h3>
              <div class="space-y-4">
                <div class="flex items-center justify-between">
                  <div>
                    <h4 class="font-semibold">Khóa học N5 Online</h4>
                    <p class="text-gray-500 text-sm">Khóa học trực tuyến cơ bản N5</p>
                  </div>
                  <div class="w-1/3">
                    <div class="bg-gray-200 h-2 rounded-full">
                      <div class="bg-orange-500 h-2 rounded-full" style="width: 60%"></div>
                    </div>
                    <p class="text-sm text-gray-500 text-right mt-1">60% hoàn thành</p>
                  </div>
                </div>
                <div class="flex items-center justify-between">
                  <div>
                    <h4 class="font-semibold">Hội thoại N5</h4>
                    <p class="text-gray-500 text-sm">Luyện hội thoại tiếng Nhật cơ bản</p>
                  </div>
                  <div class="w-1/3">
                    <div class="bg-gray-200 h-2 rounded-full">
                      <div class="bg-orange-500 h-2 rounded-full" style="width: 30%"></div>
                    </div>
                    <p class="text-sm text-gray-500 text-right mt-1">30% hoàn thành</p>
                  </div>
                </div>
              </div>
              <button class="bg-orange-100 text-orange-500 px-5 py-2 rounded-full font-semibold shadow hover:bg-orange-500 hover:text-white transition w-full mt-4">Xem tất cả khóa học</button>
            </div>
            <!-- Documents Section -->
            <div class="flex-1">
              <h3 class="text-lg font-semibold text-gray-600 mb-3">Tài liệu</h3>
              <div class="space-y-4">
                <div class="flex items-center justify-between">
                  <div>
                    <h4 class="font-semibold">Tài liệu N5</h4>
                    <p class="text-gray-500 text-sm">Học từ vựng và ngữ pháp N5</p>
                  </div>
                  <div class="w-1/3">
                    <div class="bg-gray-200 h-2 rounded-full">
                      <div class="bg-orange-500 h-2 rounded-full" style="width: 75%"></div>
                    </div>
                    <p class="text-sm text-gray-500 text-right mt-1">75% hoàn thành</p>
                  </div>
                </div>
                <div class="flex items-center justify-between">
                  <div>
                    <h4 class="font-semibold">Future Plans</h4>
                    <p class="text-gray-500 text-sm">Lập kế hoạch tương lai bằng tiếng Nhật</p>
                  </div>
                  <div class="w-1/3">
                    <div class="bg-gray-200 h-2 rounded-full">
                      <div class="bg-orange-500 h-2 rounded-full" style="width: 40%"></div>
                    </div>
                    <p class="text-sm text-gray-500 text-right mt-1">40% hoàn thành</p>
                  </div>
                </div>
              </div>
              <button class="bg-orange-100 text-orange-500 px-5 py-2 rounded-full font-semibold shadow hover:bg-orange-500 hover:text-white transition w-full mt-4">Xem tất cả tài liệu</button>
            </div>
          </div>
        </div>

        <!-- Account Settings -->
        <div class="bg-white p-6 rounded-2xl shadow-lg animate-fadeIn">
          <h2 class="text-xl font-semibold text-gray-700 mb-4">Cài đặt tài khoản</h2>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <span class="text-gray-600">Thông báo qua email</span>
              <input type="checkbox" checked class="h-5 w-5 text-orange-500 rounded focus:ring-orange-300">
            </div>
            <div class="flex items-center justify-between">
              <span class="text-gray-600">Thông báo đẩy</span>
              <input type="checkbox" class="h-5 w-5 text-orange-500 rounded focus:ring-orange-300">
            </div>
            <button class="bg-orange-500 text-white px-5 py-2 rounded-full font-semibold shadow hover:bg-orange-600 transition w-full mt-4">Đổi mật khẩu</button>
          </div>
        </div>

        <!-- Recent Activity Section -->
        <div class="bg-white p-6 rounded-2xl shadow-lg animate-fadeIn lg:col-span-2">
          <h2 class="text-xl font-semibold text-gray-700 mb-4">Hoạt động gần đây</h2>
          <div class="space-y-3">
            <div class="flex items-center gap-3">
              <i class="fa fa-check-circle text-orange-500"></i>
              <p class="text-sm text-gray-600">Hoàn thành bài học "Từ vựng N5 - Bài 5" <span class="text-gray-500">25/05/2024</span></p>
            </div>
            <div class="flex items-center gap-3">
              <i class="fa fa-play-circle text-orange-500"></i>
              <p class="text-sm text-gray-600">Bắt đầu khóa học "Hội thoại N5" <span class="text-gray-500">24/05/2024</span></p>
            </div>
            <div class="flex items-center gap-3">
              <i class="fa fa-file-alt text-orange-500"></i>
              <p class="text-sm text-gray-600">Tải tài liệu "Ngữ pháp N5 cơ bản" <span class="text-gray-500">23/05/2024</span></p>
            </div>
            <div class="flex items-center gap-3">
              <i class="fa fa-star text-orange-500"></i>
              <p class="text-sm text-gray-600">Đạt thành tựu "100 từ vựng N5" <span class="text-gray-500">20/04/2024</span></p>
            </div>
          </div>
          <button class="bg-orange-100 text-orange-500 px-5 py-2 rounded-full font-semibold shadow hover:bg-orange-500 hover:text-white transition w-full mt-4">Xem tất cả hoạt động</button>
        </div>
      </div>

      <!-- Edit Profile Modal -->
      <div id="editProfileModal" class="modal fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center hidden z-50">
        <div class="modal-content bg-white p-6 rounded-2xl shadow-lg max-w-lg w-full">
          <h2 class="text-xl font-semibold text-gray-700 mb-4">Chỉnh sửa thông tin</h2>
          <div class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-600">Tên đăng nhập</label>
              <input id="editUsername" type="text" value="VanTung222" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600">Họ và tên</label>
              <input id="editFullName" type="text" value="Dat Tung" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600">Email</label>
              <input id="editEmail" type="email" value="TungTVDE180109@fpt.edu.vn" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600">Số điện thoại</label>
              <input id="editPhone" type="text" value="0842737475" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600">Địa chỉ</label>
              <input id="editAddress" type="text" value="Thôn 2, Xã Khuê Ngọc Điền" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600">Ngày sinh</label>
              <input id="editDob" type="date" value="2004-01-12" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-600">Giới tính</label>
              <select id="editGender" class="w-full p-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-orange-300">
                <option value="Nam" selected>Nam</option>
                <option value="Nữ">Nữ</option>
                <option value="Khác">Khác</option>
              </select>
            </div>
          </div>
          <div class="flex gap-3 mt-6">
            <button id="cancelEditBtn" class="bg-gray-200 text-gray-700 px-5 py-2 rounded-full font-semibold shadow hover:bg-gray-300 transition w-full">Hủy</button>
            <button id="saveEditBtn" class="bg-orange-500 text-white px-5 py-2 rounded-full font-semibold shadow hover:bg-orange-600 transition w-full">Lưu</button>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
  <script src="js/profile.js"></script>
</body>
</html>