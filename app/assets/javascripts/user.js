const userInfoLink = document.getElementById("user-info-link")
const userInfoTab = document.getElementById("user-info-tab")

const bookingLink = document.getElementById("bookings-link")
const bookingTab = document.getElementById("bookings-tab")

const trabisLink = document.getElementById("trabis-link")
const trabisTab = document.getElementById("trabis-tab")

userInfoLink.classList.add('active', 'bg-white');
userInfoTab.style.display = 'block';
bookingTab.style.display = 'none';
trabisTab.style.display = 'none';

console.log(userInfoLink);

userInfoLink.addEventListener("click", (event) => {
  userInfoTab.style.display = 'block';
  bookingTab.style.display = 'none';
  trabisTab.style.display = 'none';

  userInfoLink.classList.add('active', 'bg-white');
  bookingLink.classList.remove('active', 'bg-white');
  trabisLink.classList.remove('active', 'bg-white');
});

bookingLink.addEventListener("click", (event) => {
  userInfoTab.style.display = 'none';
  bookingTab.style.display = 'block';
  trabisTab.style.display = 'none';

  userInfoLink.classList.remove('active','bg-white');
  bookingLink.classList.add('active', 'bg-white');
  trabisLink.classList.remove('active', 'bg-white');
});

trabisLink.addEventListener("click", (event) => {
  userInfoTab.style.display = 'none';
  bookingTab.style.display = 'none';
  trabisTab.style.display = 'block';

  userInfoLink.classList.remove('active', 'bg-white');
  bookingLink.classList.remove('active', 'bg-white');
  trabisLink.classList.add('active', 'bg-white');
});


