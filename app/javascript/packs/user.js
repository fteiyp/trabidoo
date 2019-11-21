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
const inputStreet = document.getElementById("input-street");
const inputCity = document.getElementById("input-city");
const inputZip = document.getElementById("input-zip");
const inputCountry = document.getElementById("input-country");
const bookingReviewBoxes = document.querySelectorAll('[id$="-booking-review-box"]');
const bookingReviewButtons = document.querySelectorAll('[id$="-booking-review-button"]');
const bookingCloseReviewButtons = document.querySelectorAll('[id$="-booking-review-cl-button"]');
const bookingRatingBoxes = document.querySelectorAll('[id$="-booking-rating-box"]');
const bookingRatingButtons = document.querySelectorAll('[id$="-booking-rating-button"]');
const bookingCloseRatingButtons = document.querySelectorAll('[id$="-booking-rating-cl-button"]');

//Run this only on users page
if (userInfoLink !== null && inputFirstName !== null) {

  console.log(bookingRatingBoxes);
  console.log(bookingRatingButtons);
  console.log(bookingCloseRatingButtons);

  for (let i = 0; i < bookingRatingBoxes.length; i += 1)
  {
    bookingRatingBoxes[i].style.display = 'none';
  }

  const ratingButtonClicked = (event) => {
    console.log("clicked");
    for (let i = 0; i < bookingRatingBoxes.length; i += 1)
    {
      console.log(bookingRatingBoxes[i].id[0]);
      console.log(event.target.id[0]);
      if (bookingRatingBoxes[i].id[0] == event.target.id[0])
      {
        bookingRatingBoxes[i].style.display = 'block';
      }
    }
  }

  const ratingCloseButtonClicked = (event) => {
    console.log("clicked");
    for (let i = 0; i < bookingRatingBoxes.length; i += 1)
    {
      if (bookingRatingBoxes[i].id[0] == event.target.id[0])
      {
        bookingRatingBoxes[i].style.display = 'none';
        //switchTab('bookings-link');
      }
    }
  }

  for (let i = 0; i < bookingRatingBoxes.length; i += 1)
  {
    bookingRatingButtons[i].addEventListener("click", ratingButtonClicked);
    bookingCloseRatingButtons[i].addEventListener("click", ratingCloseButtonClicked);
  }




  for (let i = 0; i < bookingReviewBoxes.length; i += 1)
  {
    bookingReviewBoxes[i].style.display = 'none';
  }

  const reviewButtonClicked = (event) => {
    for (let i = 0; i < bookingReviewBoxes.length; i += 1)
    {
      if (bookingReviewBoxes[i].id[0] == event.target.id[0])
      {
        bookingReviewBoxes[i].style.display = 'block';
      }
    }
  }

  const reviewCloseButtonClicked = (event) => {
    for (let i = 0; i < bookingReviewBoxes.length; i += 1)
    {
      if (bookingReviewBoxes[i].id[0] == event.target.id[0])
      {
        bookingReviewBoxes[i].style.display = 'none';
        //switchTab('bookings-link');
      }
    }
  }

  for (let i = 0; i < bookingReviewButtons.length; i += 1)
  {
    bookingReviewButtons[i].addEventListener("click", reviewButtonClicked);
    bookingCloseReviewButtons[i].addEventListener("click", reviewCloseButtonClicked);
  }

  userInfoLink.classList.add('active', 'bg-white');
  userInfoTab.style.display = 'block';
  bookingTab.style.display = 'none';
  trabisTab.style.display = 'none';

  const switchTab = (tab) => {

    if (tab  === 'user-info-link') {
       console.log("Show first tab");
      userInfoTab.style.display = 'block';
      bookingTab.style.display = 'none';
      trabisTab.style.display = 'none';

      userInfoLink.classList.add('active', 'bg-white');
      bookingLink.classList.remove('active', 'bg-white');
      trabisLink.classList.remove('active', 'bg-white');
    } else if (tab  === 'bookings-link') {
      userInfoTab.style.display = 'none';
      bookingTab.style.display = 'block';
      trabisTab.style.display = 'none';

      userInfoLink.classList.remove('active','bg-white');
      bookingLink.classList.add('active', 'bg-white');
      trabisLink.classList.remove('active', 'bg-white');
    } else {
      userInfoTab.style.display = 'none';
      bookingTab.style.display = 'none';
      trabisTab.style.display = 'block';

      userInfoLink.classList.remove('active', 'bg-white');
      bookingLink.classList.remove('active', 'bg-white');
      trabisLink.classList.add('active', 'bg-white');
    }

  };

  let url = location.href

  const tabClicked = (event) => {
    let newUrl;

    switchTab(event.target.getAttribute("id"));
    const hash = event.target.getAttribute("href");
    let prefix = url.split("#")[0];

    if (prefix[prefix.length - 1] === "/") {
      prefix = prefix.substring(0, prefix.length - 1)
    }

    newUrl = prefix + hash;

    history.replaceState(null, null, newUrl);
  };

  userInfoLink.addEventListener("click", tabClicked);
  bookingLink.addEventListener("click", tabClicked);
  trabisLink.addEventListener("click", tabClicked);

  if (location.hash) {

    const hash = url.split("#");
    let tabLink =hash[1];

    if (tabLink[tabLink.length - 1] === "/") {
      tabLink = tabLink.substring(0, tabLink.length - 1)
    }

    switchTab(document.querySelector('#myTab a[href="#'+tabLink+'"]').getAttribute("id"));
    console.log(document.querySelector('#myTab a[href="#'+tabLink+'"]').getAttribute("id"));//.tab("show");
    url = location.href.replace(/\/#/, "#");
    history.replaceState(null, null, url);
    setTimeout(() => {
      window.scrollTo(0,0);
    }, 400);
  }

  const tab = document.querySelector('a[data-toggle="tab"]')

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

  }
// });



