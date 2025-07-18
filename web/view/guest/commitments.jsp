<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>HIKARI | Cam Kết Khóa Học</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/index.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header_student.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar_student.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css"  />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/roadmap.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/commitments.css" />
    </head>
    <body class="bg-[#f7f7fa] font-sans">
        <div class="flex-container">
            <!-- Sidebar -->
            <jsp:include page="sidebar.jsp" />

            <!-- Main content -->
            <main class="flex-1 px-8 py-6 flex flex-col">
                <!-- Header -->
                <jsp:include page="header.jsp" />

                <!-- Banner -->
                <div class="bg-white rounded-3xl overflow-hidden shadow-xl mb-8 mt-8">
                    <div class="mt-2 px-8 pb-8">
                        <div class="relative rounded-[2.5rem] overflow-hidden" style="height: 200px;">
                            <img src="${pageContext.request.contextPath}/assets/img/img_student/study.jpg" alt="Hikari Commitments Banner" class="absolute inset-0 w-full h-full object-cover" loading="lazy" />
                            <div class="absolute inset-0 bg-black bg-opacity-20"></div>
                            <div class="absolute left-8 top-8 z-10">
                                <h1 class="text-2xl md:text-3xl font-bold text-white mb-2">Cam Kết Khóa Học</h1>
                                <p class="text-white text-base">Đồng hành cùng bạn trên hành trình học tập</p>
                            </div>
                            <div class="absolute left-0 right-0 bottom-0 h-2 bg-gradient-to-r from-orange-400 to-orange-300 rounded-b-[2.5rem]"></div>
                        </div>
                    </div>
                </div>

                <!-- Navigation Tabs (as Links) -->
                <div class="flex justify-center mb-6 space-x-2">
                    <a href="courseInfo.jsp" class="tab-btn px-5 py-2 bg-gray-100 text-gray-700 rounded-full font-semibold">Thông tin khóa học</a>
                    <a href="roadmap.jsp" class="tab-btn px-5 py-2 bg-gray-100 text-gray-700 rounded-full font-semibold">Lộ trình khóa học</a>
                    <a href="commitments.jsp" class="tab-btn custom-active-btn px-5 py-2 font-semibold">Cam kết khóa học</a>
                </div>

                <!-- Commitments Content -->
                <section class="commitments-container max-w-4xl mx-auto mb-10">
                    <h2 class="text-3xl font-bold text-center mb-8 bg-gradient-to-r from-orange-400 to-orange-600 bg-clip-text text-transparent animate-pulse-slow">Cam Kết Của Chúng Tôi</h2>
                    <div class="commitments-grid grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="commitment-card">
                            <div class="commitment-image">
                                <img src="${pageContext.request.contextPath}/assets/img/img_student/course.jpg" alt="Nắm vững kiến thức JLPT" class="w-full h-40 object-cover rounded-t-xl" loading="lazy" />
                            </div>
                            <div class="commitment-content">
                                <i class="fas fa-check-circle text-orange-500 text-2xl mb-4"></i>
                                <h3 class="text-xl font-semibold text-gray-800 mb-2">Nắm vững kiến thức JLPT</h3>
                                <p class="text-gray-600">Học viên sẽ nắm vững kiến thức và kỹ năng theo cấp độ JLPT tương ứng sau khóa học.</p>
                            </div>
                        </div>
                        <div class="commitment-card">
                            <div class="commitment-image">
                                <img src="${pageContext.request.contextPath}/assets/img/img_student/course.jpg" alt="Giao tiếp tự tin" class="w-full h-40 object-cover rounded-t-xl" loading="lazy" />
                            </div>
                            <div class="commitment-content">
                                <i class="fas fa-comments text-orange-500 text-2xl mb-4"></i>
                                <h3 class="text-xl font-semibold text-gray-800 mb-2">Giao tiếp tự tin</h3>
                                <p class="text-gray-600">Hỗ trợ học viên tự tin giao tiếp tiếng Nhật trong đời sống và công việc thực tế.</p>
                            </div>
                        </div>
                        <div class="commitment-card">
                            <div class="commitment-image">
                                <img src="${pageContext.request.contextPath}/assets/img/img_student/course.jpg" alt="Hỗ trợ luyện thi" class="w-full h-40 object-cover rounded-t-xl" loading="lazy" />
                            </div>
                            <div class="commitment-content">
                                <i class="fas fa-book text-orange-500 text-2xl mb-4"></i>
                                <h3 class="text-xl font-semibold text-gray-800 mb-2">Hỗ trợ luyện thi</h3>
                                <p class="text-gray-600">Cung cấp tài liệu độc quyền và hỗ trợ luyện thi JLPT hiệu quả.</p>
                            </div>
                        </div>
                        <div class="commitment-card">
                            <div class="commitment-image">
                                <img src="${pageContext.request.contextPath}/assets/img/img_student/course.jpg" alt="Chứng chỉ hoàn thành" class="w-full h-40 object-cover rounded-t-xl" loading="lazy" />
                            </div>
                            <div class="commitment-content">
                                <i class="fas fa-certificate text-orange-500 text-2xl mb-4"></i>
                                <h3 class="text-xl font-semibold text-gray-800 mb-2">Chứng chỉ hoàn thành</h3>
                                <p class="text-gray-600">Cấp chứng chỉ chính thức từ HIKARI sau khi hoàn thành khóa học.</p>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Buttons Section -->
                <section class="buttons-container max-w-4xl mx-auto mb-10 flex justify-center space-x-4">
                    <a href="register.jsp" class="register-btn px-6 py-3 rounded-xl font-semibold" aria-label="Đăng ký ngay">Đăng ký ngay</a>
                    <a href="otherCourses.jsp" class="other-courses-btn px-6 py-3 rounded-xl font-semibold" aria-label="Khóa học khác">Khóa học khác</a>
                </section>

                <!-- Footer -->
                <jsp:include page="footer.jsp" />
            </main>
        </div>

        <script src="${pageContext.request.contextPath}/assets/js/scripts.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/commitments.js"></script>
    </body>
</html>