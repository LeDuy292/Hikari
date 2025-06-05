<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content="Học ngữ pháp tiếng Nhật N5 - Bài 1: Giới thiệu tên, tuổi, nghề nghiệp, quốc tịch và cách xưng hô với HIKARI.">
  <title>HIKARI | Ngữ pháp N5 - Bài 1</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Dancing+Script:wght@700&display=swap" rel="stylesheet">
  <link rel="icon" href="img/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="css/style.css"/>
  <link rel="stylesheet" href="css/sidebar.css"/>
  <link rel="stylesheet" href="css/header.css"/>
  <link rel="stylesheet" href="css/footer.css"/>
  <link rel="stylesheet" href="css/grammarLesson.css"/>
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
            <h2 class="text-2xl font-semibold text-orange-600">Tài liệu N5 - Bài 1</h2>
            <h3 class="text-lg font-medium text-gray-700">Giới thiệu tên, tuổi, nghề nghiệp, quốc tịch</h3>
            <div class="progress-bar w-1/2 mt-2">
              <div class="progress-bar-fill" style="width: 10%"></div>
            </div>
            <p class="text-sm text-gray-600">Tiến độ: 10%</p>
          </div>
          <a href="GrammarLessonList.html" class="text-orange-500 hover:text-orange-600 font-semibold flex items-center gap-2">
            <i class="fa fa-arrow-left"></i> Quay lại
          </a>
        </div>

        <!-- Grammar Sections -->
        <div id="content-sections" class="space-y-4">
          <!-- Section A: Đại từ nhân xưng -->
          <div class="grammar-section active" data-section="1">
            <h4 class="font-semibold text-lg">A. Đại từ nhân xưng</h4>
            <h5 class="font-medium text-gray-700 mt-4">1. Cách xưng "Tôi" – Ngôi thứ nhất</h5>
            <table>
              <tr>
                <th>Tiếng Nhật</th>
                <th>Phiên âm</th>
                <th>Ý nghĩa / Dùng khi nào</th>
              </tr>
              <tr>
                <td>わたし</td>
                <td>watashi</td>
                <td>Tôi (lịch sự, nam & nữ đều dùng được)</td>
              </tr>
              <tr>
                <td>ぼく</td>
                <td>boku</td>
                <td>Tôi (nam dùng, nhẹ nhàng, thân thiện)</td>
              </tr>
              <tr>
                <td>おれ</td>
                <td>ore</td>
                <td>Tôi (nam dùng, suồng sã, thân thiết)</td>
              </tr>
            </table>
            <p class="text-sm text-gray-600 mt-2">Gợi ý: Người mới nên dùng <strong>わたし</strong> vì an toàn và lịch sự trong mọi hoàn cảnh.</p>

            <h5 class="font-medium text-gray-700 mt-4">2. Cách xưng "Bạn / Anh / Chị" – Ngôi thứ hai</h5>
            <table>
              <tr>
                <th>Tiếng Nhật</th>
                <th>Phiên âm</th>
                <th>Ý nghĩa / Chú ý</th>
              </tr>
              <tr>
                <td>あなた</td>
                <td>anata</td>
                <td>Bạn / anh / chị (lịch sự, nhưng tránh lạm dụng)</td>
              </tr>
              <tr>
                <td>～さん</td>
                <td>~san</td>
                <td>Hậu tố xưng hô lịch sự gắn sau tên (ví dụ: Tanaka-san)</td>
              </tr>
            </table>
            <p class="text-sm text-gray-600 mt-2">Lưu ý: Người Nhật ít dùng <strong>あなた</strong>, thay vào đó gọi <strong>tên + さん</strong> là lịch sự nhất!</p>
          </div>

          <!-- Section B: Hậu tố xưng hô -->
          <div class="grammar-section" data-section="2">
            <h4 class="font-semibold text-lg">B. Hậu tố xưng hô</h4>
            <table>
              <tr>
                <th>Hậu tố</th>
                <th>Dùng khi nào</th>
              </tr>
              <tr>
                <td>さん (san)</td>
                <td>Lịch sự, phổ biến nhất (gắn sau tên người)</td>
              </tr>
              <tr>
                <td>くん (施 (kun)</td>
                <td>Dùng cho con trai nhỏ tuổi hơn hoặc bạn thân (nam dùng nhiều)</td>
              </tr>
              <tr>
                <td>ちゃん (chan)</td>
                <td>Dễ thương, thân mật – thường dùng cho trẻ em, con gái nhỏ</td>
              </tr>
              <tr>
                <td>さま (sama)</td>
                <td>Rất kính trọng (dùng cho khách hàng, trong thư tín trang trọng)</td>
              </tr>
              <tr>
                <td>せんせい (sensei)</td>
                <td>Dùng cho giáo viên, bác sĩ, người có địa vị chuyên môn cao</td>
              </tr>
            </table>
            <h5 class="font-medium text-gray-700 mt-4">Ví dụ:</h5>
            <ul class="list-disc pl-5 text-sm text-gray-600">
              <li>さくら です。さくらちゃん (Chị Sakura)</li>
              <li>たなかさん。たなかくん (Anh Tanaka)</li>
              <li>やまださん (Bác Yamada)</li>
            </ul>
          </div>

          <!-- Section C: Câu khẳng định -->
          <div class="grammar-section" data-section="3">
            <h4 class="font-semibold text-lg">C. Câu khẳng định</h4>
            <h5 class="font-medium text-gray-700">1. Mẫu câu cơ bản:</h5>
            <p class="text-sm text-gray-600"><strong>A は B です。</strong></p>
            <ul class="list-disc pl-5 text-sm text-gray-600">
              <li>A: Chủ ngữ (người/vật đang nói đến)</li>
              <li>は (wa): Trợ từ chủ đề</li>
              <li>B: Thông tin về chủ ngữ (vị ngữ)</li>
              <li>です: Động từ “to be” lịch sự (là…)</li>
            </ul>
            <p class="text-sm text-gray-600 mt-2">Chú ý: Câu khẳng định dùng để giới thiệu, xác nhận thông tin hoặc nói về sự thật một cách đơn giản và lịch sự.</p>
            <h5 class="font-medium text-gray-700 mt-4">2. Ví dụ:</h5>
            <ul class="list-disc pl-5 text-sm text-gray-600">
              <li>わたし は のびた です。 (Tôi là Nobita)</li>
              <li>しずか さん は がくせい です。 (Shizuka là học sinh)</li>
              <li>Linh さん は ベトナムじん です。 (Linh là người Việt Nam)</li>
            </ul>
            <h5 class="font-medium text-gray-700 mt-4">3. Vận dụng:</h5>
            <ul class="list-disc pl-5 text-sm text-gray-600">
              <li>タロウ さん は 日本人 です。 (Taro là người Nhật Bản)</li>
              <li>あきら さん は かいしゃいん です。 (Akira là nhân viên công ty)</li>
              <li>みちこ さん は がくせい です。 (Michiko là học sinh)</li>
            </ul>
          </div>

          <!-- Section D: Câu phủ định -->
          <div class="grammar-section" data-section="4">
            <h4 class="font-semibold text-lg">D. Câu phủ định</h4>
            <h5 class="font-medium text-gray-700">1. Cấu trúc ngữ pháp:</h5>
            <p class="text-sm text-gray-600"><strong>A は B じゃないです。</strong> (A không phải là B)</p>
            <p class="text-sm text-gray-600">Lịch sự: <strong>A は B ではありません。</strong></p>
            <p class="text-sm text-gray-600">Dùng để phủ nhận thông tin sai hoặc khẳng định rằng ai đó không thuộc một nhóm nào đó.</p>
            <h5 class="font-medium text-gray-700 mt-4">2. Ví dụ:</h5>
            <ul class="list-disc pl-5 text-sm text-gray-600">
              <li>わたし は のびた じゃありません。 (Tôi không phải Nobita)</li>
              <li>わたし は ベトナムじん じゃありません。 (Tôi không phải người Việt Nam)</li>
            </ul>
            <h5 class="font-medium text-gray-700 mt-4">3. Bài tập:</h5>
            <ul class="list-disc pl-5 text-sm text-gray-600">
              <li>Tôi không phải là người Nhật: わたし は にほんじん じゃありません。</li>
              <li>Shizuka không phải là giáo viên: しずかさん は せんせい じゃないです。</li>
              <li>Tôi không phải là Tùng: わたし は つん じゃありません。</li>
            </ul>
          </div>
        </div>

        <!-- Pagination -->
        <div id="pagination" class="pagination"></div>
      </div>

      <!-- Footer -->
      <%@include file="footer.jsp" %>
    </main>
  </div>

  <script src="js/grammarLesson.js"></script>
</body>
</html>