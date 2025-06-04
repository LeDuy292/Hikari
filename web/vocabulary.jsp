<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Học từ vựng</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/vocabulary.css"/>
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

      <!-- Content area -->
      <div id="contentArea" class="bg-white rounded-2xl shadow-lg p-6 mb-10 animate-fadeIn">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h2 id="documentTitle" class="text-2xl font-semibold text-orange-600">Tài liệu N5</h2>
            <h3 id="lessonTitle" class="text-lg font-medium text-gray-700 mt-1">Bài 1 - Gia đình, con người</h3>
          </div>
          <a href="documents.jsp?type=free" id="backLink" class="text-orange-500 hover:text-orange-600 font-semibold flex items-center gap-2">
            <i class="fa fa-arrow-left"></i> Quay lại
          </a>
        </div>
        <div id="lessonContent" class="space-y-4">
          <table class="vocab-table w-full">
            <thead>
              <tr>
                <th>Mục từ</th>
                <th>Nghĩa</th>
              </tr>
            </thead>
            <tbody id="vocabTableBody">
              <!-- Vocabulary items will be populated by JavaScript -->
            </tbody>
          </table>
        </div>
        <div class="mt-6 flex justify-end">
          <!-- Progress bar or additional content can be added here -->
        </div>
        <div class="pagination" id="pagination">
          <!-- Pagination buttons will be populated by JavaScript -->
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
  <script src="js/vocabulary.js"></script>
</body>
</html>