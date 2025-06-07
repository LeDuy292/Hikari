<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Danh sách ngữ pháp</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/sidebar.css"/>
  <link rel="stylesheet" href="css/header.css"/>
  <link rel="stylesheet" href="css/footer.css"/>
  <link rel="stylesheet" href="css/grammarLessonList.css"/>  <!-- Tệp CSS mới -->
</head>
<body class="main-body">
  <div class="main-container">
    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>

    <!-- Main content -->
    <main class="main-content">
      <!-- Header -->
      <%@include file="header.jsp" %>

      <!-- Content area -->
      <div class="bg-white rounded-2xl shadow-lg p-6 mb-10">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h2 class="text-2xl font-semibold text-orange-600">Tài liệu N5</h2>
            <h3 class="text-lg font-medium text-gray-700">Ngữ pháp</h3>
          </div>
          <a href="ContinueLearning.html?id=1" class="text-orange-500 hover:text-orange-600 font-semibold flex items-center gap-2">
            <i class="fa fa-arrow-left"></i> Quay lại
          </a>
        </div>
        <div class="space-y-4">
          <div class="lesson-item flex items-center justify-between animate-fadeIn">
            <div>
              <h4 class="font-semibold text-lg">Bài 4 - Thời gian</h4>
              <p class="text-sm text-gray-600">Tiến độ: 70%</p>
            </div>
            <a href="grammarLesson.jsp?documentId=1&lessonId=4" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
          </div>
          <div class="lesson-item flex items-center justify-between animate-fadeIn">
            <div>
              <h4 class="font-semibold text-lg">Bài 5 - Thiên nhiên</h4>
              <p class="text-sm text-gray-600">Tiến độ: 50%</p>
            </div>
            <a href="grammarLesson.jsp?documentId=1&lessonId=5" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
          </div>
          <div class="lesson-item flex items-center justify-between animate-fadeIn">
            <div>
              <h4 class="font-semibold text-lg">Bài 6 - Cuộc sống hàng ngày</h4>
              <p class="text-sm text-gray-600">Tiến độ: 30%</p>
            </div>
            <a href="grammarLesson.jsp?documentId=1&lessonId=6" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
          </div>
          <div class="lesson-item flex items-center justify-between animate-fadeIn">
            <div>
              <h4 class="font-semibold text-lg">Bài 9 - Cấu trúc ko.so.a.do</h4>
              <p class="text-sm text-gray-600">Tiến độ: 20%</p>
            </div>
            <a href="grammarLesson.jsp?documentId=1&lessonId=9" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
          </div>
          <div class="lesson-item flex items-center justify-between animate-fadeIn">
            <div>
              <h4 class="font-semibold text-lg">Bài 12 - Mua sắm</h4>
              <p class="text-sm text-gray-600">Tiến độ: 10%</p>
            </div>
            <a href="grammarLesson.jsp?documentId=1&lessonId=12" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
</body>
</html>