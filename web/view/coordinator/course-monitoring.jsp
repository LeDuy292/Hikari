<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giám Sát Khóa Học - Coordinator Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/course-monitoring.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
               <jsp:include page="sidebarCoordinator.jsp" />

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <jsp:include page="headerCoordinator.jsp" />
            
            <!-- Content -->
            <div class="content-wrapper">
                <!-- Course List -->
                <div class="row g-4">
                    <div class="col-12">
                        <div class="course-card-main">
                            <div class="course-card-header">
                                <h5 class="course-card-title mb-0">Danh sách khóa học tiếng Nhật</h5>
                                <div class="d-flex gap-2">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Tìm kiếm khóa học...">
                                        <button class="btn btn-outline-primary">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                    <button class="btn btn-primary">
                                        <i class="fas fa-plus me-2"></i>Thêm khóa học
                                    </button>
                                </div>
                            </div>
                            <div class="course-card-body">
                                <div class="row g-4">
                                    <!-- N1 Course -->
                                    <div class="col-md-6 col-lg-4">
                                        <div class="course-card">
                                            <div class="course-header">
                                                <h6 class="course-title">JLPT N1</h6>
                                                <span class="course-status status-active">Đang hoạt động</span>
                                            </div>
                                            <div class="course-stats">
                                                <div class="stat-item">
                                                    <i class="fas fa-users"></i>
                                                    <span>15 lớp học</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-clock"></i>
                                                    <span>24 tuần</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-chart-line"></i>
                                                    <span>75% hoàn thành</span>
                                                </div>
                                            </div>
                                            <div class="course-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 75%"></div>
                                                </div>
                                            </div>
                                            <div class="course-actions">
                                                <a href="class-management.jsp" class="btn btn-sm btn-outline-secondary" title="Xem lớp học">
                                                    <i class="fas fa-chalkboard-teacher"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- N2 Course -->
                                    <div class="col-md-6 col-lg-4">
                                        <div class="course-card">
                                            <div class="course-header">
                                                <h6 class="course-title">JLPT N2</h6>
                                                <span class="course-status status-active">Đang hoạt động</span>
                                            </div>
                                            <div class="course-stats">
                                                <div class="stat-item">
                                                    <i class="fas fa-users"></i>
                                                    <span>25 lớp học</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-clock"></i>
                                                    <span>20 tuần</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-chart-line"></i>
                                                    <span>85% hoàn thành</span>
                                                </div>
                                            </div>
                                            <div class="course-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 85%"></div>
                                                </div>
                                            </div>
                                            <div class="course-actions">
                                                <a href="class-management.jsp" class="btn btn-sm btn-outline-secondary" title="Xem lớp học">
                                                    <i class="fas fa-chalkboard-teacher"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- N3 Course -->
                                    <div class="col-md-6 col-lg-4">
                                        <div class="course-card">
                                            <div class="course-header">
                                                <h6 class="course-title">JLPT N3</h6>
                                                <span class="course-status status-pending">Chờ duyệt</span>
                                            </div>
                                            <div class="course-stats">
                                                <div class="stat-item">
                                                    <i class="fas fa-users"></i>
                                                    <span>30 lớp học</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-clock"></i>
                                                    <span>16 tuần</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-chart-line"></i>
                                                    <span>60% hoàn thành</span>
                                                </div>
                                            </div>
                                            <div class="course-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 60%"></div>
                                                </div>
                                            </div>
                                            <div class="course-actions">
                                                <a href="class-management.jsp" class="btn btn-sm btn-outline-secondary" title="Xem lớp học">
                                                    <i class="fas fa-chalkboard-teacher"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- N4 Course -->
                                    <div class="col-md-6 col-lg-4">
                                        <div class="course-card">
                                            <div class="course-header">
                                                <h6 class="course-title">JLPT N4</h6>
                                                <span class="course-status status-active">Đang hoạt động</span>
                                            </div>
                                            <div class="course-stats">
                                                <div class="stat-item">
                                                    <i class="fas fa-users"></i>
                                                    <span>40 lớp học</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-clock"></i>
                                                    <span>12 tuần</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-chart-line"></i>
                                                    <span>90% hoàn thành</span>
                                                </div>
                                            </div>
                                            <div class="course-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 90%"></div>
                                                </div>
                                            </div>
                                            <div class="course-actions">
                                                <a href="class-management.jsp" class="btn btn-sm btn-outline-secondary" title="Xem lớp học">
                                                    <i class="fas fa-chalkboard-teacher"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- N5 Course -->
                                    <div class="col-md-6 col-lg-4">
                                        <div class="course-card">
                                            <div class="course-header">
                                                <h6 class="course-title">JLPT N5</h6>
                                                <span class="course-status status-active">Đang hoạt động</span>
                                            </div>
                                            <div class="course-stats">
                                                <div class="stat-item">
                                                    <i class="fas fa-users"></i>
                                                    <span>45 lớp học</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-clock"></i>
                                                    <span>8 tuần</span>
                                                </div>
                                                <div class="stat-item">
                                                    <i class="fas fa-chart-line"></i>
                                                    <span>95% hoàn thành</span>
                                                </div>
                                            </div>
                                            <div class="course-progress">
                                                <div class="progress">
                                                    <div class="progress-bar" role="progressbar" style="width: 95%"></div>
                                                </div>
                                            </div>
                                            <div class="course-actions">
                                                <a href="class-management.jsp" class="btn btn-sm btn-outline-secondary" title="Xem lớp học">
                                                    <i class="fas fa-chalkboard-teacher"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 