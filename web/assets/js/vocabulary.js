document.addEventListener('DOMContentLoaded', () => {
  const startLearningBtn = document.getElementById('startLearningBtn');

  startLearningBtn.addEventListener('click', () => {
    // Chuyển hướng đến trang học (giả định là learnvideo.jsp)
    window.location.href = 'learnvideo.jsp?courseId=N5';
  });
});const vocabList = [
  { word: "わたし", meaning: "Tôi" },
  { word: "あなた", meaning: "Bạn" },
  { word: "彼", meaning: "Anh ấy" },
  { word: "彼女", meaning: "Cô ấy" },
  { word: "お母さん", meaning: "Mẹ" },
  { word: "お父さん", meaning: "Bố" },
  { word: "弟", meaning: "Em trai" },
  { word: "妹", meaning: "Em gái" },
  { word: "兄", meaning: "Anh trai" },
  { word: "姉", meaning: "Chị gái" },
  { word: "(わたしは）兄がいます", meaning: "Tôi có anh trai" },
  { word: "お姉さん", meaning: "Chị" },
];

const itemsPerPage = 10;
const totalItems = vocabList.length;
const totalPages = Math.ceil(totalItems / itemsPerPage);
let currentPage = 1;

const vocabTableBody = document.getElementById("vocabTableBody");
const pagination = document.getElementById("pagination");

function renderVocabItems(page) {
  vocabTableBody.innerHTML = "";
  const start = (page - 1) * itemsPerPage;
  const end = Math.min(start + itemsPerPage, totalItems);
  
  for (let i = start; i < end; i++) {
    const item = vocabList[i];
    const row = document.createElement("tr");
    row.className = "animate-slideIn";
    row.style.animationDelay = `${(i - start) * 0.1}s`;
    row.innerHTML = `<td>${item.word}</td><td>${item.meaning}</td>`;
    vocabTableBody.appendChild(row);
  }
}

function renderPagination() {
  pagination.innerHTML = "";

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

  // Next button or Practice button
  if (currentPage === totalPages) {
    const practiceButton = document.createElement("button");
   
   
    practiceButton.addEventListener("click", () => {
      window.location.href = "practice.jsp?documentId=1&lessonId=1";
    });
    pagination.appendChild(practiceButton);
  } else {
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
}

// Initial render
renderVocabItems(currentPage);
renderPagination();