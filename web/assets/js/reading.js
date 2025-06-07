let currentPage = 1;
const totalPages = document.querySelectorAll('[data-page]').length / 3; // Assuming 3 sections per page (passage, questions, answers)

function renderVocabItems(page) {
  document.querySelectorAll('.reading-section').forEach(section => {
    section.classList.remove('active');
    if (parseInt(section.getAttribute('data-page')) === page) {
      section.classList.add('active');
    }
  });
}

function renderPagination() {
  const pagination = document.getElementById('pagination');
  pagination.innerHTML = '';

  // Previous button
  const prevButton = document.createElement("button");
  prevButton.innerHTML = '<i class="fa fa-angle-left"></i>';
  prevButton.disabled = currentPage === 1;
  prevButton.addEventListener("click", () => {
    if (currentPage > 1) {
      currentPage--;
      renderVocabItems(currentPage);
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
      renderVocabItems(currentPage);
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
      renderVocabItems(currentPage);
      renderPagination();
    }
  });
  pagination.appendChild(nextButton);
}

// Initial render
renderVocabItems(currentPage);
renderPagination();