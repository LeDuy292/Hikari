const lessons = [
  {
    id: 0,
    title: "Bài 0: Nhập môn",
    completed: true,
    subtopics: [
      { title: "Nhập môn", videoUrl: "https://www.youtube.com/embed/dQw4w9WgXcQ", views: "58453 lượt xem" }
    ]
  },
  {
    id: 1,
    title: "Bài 1: Giới thiệu về tên, tuổi, quê quán, nghề nghiệp",
    completed: false,
    subtopics: [
      { title: "Từ vựng Bài 1", videoUrl: "https://www.youtube.com/embed/dQw4w9WgXcQ", views: "58453 lượt xem" },
      { title: "Ngữ pháp Bài 1", videoUrl: "https://www.youtube.com/embed/anotherVideoID1", views: "45000 lượt xem" },
      { title: "Hội thoại Bài 1", videoUrl: "https://www.youtube.com/embed/anotherVideoID2", views: "42000 lượt xem" },
      { title: "Nghe hiểu Bài 1", videoUrl: "https://www.youtube.com/embed/anotherVideoID3", views: "40000 lượt xem" },
      { title: "Đọc hiểu Bài 1", videoUrl: "https://www.youtube.com/embed/anotherVideoID4", views: "38000 lượt xem" }
    ]
  },
  {
    id: 2,
    title: "Bài 2: Giới thiệu về đồ vật",
    completed: false,
    subtopics: [
      { title: "Từ vựng Bài 2", videoUrl: "https://www.youtube.com/embed/yetAnotherVideoID1", views: "32100 lượt xem" },
      { title: "Ngữ pháp Bài 2", videoUrl: "https://www.youtube.com/embed/yetAnotherVideoID2", views: "30000 lượt xem" },
      { title: "Hội thoại Bài 2", videoUrl: "https://www.youtube.com/embed/yetAnotherVideoID3", views: "28000 lượt xem" },
      { title: "Nghe hiểu Bài 2", videoUrl: "https://www.youtube.com/embed/yetAnotherVideoID4", views: "26000 lượt xem" },
      { title: "Đọc hiểu Bài 2", videoUrl: "https://www.youtube.com/embed/yetAnotherVideoID5", views: "24000 lượt xem" }
    ]
  }
];

const exercises = {
  1: {
    title: "Bài 1: Từ vựng",
    questions: [
      {
        text: "Từ '名前' (namae) có nghĩa là gì?",
        options: ["Tên", "Tuổi", "Nhà", "Công việc"],
        correct: "Tên"
      },
      {
        text: "Từ '仕事' (shigoto) có nghĩa là gì?",
        options: ["Quê quán", "Nghề nghiệp", "Đồ vật", "Địa điểm"],
        correct: "Nghề nghiệp"
      }
    ]
  },
  2: {
    title: "Bài 2: Từ vựng",
    questions: [
      {
        text: "Từ '本' (hon) có nghĩa là gì?",
        options: ["Bàn", "Sách", "Ghế", "Cốc"],
        correct: "Sách"
      },
      {
        text: "Từ '椅子' (isu) có nghĩa là gì?",
        options: ["Bút", "Ghế", "Cửa", "Bàn"],
        correct: "Ghế"
      }
    ]
  }
};

let currentLessonId = 1;
let currentSubtopicIndex = 0;
let currentExerciseId = 1;

const lessonList = document.getElementById('lessonList');
const lessonTitle = document.getElementById('lessonTitle');
const lessonVideo = document.getElementById('lessonVideo');
const lessonNav = document.getElementById('lessonNav');
const exerciseSection = document.getElementById('exerciseSection');
const exerciseTitle = document.getElementById('exerciseTitle');
const exerciseContent = document.getElementById('exerciseContent');

function renderLessonList() {
  lessonList.innerHTML = lessons.map(lesson => `
    <div>
      <div class="lesson-header lesson-item flex items-center justify-between p-3 rounded-lg cursor-pointer ${lesson.completed ? 'completed' : ''}" data-lesson-id="${lesson.id}">
        <span class="text-gray-700">${lesson.title}</span>
        <div class="flex items-center gap-2">
          ${lesson.completed ? '<i class="fa fa-check-circle text-orange-500"></i>' : '<i class="fa fa-circle text-gray-300"></i>'}
          <i class="fa fa-chevron-right text-orange-500"></i>
        </div>
      </div>
      <div class="subtopic-list space-y-1 mt-1" id="subtopic-list-${lesson.id}">
        ${lesson.subtopics.map((subtopic, index) => `
          <div class="subtopic-item flex items-center justify-between p-2 rounded-lg cursor-pointer ${currentLessonId === lesson.id && currentSubtopicIndex === index ? 'active' : ''}" data-lesson-id="${lesson.id}" data-subtopic-index="${index}">
            <span class="text-gray-600">${subtopic.title}</span>
            ${lesson.completed ? '<i class="fa fa-check-circle text-orange-500"></i>' : '<i class="fa fa-circle text-gray-300"></i>'}
          </div>
        `).join('')}
      </div>
    </div>
  `).join('');

  document.querySelectorAll('.lesson-header').forEach(header => {
    header.addEventListener('click', () => {
      const lessonId = parseInt(header.dataset.lessonId);
      const subtopicList = document.getElementById(`subtopic-list-${lessonId}`);
      const isActive = subtopicList.classList.contains('active');

      document.querySelectorAll('.subtopic-list').forEach(list => {
        list.classList.remove('active');
        list.previousElementSibling.classList.remove('active');
        list.previousElementSibling.querySelector('.fa-chevron-right').classList.remove('active');
      });

      if (!isActive) {
        subtopicList.classList.add('active');
        header.classList.add('active');
        header.querySelector('.fa-chevron-right').classList.add('active');
      }
    });
  });

  document.querySelectorAll('.subtopic-item').forEach(item => {
    item.addEventListener('click', () => {
      currentLessonId = parseInt(item.dataset.lessonId);
      currentSubtopicIndex = parseInt(item.dataset.subtopicIndex);
      updateLessonContent();
      exerciseSection.classList.remove('visible');
      document.querySelectorAll('.subtopic-item').forEach(i => i.classList.remove('active'));
      item.classList.add('active');
    });
  });
}

function updateLessonContent() {
  const currentLesson = lessons.find(lesson => lesson.id === currentLessonId);
  const currentSubtopic = currentLesson.subtopics[currentSubtopicIndex];
  lessonTitle.textContent = currentSubtopic.title;
  lessonVideo.src = currentSubtopic.videoUrl;
  lessonTitle.nextElementSibling.textContent = currentSubtopic.views;

  document.querySelectorAll('.lesson-nav-button').forEach(button => {
    const lessonNum = parseInt(button.dataset.lesson);
    button.classList.toggle('bg-blue-500', lessonNum !== currentLessonId + 1);
    button.classList.toggle('bg-orange-500', lessonNum === currentLessonId + 1);
  });
}

function renderExercise(lessonId) {
  const exercise = exercises[lessonId];
  if (!exercise) {
    exerciseTitle.textContent = '';
    exerciseContent.innerHTML = '';
    exerciseSection.classList.remove('visible');
    return;
  }

  currentExerciseId = lessonId;
  exerciseTitle.textContent = exercise.title;
  exerciseContent.innerHTML = exercise.questions.map((q, index) => `
    <div class="space-y-2">
      <p class="text-gray-700">${q.text}</p>
      ${q.options.map(option => `
        <button class="exercise-option w-full text-left p-2 rounded-lg flex justify-between items-center" data-question="${index}" data-option="${option}" data-correct="${q.correct}">
          ${option}
          <i class="fa fa-check hidden"></i>
        </button>
      `).join('')}
    </div>
  `).join('');

  exerciseSection.classList.add('visible');

  document.querySelectorAll('.exercise-option').forEach(button => {
    button.addEventListener('click', () => {
      const isCorrect = button.dataset.option === button.dataset.correct;
      button.classList.remove('correct', 'wrong');
      button.classList.add(isCorrect ? 'correct' : 'wrong');
      button.querySelector('i').classList.toggle('hidden', !isCorrect);
      document.querySelectorAll(`.exercise-option[data-question="${button.dataset.question}"]`).forEach(b => b.disabled = true);
      setTimeout(() => {
        document.querySelectorAll(`.exercise-option[data-question="${button.dataset.question}"]`).forEach(b => {
          b.classList.remove('correct', 'wrong');
          b.querySelector('i').classList.add('hidden');
          b.disabled = false;
        });
      }, 2000);
    });
  });
}

lessonNav.addEventListener('click', e => {
  const button = e.target.closest('.lesson-nav-button');
  if (button) {
    const lessonNum = parseInt(button.dataset.lesson);
    if (lessonNum <= lessons.length - 1) {
      currentLessonId = lessonNum - 1;
      currentSubtopicIndex = 0;
      updateLessonContent();
      renderExercise(lessonNum);
      document.querySelectorAll('.lesson-nav-button').forEach(b => {
        b.classList.toggle('bg-blue-500', parseInt(b.dataset.lesson) !== currentLessonId + 1);
        b.classList.toggle('bg-orange-500', parseInt(b.dataset.lesson) === currentLessonId + 1);
      });
      renderLessonList();
    }
  }
});

renderLessonList();
updateLessonContent();