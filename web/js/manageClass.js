  const classes = [
      {
        id: 1,
        name: "Lớp Toán Cao Cấp A1",
        time: "08:00 - 10:00",
        days: "Thứ 2, Thứ 4",
        sessions: 20,
        studentsCount: 30,
        course: "Toán Cao Cấp",
        students: [
          {
            id: 1,
            name: "Nguyễn Văn A",
            email: "nguyenvana@example.com",
            progress: 75,
            tests: [
              { testName: "Test 1", submission: "Bài làm Test 1" },
              { testName: "Test 2", submission: "Bài làm Test 2" },
            ],
            grades: [],
          },
          {
            id: 2,
            name: "Trần Thị B",
            email: "tranthib@example.com",
            progress: 60,
            tests: [
              { testName: "Test 1", submission: "Bài làm Test 1" },
              { testName: "Test 2", submission: "Bài làm Test 2" },
            ],
            grades: [],
          },
        ],
      },
      {
        id: 2,
        name: "Lớp Lập Trình Python B2",
        time: "14:00 - 16:00",
        days: "Thứ 3, Thứ 5",
        sessions: 15,
        studentsCount: 25,
        course: "Lập Trình Python",
        students: [
          {
            id: 3,
            name: "Lê Văn C",
            email: "levanc@example.com",
            progress: 85,
            tests: [
              { testName: "Test 1", submission: "Bài làm Test 1" },
              { testName: "Test 2", submission: "Bài làm Test 2" },
            ],
            grades: [],
          },
        ],
      },
    ];

    let selectedClass = null;

    // Render classes table
    function renderClasses(data) {
      const tbody = document.getElementById("classTableBody");
      tbody.innerHTML = "";

      data.forEach((item) => {
        const row = document.createElement("tr");
        row.className = "section-card";
        row.innerHTML = `
            <td>${item.name}</td>
            <td>${item.time}</td>
            <td>${item.days}</td>
            <td>${item.sessions}</td>
            <td>${item.studentsCount}</td>
            <td>${item.course}</td>
            <td>
              <button class="btn btn-sm btn-accent" onclick="showStudentView(${item.id})">
                <i class="fas fa-eye"></i> Xem Chi Tiết
              </button>
            </td>
          `;
        tbody.appendChild(row);
      });
    }

    // Search functionality
    document.getElementById("searchInput").addEventListener("input", (e) => {
      const searchTerm = e.target.value.toLowerCase();
      const filteredClasses = classes.filter(
        (c) =>
          c.name.toLowerCase().includes(searchTerm) ||
          c.course.toLowerCase().includes(searchTerm) ||
          c.days.toLowerCase().includes(searchTerm)
      );
      renderClasses(filteredClasses);
    });

    // Show student view
    function showStudentView(classId) {
      selectedClass = classes.find((c) => c.id === classId);
      document.getElementById("classView").style.display = "none";
      document.getElementById("studentView").style.display = "block";
      document.getElementById("selectedClassName").textContent = selectedClass.name;

      const tbody = document.getElementById("studentTableBody");
      tbody.innerHTML = "";

      selectedClass.students.forEach((student) => {
        const row = document.createElement("tr");
        row.className = "section-card";
        row.innerHTML = `
            <td>${student.name}</td>
            <td>${student.email}</td>
            <td>
              <div class="progress-bar">
                <div class="progress" style="width: ${student.progress}%"></div>
              </div>
            </td>
            <td>
              <button class="btn btn-sm btn-accent" data-bs-toggle="modal" data-bs-target="#studentDetailsModal" onclick="showStudentSubmissions(${student.id})">
                <i class="fas fa-eye"></i> Xem Bài Làm
              </button>
            </td>
            <td>
              <button class="btn btn-sm btn-accent" onclick="sendMessage(${student.id}, '${student.email}')">
                <i class="fas fa-envelope"></i> Nhắn Tin
              </button>
            </td>
          `;
        tbody.appendChild(row);
      });
    }

    // Show class view
    function showClassView() {
      document.getElementById("studentView").style.display = "none";
      document.getElementById("classView").style.display = "block";
      selectedClass = null;
      renderClasses(classes);
    }

    // Show student submissions
    function showStudentSubmissions(studentId) {
      const student = selectedClass.students.find((s) => s.id === studentId);
      document.getElementById("studentName").textContent = student.name;
      document.getElementById("studentEmail").textContent = `Email: ${student.email}`;
      document.getElementById("studentProgress").style.width = `${student.progress}%`;
      document.getElementById("progressText").textContent = `Hoàn thành: ${student.progress}%`;

      const testSubmissions = document.getElementById("testSubmissions");
      testSubmissions.innerHTML = "";
      student.tests.forEach((test) => {
        const li = document.createElement("li");
        li.textContent = `${test.testName}: ${test.submission}`;
        testSubmissions.appendChild(li);
      });
    }

    // Send message (placeholder function)
    function sendMessage(studentId, email) {
      alert(`Gửi tin nhắn đến ${email} (Student ID: ${studentId}). Vui lòng tích hợp logic nhắn tin thực tế tại đây!`);
    }

    // Initial render
    renderClasses(classes);