document.addEventListener('DOMContentLoaded', function() {
    // Xử lý nút đăng ký và xem chi tiết
    const enrollBtn = document.querySelector('.enroll-btn');
    if (enrollBtn) {
        enrollBtn.addEventListener('click', function() {
            alert('Bạn đã đăng ký khóa học thành công!');
        });
    }

    const viewBtn = document.querySelector('.view-btn');
    if (viewBtn) {
        viewBtn.addEventListener('click', function() {
            alert('Xem các khóa học khác!');
        });
    }
});