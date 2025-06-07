<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Chi tiết tài liệu N5</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/detailfree.css"/>
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

      <!-- Course details -->
      <div class="bg-white rounded-2xl shadow-lg p-8 mb-8 animate-fadeIn">
        <div class="flex flex-col md:flex-row gap-8">
          <!-- Course image and actions -->
          <div class="md:w-1/3">
            <img src="img/Yamanakako-lake-in-fall.jpeg" alt="Course" class="rounded-xl w-full h-64 object-cover mb-4 shadow-md"/>
            <div class="flex flex-col gap-4">
              <div class="text-orange-500 font-bold text-2xl mb-2"></div>
              <button id="startLearningBtn" class="bg-orange-500 text-white px-6 py-3 rounded-full font-semibold shadow hover:bg-orange-600 transition">
                <i class="fa fa-play mr-2"></i>Học Ngay
              </button>
            </div>
          </div>
          <!-- Course info -->
          <div class="md:w-2/3">
            <h2 class="text-2xl font-bold text-gray-800 mb-4">Tài liệu N5</h2>
            <p class="text-gray-600 mb-4">Giảng viên: <span class="font-medium">Nguyễn Văn A</span></p>
            <p class="text-gray-600 mb-6">Bộ tài liệu N5 được thiết kế dành cho người mới bắt đầu học tiếng Nhật, cung cấp nền tảng vững chắc về từ vựng, ngữ pháp và kỹ năng nghe. Nội dung được biên soạn kỹ lưỡng, phù hợp với kỳ thi JLPT N5, giúp học viên tự tin đạt được mục tiêu học tập.</p>
            <div class="mb-6">
              <h3 class="text-lg font-semibold text-gray-800 mb-2">Mục tiêu khóa học</h3>
              <ul class="list-disc pl-5 text-gray-600">
                <li>Nắm vững 800 từ vựng cơ bản của trình độ N5.</li>
                <li>Hiểu và áp dụng 100 cấu trúc ngữ pháp quan trọng.</li>
                <li>Cải thiện kỹ năng nghe và đọc hiểu cơ bản.</li>
                <li>Chuẩn bị kỹ lưỡng cho kỳ thi JLPT N5.</li>
              </ul>
            </div>
            <div>
              <h3 class="text-lg font-semibold text-gray-800 mb-2">Thông tin khóa học</h3>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-gray-600">
                <div><i class="fa fa-clock mr-2 text-orange-500"></i>Thời lượng: 30 giờ</div>
                <div><i class="fa fa-book mr-2 text-orange-500"></i>Bài giảng: 50 bài</div>
                <div><i class="fa fa-level-up-alt mr-2 text-orange-500"></i>Trình độ: Sơ cấp</div>
                <div><i class="fa fa-language mr-2 text-orange-500"></i>Ngôn ngữ: Tiếng Nhật & Tiếng Việt</div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Course content -->
      <div class="bg-white rounded-2xl shadow-lg p-8 mb-8 animate-fadeIn">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Nội dung tài liệu</h2>
        <div class="space-y-4">
          <div class="border-b border-orange-100 pb-4">
            <h3 class="text-lg font-semibold text-gray-800">Phần 1: Từ vựng cơ bản</h3>
            <p class="text-gray-600">Học 400 từ vựng thông dụng, bao gồm số đếm, ngày tháng, và từ vựng hàng ngày.</p>
          </div>
          <div class="border-b border-orange-100 pb-4">
            <h3 class="text-lg font-semibold text-gray-800">Phần 2: Ngữ pháp N5</h3>
            <p class="text-gray-600">Nắm vững các cấu trúc ngữ pháp như ～ます, ～です, và các dạng câu cơ bản.</p>
          </div>
          <div class="border-b border-orange-100 pb-4">
            <h3 class="text-lg font-semibold text-gray-800">Phần 3: Kỹ năng nghe</h3>
            <p class="text-gray-600">Luyện nghe với các đoạn hội thoại thực tế, tập trung vào phát âm và ngữ điệu.</p>
          </div>
          <div>
            <h3 class="text-lg font-semibold text-gray-800">Phần 4: Luyện thi JLPT N5</h3>
            <p class="text-gray-600">Bài tập thực hành và đề thi mẫu để chuẩn bị cho kỳ thi JLPT.</p>
          </div>
        </div>
      </div>

      <!-- Instructor info -->
      <div class="bg-white rounded-2xl shadow-lg p-8 mb-8 animate-fadeIn">
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Về giảng viên</h2>
        <div class="flex items-center gap-4">
          <img src="img/instructor.jpg" alt="Instructor" class="w-20 h-20 rounded-full border-2 border-orange-200 object-cover"/>
          <div>
            <h3 class="text-lg font-semibold text-gray-800">Nguyễn Văn A</h3>
            <p class="text-gray-600">Giảng viên tiếng Nhật với hơn 10 năm kinh nghiệm, đạt chứng chỉ JLPT N1. Chuyên gia trong việc giảng dạy từ vựng và ngữ pháp cho người mới bắt đầu, với phương pháp dễ hiểu và thực tế.</p>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
  <script src="js/detailfree.js"></script>
</body>
</html>