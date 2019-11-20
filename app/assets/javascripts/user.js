const userInfoLink = document.getElementById("user-info-link")
const userInfoTab = document.getElementById("user-info-tab")

const bookingLink = document.getElementById("bookings-link")
const bookingTab = document.getElementById("bookings-tab")

const trabisLink = document.getElementById("trabis-link")
const trabisTab = document.getElementById("trabis-tab")

const dropZoneElement = document.getElementById("files-field");
const userForm = document.querySelector("#user-info-tab form");//document.getElementById('user-form');
const inputFirstName = document.getElementById("user_first_name");
const inputLastName = document.getElementById("user_last_name");
const inputEmail = document.getElementById("user_email");
const inputPhone = document.getElementById("user_phone_number");
const inputStreet = document.getElementById("user_street_address");
const inputCity = document.getElementById("user_city_address");
const inputZip = document.getElementById("user_zip_address");
const inputCountry = document.getElementById("user_country_address");
const csfrToken = document.querySelector('[name="authenticity_token"]');

console.log(csfrToken);

userInfoLink.classList.add('active', 'bg-white');
userInfoTab.style.display = 'block';
bookingTab.style.display = 'none';
trabisTab.style.display = 'none';

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

const dropZoneOnSuccess = (data,response) => {
  alert("User info succesfuly updated");
  window.location.reload();
};

const appendFormData = (formData) => {

  formData.append("user[first_name]", inputFirstName.value);
  formData.append("user[last_name]", inputLastName.value);
  formData.append("user[email]", inputEmail.value);
  formData.append("user[phone_number]", inputPhone.value);
  formData.append("user[street_address]", inputStreet.value);
  formData.append("user[city_address]", inputCity.value);
  formData.append("user[zip_address]", inputZip.value);
  formData.append("user[country_address]", inputCountry.value);

  return formData;
};

Dropzone.options.filesField = {
  url: (window.location.pathname),
  method: 'put',
  maxFiles: 1,
  parallelUploads: 1,
  maxFilesize: 2,
  addRemoveLinks: true,
  autoProcessQueue: false,
  headers: { 'X-CSRF-Token': csfrToken.value },
  uploadMultiple: true,
  accept: function(file, done) { done() },
  init: function() {
    const myDropzone = this;

    console.log(myDropzone);

    userForm.addEventListener('submit', function(event) {
      if(myDropzone.getQueuedFiles().length > 0){
        event.preventDefault();
        event.stopPropagation();
        myDropzone.processQueue();
      }
    });

    myDropzone.on("sendingmultiple", function(file, xhr, formData) {
      formData.append("authenticity_token", csfrToken.value);
      formData = appendFormData(formData);
    });

    myDropzone.on("complete", function(file) {
      myDropzone.removeFile(file);
    });
  },
  successmultiple: dropZoneOnSuccess
};


