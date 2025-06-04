// Initialize animations
document.querySelectorAll('.animate-fadeIn').forEach(element => {
  element.style.opacity = '0';
  setTimeout(() => {
    element.style.opacity = '1';
  }, 300);
});

// Edit Profile Modal Logic
const editProfileBtn = document.getElementById('editProfileBtn');
const editProfileModal = document.getElementById('editProfileModal');
const cancelEditBtn = document.getElementById('cancelEditBtn');
const saveEditBtn = document.getElementById('saveEditBtn');

// Open modal
editProfileBtn.addEventListener('click', () => {
  editProfileModal.classList.remove('hidden');
});

// Close modal
cancelEditBtn.addEventListener('click', () => {
  editProfileModal.classList.add('hidden');
});

// Save changes
saveEditBtn.addEventListener('click', () => {
  const username = document.getElementById('editUsername').value;
  const fullName = document.getElementById('editFullName').value;
  const email = document.getElementById('editEmail').value;
  const phone = document.getElementById('editPhone').value;
  const address = document.getElementById('editAddress').value;
  const dob = document.getElementById('editDob').value;
  const gender = document.getElementById('editGender').value;

  // Update profile display
  document.getElementById('profileUsername').textContent = username;
  document.getElementById('profileFullName').textContent = fullName;
  document.getElementById('profileName').textContent = fullName;
  document.getElementById('profileEmail').textContent = email;
  document.getElementById('profilePhone').textContent = phone;
  document.getElementById('profileAddress').textContent = address;
  document.getElementById('profileDob').textContent = dob.split('-').reverse().join('/');
  document.getElementById('profileGender').textContent = gender;

  // Close modal
  editProfileModal.classList.add('hidden');
});