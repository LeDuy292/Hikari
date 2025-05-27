<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard - Nền Tảng Giáo Dục</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts for Elegant Font -->
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@700&display=swap" rel="stylesheet" />
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Custom CSS -->
    <style>
      :root {
        --primary-color: #4a90e2;
        --secondary-color: #34495e;
        --accent-color: #f39c12;
        --background-color: #f7f9fb;
        --text-color: #ffffff;
        --text-dark: #333333;
      }

      body {
        background-color: var(--background-color);
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        display: flex;
        min-height: 100vh;
        margin: 0;
        padding: 0;
      }

      .container-fluid {
        display: flex;
        width: 100%;
        margin: 0;
        padding: 0;
      }

      .row {
        display: flex;
        width: 100%;
        margin: 0;
        padding: 0;
      }

      .main-content {
        flex: 1;
        padding: 32px;
        margin-left: 320px;
        background-color: #f1f5f9;
      }

      .content-wrapper {
        background: white;
        border-radius: 24px;
        padding: 32px;
        height: calc(100vh - 64px);
        overflow-y: auto;
        background-color: #f1f5f9;
      }

      .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 1rem 2rem;
        background: #ffffff;
        border-radius: 10px;
        margin-bottom: 2rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.25);
      }

      .header-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--text-dark);
        margin: 0;
      }

      .header-actions {
        display: flex;
        align-items: center;
        gap: 1rem;
      }

      .user-profile {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-left: 1.5rem;
        padding-left: 20px;
        border-left: none;
      }

      .avatar {
        display: flex;
        align-items: center;
        gap: 20px;
      }

      .user-info {
        font-size: 0.9rem;
        color: var(--text-dark);
        font-weight: 500;
      }

      .logout-btn {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        color: var(--text-dark);
        font-size: 0.85rem;
        text-decoration: none;
        transition: color 0.2s;
      }

      .logout-btn:hover {
        color: var(--accent-color);
      }

      .stat-card {
        border-radius: 15px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        transition: transform 0.3s, box-shadow 0.3s;
        background: #ffffff;
        padding: 20px;
        display: flex;
        align-items: center;
        gap: 15px;
      }

      .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.35);
      }

      .stat-card .icon {
        font-size: 2rem;
        width: 50px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 10px;
      }

      .stat-card .icon.users {
        background-color: var(--primary-color);
        color: var(--text-color);
      }
      .stat-card .icon.courses {
        background-color: var(--secondary-color);
        color: var(--text-color);
      }
      .stat-card .icon.materials {
        background-color: var(--accent-color);
        color: var(--text-color);
      }
      .stat-card .icon.tests {
        background-color: #7f8c8d;
        color: var(--text-color);
      }

      .stat-card .card-title {
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 0;
        color: var(--text-dark);
      }

      .stat-card .card-subtitle {
        font-size: 0.9rem;
        color: var(--text-dark);
      }

      .stat-card .growth {
        font-size: 0.85rem;
        margin-top: 5px;
        color: var(--text-dark);
      }

      .chart-container {
        background: #ffffff;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        margin-bottom: 20px;
      }

      .chart-container h5 {
        color: var(--text-dark);
      }

      .course-section {
        background: #ffffff;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
      }

      .course-section h5 {
        color: var(--text-dark);
        margin-bottom: 20px;
      }

      .course-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        max-height: 400px;
        overflow-y: auto;
        padding-right: 10px;
      }

      .course-grid::-webkit-scrollbar {
        width: 8px;
      }

      .course-grid::-webkit-scrollbar-thumb {
        background: var(--primary-color);
        border-radius: 4px;
      }

      .course-grid::-webkit-scrollbar-track {
        background: rgba(255, 255, 255, 0.1);
      }

      .course-card {
        background: rgba(255, 255, 255, 0.05);
        border-radius: 10px;
        overflow: hidden;
        transition: transform 0.3s, box-shadow 0.3s;
        position: relative;
        cursor: pointer;
      }

      .course-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
      }

      .course-card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
      }

      .course-info {
        padding: 15px;
        color: var(--text-dark);
      }

      .course-info h6 {
        font-size: 1.1rem;
        margin-bottom: 10px;
        color: var(--text-dark);
      }

      .course-info p {
        font-size: 0.9rem;
        margin: 5px 0;
        color: var(--text-dark);
      }

      .course-info .badge {
        font-size: 0.85rem;
      }

      .tooltip {
        position: absolute;
        background: var(--accent-color);
        color: var(--text-color);
        padding: 5px 10px;
        border-radius: 5px;
        font-size: 0.85rem;
        top: 10px;
        right: 10px;
        opacity: 0;
        transition: opacity 0.3s;
        pointer-events: none;
      }

      .course-card:hover .tooltip {
        opacity: 1;
      }

      .badge-success {
        background-color: #2ecc71;
      }

      .badge-warning {
        background-color: var(--accent-color);
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <!-- Include Sidebar -->
        <%@ include file="sidebar.jsp" %>
        <!-- Main Content -->
        <div class="main-content">
          <div class="content-wrapper">
            <!-- Include Header -->
            <%@ include file="header.jsp" %>

            <!-- Statistics Cards -->
            <div class="row mb-4">
              <div class="col-md-3">
                <div class="stat-card">
                  <div class="icon users">
                    <i class="fas fa-users"></i>
                  </div>
                  <div>
                    <h6 class="card-subtitle mb-2">TỔNG SỐ NGƯỜI DÙNG</h6>
                    <h5 class="card-title">17</h5>
                    <small class="growth text-muted">
                      <i class="fas fa-arrow-up"></i> 0%
                    </small>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="stat-card">
                  <div class="icon courses">
                    <i class="fas fa-book"></i>
                  </div>
                  <div>
                    <h6 class="card-subtitle mb-2">TỔNG SỐ KHÓA HỌC</h6>
                    <h5 class="card-title">5</h5>
                    <small class="growth text-muted">
                      <i class="fas fa-arrow-up"></i> 0%
                    </small>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="stat-card">
                  <div class="icon materials">
                    <i class="fas fa-file-alt"></i>
                  </div>
                  <div>
                    <h6 class="card-subtitle mb-2">TỔNG SỐ TÀI LIỆU</h6>
                    <h5 class="card-title">46</h5>
                    <small class="growth text-success">
                      <i class="fas fa-arrow-up"></i> +3.7%
                    </small>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="stat-card">
                  <div class="icon tests">
                    <i class="fas fa-check-square"></i>
                  </div>
                  <div>
                    <h6 class="card-subtitle mb-2">BÀI KIỂM TRA ĐÃ TẠO</h6>
                    <h5 class="card-title">8</h5>
                    <small class="growth text-success">
                      <i class="fas fa-arrow-up"></i> +1.8%
                    </small>
                  </div>
                </div>
              </div>
            </div>

            <!-- Charts -->
            <div class="row mb-4">
              <div class="col-md-6">
                <div class="chart-container">
                  <h5 class="mb-4">Tăng Trưởng Người Dùng</h5>
                  <canvas id="userGrowthChart"></canvas>
                </div>
              </div>
              <div class="col-md-6">
                <div class="chart-container">
                  <h5 class="mb-4">Tổng Doanh Thu Theo Tháng</h5>
                  <canvas id="revenueChart"></canvas>
                </div>
              </div>
            </div>

            <!-- Recent Courses Section -->
            <div class="course-section">
              <h5>Khóa Học Gần Đây</h5>
              <div class="course-grid">
                <!-- Course Card 1 -->
                <div class="course-card" data-id="CRS001">
                  <img src="img/courses/Japanese-N1.jpg" alt="Tiếng Nhật N1" />
                  <div class="course-info">
                    <h6>Tiếng Nhật N1</h6>
                    <p><strong>Giảng viên:</strong> Nguyễn Văn A</p>
                    <p><strong>Học viên:</strong> 25</p>
                    <p><span class="badge badge-success">Đang Mở</span></p>
                  </div>
                  <div class="tooltip">Xem Chi Tiết</div>
                </div>
                <!-- Course Card 2 -->
                <div class="course-card" data-id="CRS002">
                  <img src="img/courses/Japanese-N2.png" alt="Tiếng Nhật N2" />
                  <div class="course-info">
                    <h6>Tiếng Nhật N2</h6>
                    <p><strong>Giảng viên:</strong> Trần Thị B</p>
                    <p><strong>Học viên:</strong> 18</p>
                    <p><span class="badge badge-warning">Sắp Khai Giảng</span></p>
                  </div>
                  <div class="tooltip">Xem Chi Tiết</div>
                </div>
                <!-- Course Card 3 -->
                <div class="course-card" data-id="CRS003">
                  <img src="img/courses/Japanese-N3.png" alt="Tiếng Nhật N3" />
                  <div class="course-info">
                    <h6>Tiếng Nhật N3</h6>
                    <p><strong>Giảng viên:</strong> Lê Văn C</p>
                    <p><strong>Học viên:</strong> 30</p>
                    <p><span class="badge badge-success">Đang Mở</span></p>
                  </div>
                  <div class="tooltip">Xem Chi Tiết</div>
                </div>
                <!-- Course Card 4 -->
                <div class="course-card" data-id="CRS004">
                  <img src="img/courses/Japanese-N4.jpg" alt="Tiếng Nhật N4" />
                  <div class="course-info">
                    <h6>Tiếng Nhật N4</h6>
                    <p><strong>Giảng viên:</strong> Phạm Thị D</p>
                    <p><strong>Học viên:</strong> 15</p>
                    <p><span class="badge badge-success">Đang Mở</span></p>
                  </div>
                  <div class="tooltip">Xem Chi Tiết</div>
                </div>
                <!-- Course Card 5 -->
                <div class="course-card" data-id="CRS005">
                  <img src="img/courses/Japanese-N5.jpg" alt="Tiếng Nhật N5" />
                  <div class="course-info">
                    <h6>Tiếng Nhật N5</h6>
                    <p><strong>Giảng viên:</strong> Hoàng Văn E</p>
                    <p><strong>Học viên:</strong> 22</p>
                    <p><span class="badge badge-success">Đang Mở</span></p>
                  </div>
                  <div class="tooltip">Xem Chi Tiết</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js Initialization -->
    <script>
      // User Growth Chart (Line Chart)
      const userGrowthCtx = document.getElementById("userGrowthChart").getContext("2d");
      new Chart(userGrowthCtx, {
        type: "line",
        data: {
          labels: ["Th1", "Th2", "Th3", "Th4", "Th5", "Th6"],
          datasets: [
            {
              label: "Người Dùng Mới",
              data: [35, 70, 95, 90, 100, 105],
              borderColor: "#F39C12",
              backgroundColor: "rgba(243, 156, 18, 0.2)",
              borderWidth: 2,
              fill: true,
            },
          ],
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: "Người Dùng",
                color: "#333333",
              },
              ticks: {
                color: "#333333",
              },
              grid: {
                color: "rgba(0, 0, 0, 0.1)",
              },
            },
            x: {
              title: {
                display: true,
                text: "Tháng",
                color: "#333333",
              },
              ticks: {
                color: "#333333",
              },
              grid: {
                color: "rgba(0, 0, 0, 0.1)",
              },
            },
          },
          plugins: {
            legend: {
              labels: {
                color: "#333333",
              },
            },
          },
        },
      });

      // Revenue Chart (Bar Chart)
      const revenueCtx = document.getElementById("revenueChart").getContext("2d");
      new Chart(revenueCtx, {
        type: "bar",
        data: {
          labels: ["Th1", "Th2", "Th3", "Th4", "Th5", "Th6"],
          datasets: [
            {
              label: "Tổng Doanh Thu",
              data: [200000000, 180000000, 220000000, 190000000, 210000000, 230000000],
              backgroundColor: "#4A90E2",
              borderColor: "#4A90E2",
              borderWidth: 1,
            },
          ],
        },
        options: {
          responsive: true,
          scales: {
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: "Doanh Thu (VND)",
                color: "#333333",
              },
              ticks: {
                color: "#333333",
                callback: function(value) {
                  return new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(value);
                },
              },
              grid: {
                color: "rgba(0, 0, 0, 0.1)",
              },
            },
            x: {
              title: {
                display: true,
                text: "Tháng",
                color: "#333333",
              },
              ticks: {
                color: "#333333",
              },
              grid: {
                color: "rgba(0, 0, 0, 0.1)",
              },
            },
          },
          plugins: {
            legend: {
              labels: {
                color: "#333333",
              },
            },
            tooltip: {
              callbacks: {
                label: function(context) {
                  let label = context.dataset.label || '';
                  if (label) {
                    label += ': ';
                  }
                  if (context.parsed.y !== null) {
                    label += new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(context.parsed.y);
                  }
                  return label;
                },
              },
            },
          },
        },
      });

      // Course Card Click Handler
      document.querySelectorAll(".course-card").forEach((card) => {
        card.addEventListener("click", () => {
          const courseId = card.getAttribute("data-id");
          window.location.href = `manageCourses.jsp?id=${courseId}`;
        });
      });
    </script>
  </body>
</html>