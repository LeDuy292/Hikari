// Example: Approve/Reject AJAX logic
document.querySelectorAll('.btn-success, .btn-danger').forEach(btn => {
    btn.addEventListener('click', function() {
        const action = this.classList.contains('btn-success') ? 'approve' : 'reject';
        // Get course ID from data attribute
        // Send AJAX request to backend
        // On success, update status badge and row
    });
});