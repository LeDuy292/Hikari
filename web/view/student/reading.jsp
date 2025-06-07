<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>HIKARI | Bài đọc hiểu N5 - Bài 1</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/reading.css"/>
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
      <div class="bg-white rounded-2xl shadow-lg p-6 mb-10">
        <div class="flex items-center justify-between mb-6">
          <div>
            <h2 class="text-2xl font-semibold text-orange-600">Tài liệu N5</h2>
            <h3 class="text-lg font-medium text-gray-700">Đọc hiểu - Bài 1: Cuộc sống hàng ngày</h3>
          </div>
          <a href="documents.jsp?type=free" class="text-orange-500 hover:text-orange-600 font-semibold flex items-center gap-2">
            <i class="fa fa-arrow-left"></i> Quay lại
          </a>
        </div>

        <!-- Page 1 -->
        <div class="reading-section animate-fadeIn" data-page="1">
          <h4 class="font-semibold text-lg">Đoạn văn 1</h4>
          <p class="text-gray-700 mt-2">
            わたしはたかしです。にほんじんです。せんせいです。まいあさ、7時におきます。8時にがっこうへいきます。がっこうでせんせいをします。ゆうがた、5時にかえります。ともだちもせんせいです。ともだちと7時にたべます。
          </p>
          <details>
            <summary>Dịch nghĩa</summary>
            <div>
              <p class="text-sm text-gray-600">Tôi là Takashi. Tôi là người Nhật. Tôi là giáo viên. Mỗi sáng, tôi dậy lúc 7 giờ. Lúc 8 giờ, tôi đến trường. Ở trường, tôi làm giáo viên. Chiều tối, lúc 5 giờ, tôi về nhà. Bạn tôi cũng là giáo viên. Lúc 7 giờ, tôi ăn cùng bạn.</p>
            </div>
          </details>
        </div>

        <div class="reading-section animate-fadeIn" data-page="1">
          <h4 class="font-semibold text-lg">Câu hỏi 1</h4>
          <ol class="list-decimal pl-5 mt-2 text-gray-700">
            <li>たかしさんはだれですか？ (Takashi là ai?)</li>
            <li>たかしさんはなんじにおきますか？ (Takashi dậy lúc mấy giờ?)</li>
            <li>たかしさんはどこへいきますか？ (Takashi đi đâu?)</li>
            <li>ともだちもせんせいですか？ (Bạn của Takashi có phải là giáo viên không?)</li>
            <li>たかしさんはなんじにたべますか？ (Takashi ăn lúc mấy giờ?)</li>
          </ol>
        </div>

        <div class="reading-section animate-fadeIn" data-page="1">
          <h4 class="font-semibold text-lg">Đáp án 1</h4>
          <details>
            <summary>Xem đáp án</summary>
            <div>
              <ol class="list-decimal pl-5 mt-2 text-gray-700">
                <li>たかしさんはせんせいです。 (Takashi là giáo viên.)</li>
                <li>たかしさんは7時におきます。 (Takashi dậy lúc 7 giờ.)</li>
                <li>たかしさんはがっこうへいきます。 (Takashi đi đến trường.)</li>
                <li>はい、ともだちもせんせいです。 (Vâng, bạn của Takashi cũng là giáo viên.)</li>
                <li>たかしさんは7時にたべます。 (Takashi ăn lúc 7 giờ.)</li>
              </ol>
            </div>
          </details>
        </div>

        <!-- Page 2 -->
        <div class="reading-section animate-fadeIn" data-page="2">
          <h4 class="font-semibold text-lg">Đoạn văn 2</h4>
          <p class="text-gray-700 mt-2">
            わたしはゆきです。がくせいです。まいあさ、6時におきます。7時にべんきょうします。9時にだいがくへいきます。だいがくでともだちとべんきょうします。ゆうがた、6時にかえります。かぞくもにほんじんです。
          </p>
          <details>
            <summary>Dịch nghĩa</summary>
            <div>
              <p class="text-sm text-gray-600">Tôi là Yuki. Tôi là học sinh. Mỗi sáng, tôi dậy lúc 6 giờ. Lúc 7 giờ, tôi học bài. Lúc 9 giờ, tôi đến trường đại học. Ở trường, tôi học cùng bạn. Chiều tối, lúc 6 giờ, tôi về nhà. Gia đình tôi cũng là người Nhật.</p>
            </div>
          </details>
        </div>

        <div class="reading-section animate-fadeIn" data-page="2">
          <h4 class="font-semibold text-lg">Câu hỏi 2</h4>
          <ol class="list-decimal pl-5 mt-2 text-gray-700">
            <li>ゆきさんはだれですか？ (Yuki là ai?)</li>
            <li>ゆきさんはなんじにおきますか？ (Yuki dậy lúc mấy giờ?)</li>
            <li>ゆきさんはどこでべんきょうしますか？ (Yuki học ở đâu?)</li>
            <li>かぞくもがくせいですか？ (Gia đình của Yuki có phải là học sinh không?)</li>
            <li>ゆきさんはなんじにかえりますか？ (Yuki về nhà lúc mấy giờ?)</li>
          </ol>
        </div>

        <div class="reading-section animate-fadeIn" data-page="2">
          <h4 class="font-semibold text-lg">Đáp án 2</h4>
          <details>
            <summary>Xem đáp án</summary>
            <div>
              <ol class="list-decimal pl-5 mt-2 text-gray-700">
                <li>ゆきさんはがくせいです。 (Yuki là học sinh.)</li>
                <li>ゆきさんは6時におきます。 (Yuki dậy lúc 6 giờ.)</li>
                <li>ゆきさんはだいがくでべんきょうします。 (Yuki học ở trường đại học.)</li>
                <li>いいえ、かぞくもがくせいではありません。 (Không, gia đình của Yuki không phải là học sinh.)</li>
                <li>ゆきさんは6時にかえります。 (Yuki về nhà lúc 6 giờ.)</li>
              </ol>
            </div>
          </details>
        </div>

        <!-- Pagination -->
        <div id="pagination" class="pagination"></div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>
  <script src="js/reading.js"></script>
</body>
</html>