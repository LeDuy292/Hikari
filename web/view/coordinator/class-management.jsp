<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Lớp Học - Coordinator Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/dashboard.css" rel="stylesheet"> <%-- Reuse existing CSS --%>
    <%-- Consider adding specific CSS for class management if needed --%>
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
                <div class="card p-0">
                    <div class="card-header bg-white border-bottom-0 pb-0">
                        <div class="row g-2 align-items-center">
                            <div class="col-md-6">
                                <h5 class="card-title mb-0">Danh sách lớp học</h5>
                            </div>
                            <div class="col-md-6">
                                <%-- Add search/filter for classes if needed --%>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th>Tên lớp học</th>
                                        <th>Tên khóa học</th>
                                        <th>Giáo viên</th>
                                        <th>Ngày bắt đầu</th>
                                        <th>Ngày kết thúc</th>
                                        <th>Lịch học</th>
                                        <th>Số HV / Tối đa</th>
                                        <th>Trạng thái</th>
                                        <%-- Add Thao tác column if needed for viewing class details, etc. --%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%-- Example Class Row (replace with dynamic data) --%>
                                    <tr>
                                        <td>Lớp N1 - 01</td>
                                        <td>JLPT N1</td>
                                        <td>Nguyễn Văn A</td>
                                        <td>01/09/2023</td>
                                        <td>24/02/2024</td>
                                        <td>Thứ 2, 4, 6 (19:00 - 21:00)</td>
                                        <td>25 / 30</td>
                                        <td><span class="badge bg-success">Đang diễn ra</span></td>
                                        <%-- Add Thao tác buttons if needed --%>
                                    </tr>
                                     <tr>
                                        <td>Lớp N1 - 02</td>
                                        <td>JLPT N1</td>
                                        <td>Trần Thị B</td>
                                        <td>15/09/2023</td>
                                        <td>08/03/2024</td>
                                        <td>Thứ 3, 5, 7 (20:00 - 22:00)</td>
                                        <td>28 / 30</td>
                                        <td><span class="badge bg-warning">Sắp khai giảng</span></td>
                                        <%-- Add Thao tác buttons if needed --%>
                                    </tr>
                                    <%-- Add more rows for other classes --%>
                                     <tr>
                                        <td>Lớp N2 - 01</td>
                                        <td>JLPT N2</td>
                                        <td>Lê Văn C</td>
                                        <td>01/10/2023</td>
                                        <td>24/04/2024</td>
                                        <td>Thứ 2, 4, 6 (19:30 - 21:30)</td>
                                        <td>20 / 25</td>
                                        <td><span class="badge bg-success">Đang diễn ra</span></td>
                                        <%-- Add Thao tác buttons if needed --%>
                                    </tr>
                                     <tr>
                                        <td>Lớp N3 - 01</td>
                                        <td>JLPT N3</td>
                                        <td>Nguyễn Văn D</td>
                                        <td>05/10/2023</td>
                                        <td>28/04/2024</td>
                                        <td>Thứ 3, 5, 7 (18:00 - 20:00)</td>
                                        <td>22 / 25</td>
                                        <td><span class="badge bg-success">Đang diễn ra</span></td>
                                        <%-- Add Thao tác buttons if needed --%>
                                    </tr>
                                     <tr>
                                        <td>Lớp N4 - 01</td>
                                        <td>JLPT N4</td>
                                        <td>Trần Thị E</td>
                                        <td>10/10/2023</td>
                                        <td>03/05/2024</td>
                                        <td>Thứ 2, 4, 6 (20:00 - 22:00)</td>
                                        <td>18 / 20</td>
                                        <td><span class="badge bg-warning">Sắp khai giảng</span></td>
                                        <%-- Add Thao tác buttons if needed --%>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 