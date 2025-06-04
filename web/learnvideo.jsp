<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Bài học</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/sidebar.css"/>
  <link rel="stylesheet" href="css/header.css"/>
  <link rel="stylesheet" href="css/footer.css"/>
  <link rel="stylesheet" href="css/learnvideo.css"/>
</head>
<body class="bg-[#f7f7fa] font-['Poppins']">
  <div class="flex min-h-screen">
    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>

    <!-- Main content -->
    <main class="flex-1 pl-[17rem] pr-8 py-6 flex flex-col min-h-screen">
      <!-- Header -->
      <%@include file="header.jsp" %>

      <!-- Lesson Content -->
      <div class="flex flex-col md:flex-row gap-6 mb-10">
        <!-- Lesson List -->
        <div class="lesson-list-container w-full md:w-1/3 bg-white rounded-2xl shadow-lg p-4">
          <h2 class="text-xl font-semibold text-orange-600 mb-4">Tiến trình học</h2>
          <div id="lessonList" class="space-y-2"></div>
        </div>

        <!-- Video and Exercise Section -->
        <div class="video-section flex-1 bg-white rounded-2xl shadow-lg p-6">
          <h2 id="lessonTitle" class="text-xl font-semibold text-orange-600 mb-2"></h2>
          <p class="text-gray-500 text-sm mb-4"></p>
          <div class="relative w-full" style="padding-bottom: 56.25%;">
            <iframe id="lessonVideo" class="absolute top-0 left-0 w-full h-full" src="" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
          </div>
          <div class="flex justify-between items-center mt-4">
            <div id="lessonNav" class="flex space-x-2">
              <button data-lesson="1" class="lesson-nav-button px-4 py-2 rounded-lg text-white font-semibold shadow hover:bg-blue-600 transition">Bài 1</button>
              <button data-lesson="2" class="lesson-nav-button px-4 py-2 rounded-lg text-white font-semibold shadow hover:bg-blue-600 transition">Bài 2</button>
            </div>
            <a href="index.jsp" class="bg-orange-500 text-white px-6 py-2 rounded-lg font-semibold shadow hover:bg-orange-600 transition">Quay lại</a>
          </div>
          <div id="exerciseSection" class="mt-6">
            <h3 id="exerciseTitle" class="text-lg font-semibold text-orange-600 mb-4"></h3>
            <div id="exerciseContent" class="space-y-4"></div>
          </div>
          <a href="review.jsp" class="bg-green-500 text-white px-6 py-2 rounded-lg font-semibold shadow hover:bg-green-600 transition mt-4 inline-block">Làm bài tập tổng hợp</a>
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
  <script src="js/learnvideo.js"></script>
</body>
</html>