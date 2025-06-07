<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Tiếp tục học</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/sidebar.css"/>
  <link rel="stylesheet" href="css/header.css"/>
  <link rel="stylesheet" href="css/footer.css"/>
  <link rel="stylesheet" href="css/continueLearning.css"/>  <!-- Tệp CSS mới -->
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
      <div id="contentArea" class="bg-white rounded-2xl shadow-lg p-6 mb-10">
        <h2 id="documentTitle" class="text-2xl font-semibold text-orange-600 mb-4">Tài liệu N5</h2>
        <div id="lessonList" class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div class="bg-gray-50 p-4 rounded-xl shadow hover:shadow-lg transition group animate-fadeIn">
            <div class="flex items-center space-x-4">
              <i class="fa fa-book text-orange-500 text-2xl"></i>
              <div>
                <h3 class="font-semibold text-lg">Từ vựng N5 - Chủ đề gia đình</h3>
                <p class="text-gray-500 text-sm">Học 50 từ vựng về gia đình và quan hệ</p>
              </div>
            </div>
            <div class="mt-4">
              <a href="VocabularyLessonList.html" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
            </div>
          </div>
          <div class="bg-gray-50 p-4 rounded-xl shadow hover:shadow-lg transition group animate-fadeIn">
            <div class="flex items-center space-x-4">
              <i class="fa fa-pen text-orange-500 text-2xl"></i>
              <div>
                <h3 class="font-semibold text-lg">Ngữ pháp N5 - Câu cơ bản</h3>
                <p class="text-gray-500 text-sm">Cấu trúc câu khẳng định và phủ định</p>
              </div>
            </div>
            <div class="mt-4">
              <a href="grammarLessonList.jsp" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
            </div>
          </div>
          <div class="bg-gray-50 p-4 rounded-xl shadow hover:shadow-lg transition group animate-fadeIn">
            <div class="flex items-center space-x-4">
              <i class="fa fa-file-alt text-orange-500 text-2xl"></i>
              <div>
                <h3 class="font-semibold text-lg">Đọc hiểu N5 - Thư ngắn</h3>
                <p class="text-gray-500 text-sm">Luyện đọc thư giới thiệu bản thân</p>
              </div>
            </div>
            <div class="mt-4">
              <a href="ReadingLessonList.html" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
            </div>
          </div>
          <div class="bg-gray-50 p-4 rounded-xl shadow hover:shadow-lg transition group animate-fadeIn">
            <div class="flex items-center space-x-4">
              <i class="fa fa-headphones text-orange-500 text-2xl"></i>
              <div>
                <h3 class="font-semibold text-lg">Nghe hiểu N5 - Hội thoại cơ bản</h3>
                <p class="text-gray-500 text-sm">Luyện nghe hội thoại chào hỏi</p>
              </div>
            </div>
            <div class="mt-4">
              <a href="ListeningLessonList.html" class="text-sm text-white bg-orange-500 px-4 py-1 rounded-full font-semibold shadow hover:bg-orange-600 transition">Học ngay</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
</body>
</html>