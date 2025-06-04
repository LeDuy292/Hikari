<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <title>Chấm Điểm Bài Tập - Nền Tảng Giáo dục</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet" />
 <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/quiz.css" />

</head>
<body>
  <div class="container-fluid">
     <div class="row">
                <!-- Sidebar -->
                <%@ include file="sidebar.jsp" %>
                <!-- Main Content -->
                <main class="main-content">
                    <div class="content-wrapper">
                        <!-- Header -->
                        <%@ include file="header.jsp" %>
      <!-- Main Content -->
      <main class="main-content">
        <div class="content-wrapper">
          <a href="/manageCourses" class="back-btn"><i class="fas fa-arrow-left"></i> Quay lại Quản lý Khóa học</a>
          <div class="assignment-list">
            <div class="assignment-list-header">
              <h2 class="assignment-list-title">Danh sách Bài tập đã nộp</h2>
              <span class="assignment-count">${assignments.size()} bài tập</span>
            </div>
            <c:forEach var="assignment" items="${assignments}">
              <div class="assignment-item" data-assignment-id="${assignment.id}" ${assignment.active ? 'class="active"' : ''}>
                <i class="fas fa-file-alt assignment-icon"></i>
                <div class="assignment-info">
                  <h3 class="assignment-title">${assignment.title}</h3>
                  <div class="assignment-meta">Học sinh: ${assignment.studentName} | Nộp: ${assignment.submissionDate}</div>
                </div>
              </div>
            </c:forEach>
          </div>
          <div class="assignment-detail">
            <div class="assignment-detail-left">
              <h3 class="assignment-list-title">Thông tin Bài tập</h3>
              <div class="assignment-meta">
                <p><strong>Khóa học:</strong> <span id="courseName">${selectedAssignment.courseName}</span></p>
                <p><strong>Bài tập:</strong> <span id="assignmentTitle">${selectedAssignment.title}</span></p>
                <p><strong>Học sinh:</strong> <span id="studentName">${selectedAssignment.studentName}</span></p>
                <p><strong>Ngày nộp:</strong> <span id="submissionDate">${selectedAssignment.submissionDate}</span></p>
                <p><strong>Trạng thái:</strong> <span id="status">${selectedAssignment.status}</span></p>
              </div>
            </div>
            <div class="assignment-detail-right">
              <h3 class="assignment-content" style="text-align: center;">Nội dung Bài nộp</h3>
              <div class="assignment-content">
                <div class="question-box">
                  <label>Câu hỏi:</label>
                  <p id="questionText">${selectedAssignment.question}</p>
                </div>
                <div class="answer-box">
                  <label>Đáp án của học sinh:</label>
                  <div id="answerText">${selectedAssignment.answer}</div>
                </div>
              </div>
              <div class="grading-form">
                <h3 class="assignment-content">Chấm điểm và Nhận xét</h3>
                <form id="gradingForm">
                  <div class="mb-3">
                    <label for="grade" class="form-label">Điểm (0 - 100)</label>
                    <input type="number" class="form-control score-input" id="grade" placeholder="0" min="0" max="100" value="${selectedAssignment.grade}" />
                    <span class="score-max">/ 100</span>
                  </div>
                  <div class="mb-3">
                    <label for="feedback" class="form-label">Nhận xét</label>
                    <textarea class="form-control" id="feedback" rows="4" placeholder="Nhập nhận xét cho học sinh...">${selectedAssignment.feedback}</textarea>
                  </div>
                  <button type="submit" class="btn-submit-grade">Gửi điểm</button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>
