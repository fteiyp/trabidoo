const userInfoLink = document.getElementById("user-info-link")
const userInfoTab = document.getElementById("user-info-tab")

const bookingLink = document.getElementById("bookings-link")
const bookingTab = document.getElementById("bookings-tab")

const trabisLink = document.getElementById("trabis-link")
const trabisTab = document.getElementById("trabis-tab")

const dropZoneElement = document.getElementById("files-field");
const userForm = document.querySelector("#user-info-tab form");//document.getElementById('user-form');
const inputFirstName = document.getElementById("input-first-name");
const inputLastName = document.getElementById("input-last-name");
const inputEmail = document.getElementById("input-email");
const inputPhone = document.getElementById("input-phone");
const inputStreet = document.getElementById("input-street");
const inputCity = document.getElementById("input-city");
const inputZip = document.getElementById("input-zip");
const inputCountry = document.getElementById("input-country");

// Dropzone.autoDiscover = false;

console.log(inputFirstName);
console.log(inputLastName);
console.log(inputEmail);
console.log(inputPhone);
console.log(inputStreet);
console.log(inputCity);
console.log(inputZip);
console.log(inputCountry);

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


// $(function() {

// document.addEventListener("DOMContentLoaded", function() {
  Dropzone.options.filesField = {
    url: (window.location.pathname),
    method: 'put',
    maxFiles: 1,
    parallelUploads: 1,
    maxFilesize: 2,
    addRemoveLinks: true,
    autoProcessQueue: false,
    uploadMultiple: true,
    accept: function(file, done) {
      //dropZoneElement.style.height = "auto";
      // $("div#files-field").css({"height": "auto"});
      done();
    },
    init: function() {
      const myDropzone = this;

      userForm.addEventListener('submit', function(event) {

        if(myDropzone.getQueuedFiles().length > 0){
          event.preventDefault();
          event.stopPropagation();
          myDropzone.processQueue();
        }
        else
        {
          const formData = new FormData(userForm);
          formData.append("first_name", inputFirstName.value);
          formData.append("last_name", inputLastName.value);
          formData.append("email", inputEmail.value);
          formData.append("phone_number", inputPhone.value);
          formData.append("street_address", inputStreet.value);
          formData.append("city_address", inputCity.value);
          formData.append("zip_address", inputZip.value);
          formData.append("country_address", inputCountry.value);

          let response = fetch(window.location.pathname, {
            method: 'PUT',
            body: formData
          });

          alert("User info succesfuly updated");

        }
      });

      myDropzone.on("sendingmultiple", function(file, xhr, formData) {
        formData.append("first_name", inputFirstName.value);
        formData.append("last_name", inputLastName.value);
        formData.append("email", inputEmail.value);
        formData.append("phone_number", inputPhone.value);
        formData.append("street_address", inputStreet.value);
        formData.append("city_address", inputCity.value);
        formData.append("zip_address", inputZip.value);
        formData.append("country_address", inputCountry.value);
      });

      myDropzone.on("complete", function(file) {
        myDropzone.removeFile(file);
      });
    },
    successmultiple: function(data,response) {
      alert("User info succesfuly updated");
      window.location.reload();
    }
  };
// });



