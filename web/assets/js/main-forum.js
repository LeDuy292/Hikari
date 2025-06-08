
      // Dropdown account menu
      function toggleDropdown(e) {
        e.stopPropagation();
        const dropdown = document.getElementById("accountDropdown");
        dropdown.classList.toggle("open");
      }

      document.body.addEventListener("click", function () {
        document.getElementById("accountDropdown").classList.remove("open");
      });

      // Create Post Modal
      function openPostModal() {
        document.getElementById("createPostModal").classList.add("active");
      }

      function closePostModal() {
        document.getElementById("createPostModal").classList.remove("active");
      }

      // Image preview function
      function previewImage(event) {
        const file = event.target.files[0];
        const preview = document.getElementById("imagePreview");

        if (file) {
          const reader = new FileReader();
          reader.onload = function (e) {
            preview.src = e.target.result;
            preview.style.display = "block";
          };
          reader.readAsDataURL(file);
        }
      }

      function createPost() {
        const form = document.getElementById("createPostForm");
        const title = document.getElementById("postTitle").value;
        const category = document.getElementById("postCategory").value;
        const content = document.getElementById("postContent").value;

        if (!title || !category || !content) {
          alert("Vui lòng điền đầy đủ thông tin bài viết!");
          return;
        }

        form.submit();
      }

      // Filter and Sort
      function handleSortChange() {
        const sortValue = document.getElementById("sortSelect").value;
        console.log("Sắp xếp theo:", sortValue);
        // Thêm logic sắp xếp bài viết ở đây
      }

      function handleFilterChange() {
        const filterValue = document.getElementById("filterSelect").value;
        console.log("Lọc theo:", filterValue);
        // Thêm logic lọc bài viết ở đây
      }

      // Topic Filter
      function filterPostsByTopic(topic) {
        const posts = document.querySelectorAll(".post-card");
        const topicLinks = document.querySelectorAll(".topic-list a");

        // Remove active class from all topic links
        topicLinks.forEach((link) => link.classList.remove("active"));

        // Add active class to the clicked topic
        const activeLink = document.querySelector(
          `.topic-list a[data-filter="${topic}"]`
        );
        if (activeLink) {
          activeLink.classList.add("active");
        }

        // Show/hide posts based on the selected topic
        posts.forEach((post) => {
          const tags = post.getAttribute("data-tags").split(",");
          if (topic === "all" || tags.includes(topic)) {
            post.style.display = "flex";
          } else {
            post.style.display = "none";
          }
        });
      }

      // Add click event listeners to topic links
      document.querySelectorAll(".topic-list a").forEach((link) => {
        link.addEventListener("click", (e) => {
          e.preventDefault();
          const topic = link.getAttribute("data-filter");
          filterPostsByTopic(topic);
        });
      });

      // Close modal when clicking outside
      document
        .getElementById("createPostModal")
        .addEventListener("click", function (e) {
          if (e.target === this) {
            closePostModal();
          }
        });

      // Mobile menu toggle
      function toggleMobileMenu() {
        document.querySelector(".sidebar-left").classList.toggle("active");
      }

      // Initialize with "all" filter
      filterPostsByTopic("all");
