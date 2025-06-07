// Toggle Script Section
const toggleScriptBtn = document.getElementById('toggleScriptBtn');
const scriptSection = document.getElementById('scriptSection');

toggleScriptBtn.addEventListener('click', () => {
  if (scriptSection.style.display === 'none' || scriptSection.style.display === '') {
    scriptSection.style.display = 'block';
    toggleScriptBtn.textContent = 'Ẩn Script + Dịch';
  } else {
    scriptSection.style.display = 'none';
    toggleScriptBtn.textContent = 'Xem Script + Dịch';
  }
});

// Sample questions data
const questions = [
  {
    question: "Người đàn ông đang hỏi điều gì?",
    options: [
      { text: "(F): Quan hệ của người này với tôi là gì?", correct: true },
      { text: "(M): Tên người này là gì?", correct: false },
      { text: "(F): Công việc của người này là gì?", correct: false },
      { text: "(M): Tuổi của người này là bao nhiêu?", correct: false }
    ]
  },
  {
    question: "Người phụ nữ trả lời như thế nào?",
    options: [
      { text: "(A): Anh ấy là bạn trai của tôi.", correct: true },
      { text: "(M): Không, tôi không biết anh ấy.", correct: false }
    ]
  },
  {
    question: "Người đàn ông nói món ăn này ngon không?",
    options: [
      { text: "(F): Vâng, món ăn này ngon.", correct: true },
      { text: "(M): Không, món ăn này không ngon.", correct: false }
    ]
  }
];

const itemsPerPage = 2;
let currentPage = 1;
const totalPages = Math.ceil(questions.length / itemsPerPage);

// Function to render questions for the current page
function renderQuestions(page) {
  const questionList = document.getElementById('questionList');
  const start = (page - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  const questionsToShow = questions.slice(start, end);

  questionList.innerHTML = questionsToShow.map(q => `
    <div class="space-y-2">
      <p class="text-gray-700 mt-4">${q.question}</p>
      ${q.options.map(opt => `
        <div class="option-item flex items-center justify-between animate-fadeIn">
          <div>
            <p class="font-medium">${opt.text}</p>
            <p class="text-gray-600">${opt.correct ? "Đáp án đúng." : "Sai."}</p>
          </div>
        </div>
      `).join('')}
    </div>
  `).join('');
}

// Function to render pagination
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
      renderQuestions(currentPage);
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
      renderQuestions(currentPage);
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
      renderQuestions(currentPage);
      renderPagination();
    }
  });
  pagination.appendChild(nextButton);
}

// Initialize the page
renderQuestions(currentPage);
renderPagination();