// Tabs functionality
let currentTab = "info"

function showTab(tabName) {
  // Remove active class from all tabs
  const tabs = document.querySelectorAll(".tab-btn")
  tabs.forEach((tab) => {
    tab.classList.remove("active")
  })

  // Add active class to clicked tab
  event.target.classList.add("active")

  // Update current tab
  currentTab = tabName

  // Handle tab content switching
  switch (tabName) {
    case "info":
      showCourseInfo()
      break
    case "schedule":
      redirectToSchedule()
      break
    case "roadmap":
      redirectToRoadmap()
      break
    case "commitment":
      redirectToCommitment()
      break
    default:
      showCourseInfo()
  }
}

function showCourseInfo() {
  // Show course information content
  const courseContent = document.querySelector(".course-content")
  if (courseContent) {
    courseContent.style.display = "block"
    courseContent.style.opacity = "0"
    setTimeout(() => {
      courseContent.style.opacity = "1"
      courseContent.style.transition = "opacity 0.3s ease-in-out"
    }, 100)
  }
}

function redirectToSchedule() {
  // Redirect to schedule page
  window.location.href = "lichhoc.jsp"
}

function redirectToRoadmap() {
  // Redirect to roadmap page
  window.location.href = "loTrinhHocTap.jsp"
}

function redirectToCommitment() {
  // Redirect to commitment page
  window.location.href = "camKetKhoaHoc.jsp"
}

// Add keyboard navigation for tabs
document.addEventListener("keydown", (e) => {
  const tabs = document.querySelectorAll(".tab-btn")
  const activeTab = document.querySelector(".tab-btn.active")
  const currentIndex = Array.from(tabs).indexOf(activeTab)

  if (e.key === "ArrowLeft" && currentIndex > 0) {
    tabs[currentIndex - 1].click()
  } else if (e.key === "ArrowRight" && currentIndex < tabs.length - 1) {
    tabs[currentIndex + 1].click()
  }
})

// Add smooth transition effect for tab switching
function addTabTransition() {
  const tabs = document.querySelectorAll(".tab-btn")
  tabs.forEach((tab) => {
    tab.addEventListener("click", function () {
      // Add ripple effect
      const ripple = document.createElement("span")
      ripple.classList.add("ripple")
      this.appendChild(ripple)

      setTimeout(() => {
        ripple.remove()
      }, 600)
    })
  })
}

// Initialize tab functionality
document.addEventListener("DOMContentLoaded", () => {
  addTabTransition()
})
