// grammarLesson.js
let currentPage = 1;
const totalPages = 4; // Up to Section D

function renderSections(page) {
    const sections = document.querySelectorAll('.grammar-section');
    sections.forEach(section => section.classList.remove('active'));
    sections.forEach(section => {
        if (parseInt(section.getAttribute('data-section')) === page) {
            section.classList.add('active');
        }
    });
}

function renderPagination() {
    const pagination = document.getElementById('pagination');
    pagination.innerHTML = ''; // Clear previous pagination

    // Previous button
    const prevButton = document.createElement("button");
    prevButton.innerHTML = '<i class="fa fa-angle-left"></i>';
    prevButton.disabled = currentPage === 1;
    prevButton.addEventListener("click", () => {
        if (currentPage > 1) {
            currentPage--;
            renderSections(currentPage);
            renderPagination();
        }
    });
    pagination.appendChild(prevButton);

    // Page number buttons
    for (let i = 1; i <= totalPages; i++) {
        const pageButton = document.createElement("button");
        pageButton.textContent = i;
        pageButton.className = i === currentPage ? "active" : "";
        pageButton.addEventListener("click", () => {
            currentPage = i;
            renderSections(currentPage);
            renderPagination();
        });
        pagination.appendChild(pageButton);
    }

    // Next button
    const nextButton = document.createElement("button");
    nextButton.innerHTML = '<i class="fa fa-angle-right"></i>';
    nextButton.disabled = currentPage === totalPages;
    nextButton.addEventListener("click", () => {
        if (currentPage < totalPages) {
            currentPage++;
            renderSections(currentPage);
            renderPagination();
        }
    });
    pagination.appendChild(nextButton);
}

// Initialize
renderSections(currentPage);
renderPagination();