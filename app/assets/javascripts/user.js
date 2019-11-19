const userInfoLink = document.getElementById("user-info-link")
const userInfoTab = document.getElementById("user-info-tab")

const bookingLink = document.getElementById("bookings-link")
const bookingTab = document.getElementById("bookings-tab")

const trabisLink = document.getElementById("trabis-link")
const trabisTab = document.getElementById("trabis-tab")

const dropZoneElement = document.getElementById("files-field");
const userForm = document.getElementById('user-form');
const inputFirstName = document.getElementById("input-first-name");
const inputLastName = document.getElementById("input-last-name");
const inputEmail = document.getElementById("input-email");
const inputPhone = document.getElementById("input-phone");

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






// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// $(function() {
  // document.addEventListener("DOMContentLoaded", function() {


  // var myDropzone = new Dropzone("div#my-created-dropzone", { url: "/file/post"});

  // "myConfiguredDropzone" is the camelized version of the HTML element's ID
  // Dropzone.options.myConfiguredDropzone = {
  //   url: "/file/post"
  // };

  // Dropzone.options.myPrettifiedDropzone = {
  //   url: "/file/post",
  //   addRemoveLinks: true,
  //   accept: function(file, done) {
  //     $("div#my-prettified-dropzone").css({"height": "auto"});
  //     done();
  //   }
  // };

  // Dropzone.options.filesField = {
  //   url: "/user",
  //   maxFiles: 1,
  //   parallelUploads: 1,
  //   maxFilesize: 2,
  //   addRemoveLinks: true,
  //   autoProcessQueue: false,
  //   uploadMultiple: true,
  //   accept: function(file, done) {
  //     dropZoneElement.style.height = "auto";
  //     // $("div#files-field").css({"height": "auto"});
  //     done();
  //   },
  //   init: function() {
  //     const myDropzone = this;

  //     userForm.addEventListener('submit', function(event) {
  //       if(myDropzone.getQueuedFiles().length > 0){
  //         event.preventDefault();
  //         event.stopPropagation();
  //         myDropzone.processQueue();
  //       }
  //     });

  //     myDropzone.on("sendingmultiple", function(file, xhr, formData) {
  //       formData.append("first_name", inputFirstName.value);
  //       formData.append("last_name", inputLastName.value);
  //       formData.append("email", inputEmail.value);
  //       formData.append("phone_number", inputPhone.value);
  //     });
  //   },
  //   successmultiple: function(data,response) {
  //     alert(response);
  //   }
  // };
// });



