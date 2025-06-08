<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Bài nghe hiểu</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/sidebar.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/header.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/footer.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/listeningLesson.css"/>  <!-- Tệp CSS mới -->
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
        <div class="flex items-center justify-between mb-6">
          <div>
            <h2 class="text-2xl font-semibold text-orange-600">Tài liệu N5</h2>
            <h3 class="text-lg font-medium text-gray-700">Nghe hiểu</h3>
          </div>
          <a href="documents.jsp?documentId=1" class="text-orange-500 hover:text-orange-600 font-semibold flex items-center gap-2">
            <i class="fa fa-arrow-left"></i> Quay lại
          </a>
        </div>
        <div class="space-y-4">
          <!-- Audio Player -->
          <div class="mb-4">
            <audio controls>
              <source src="audio/listening-lesson.mp3" type="audio/mp3">
              Your browser does not support the audio element.
            </audio>
          </div>

          <!-- Drink Images -->
          <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
            <div class="flex flex-col items-center">
              <p class="text-gray-700 font-semibold mb-2">1</p>
              <img src="${pageContext.request.contextPath}/assets/img/student/drink1.png" alt="Drink 1" class="drink-image">
            </div>
            <div class="flex flex-col items-center">
              <p class="text-gray-700 font-semibold mb-2">2</p>
              <img src="${pageContext.request.contextPath}/assets/img/student/drink2.png" alt="Drink 2" class="drink-image">
            </div>
            <div class="flex flex-col items-center">
              <p class="text-gray-700 font-semibold mb-2">3</p>
              <img src="${pageContext.request.contextPath}/assets/img/student/drink3.png" alt="Drink 3" class="drink-image">
            </div>
            <div class="flex flex-col items-center">
              <p class="text-gray-700 font-semibold mb-2">4</p>
              <img src="${pageContext.request.contextPath}/assets/img/student/drink4.png" alt="Drink 4" class="drink-image">
            </div>
          </div>

          <!-- Toggle Script Section -->
          <div class="mb-4">
            <button id="toggleScriptBtn" class="bg-orange-500 text-white px-4 py-2 rounded-full font-semibold shadow hover:bg-orange-600 transition">
              Xem Script + Dịch
            </button>
          </div>
          <div id="scriptSection" class="space-y-2">
            <h4 class="text-xl font-semibold text-gray-800">Script + Dịch</h4>
            <p class="text-gray-700">Người nam và người nữ đang nói chuyện ở quán giải khát. Người nữ sẽ chọn gì?</p>
            <p class="text-gray-700 font-medium">F: お店の中は涼しいですね。</p>
            <p class="text-gray-600">Ở trong quán mát mẻ nhỉ.</p>
            <p class="text-gray-700 font-medium">M: ええ。じゃあ、ぼくはオレンジースにします。</p>
            <p class="text-gray-600">Vâng. Vậy, tui chọn nước ép cam.</p>
            <p class="text-gray-700 font-medium">F: あ、いいですね。でも、わたしはけっこう飲みたいですから、ほかの飲み物にします。</p>
            <p class="text-gray-600">A, được nhỉ. Nhưng mà, tui vị sẵn sàng nay đã uống, nên tui sẽ chọn đồ uống khác.</p>
            <p class="text-gray-700 font-medium">M: じゃあ、アイスコーヒーはどうですか。この店はおいしいですよ。</p>
            <p class="text-gray-600">Vậy, cà phê kem thì thế nào? Món này ở đây ngon đấy.</p>
            <p class="text-gray-700 font-medium">F: ええ、知っています。でも、星にも合わたい飲み物を飲みたいですから、温かいほうじ茶にします。</p>
            <p class="text-gray-600">Vâng, tui biết. Nhưng mà, vị buổi trưa tui cũng đã uống đồ lạnh, nên tui sẽ chọn đồ uống nóng.</p>
            <p class="text-gray-700 font-medium">M: そうですか。</p>
            <p class="text-gray-600">Vậy à.</p>
          </div>

          <!-- Questions -->
          <div class="mt-6">
            <h4 class="text-xl font-semibold text-gray-800">Câu hỏi</h4>
            <div id="questionList" class="space-y-4">
              <!-- Questions will be dynamically loaded here -->
            </div>
            <div id="pagination" class="pagination"></div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>

  <script src="js/listeningLesson.js"></script>  <!-- Tệp JS mới -->
</body>
</html>