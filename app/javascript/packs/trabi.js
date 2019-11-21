const dropZoneElement = document.getElementById("files-field");
const userForm = document.querySelector("#form-card form");
const inputTitle = document.getElementById("trabi_title");
const inputDescription = document.getElementById("trabi_description");
const inputYear = document.getElementById("trabi_year");
const inputColor = document.getElementById("trabi_color");
const inputUserId = document.getElementById("trabi_user_id");
const csfrToken = document.querySelector('[name="authenticity_token"]');

const dropZoneOnSuccess = (data,response) => {
  //alert("User info succesfuly updated");
  //window.location.reload();
};

const appendFormData = (formData) => {

  formData.append("utf8", "✓");
  formData.append("trabi[title]", inputTitle.value);
  formData.append("trabi[description]", inputDescription.value);
  formData.append("trabi[year]", inputYear.value);
  formData.append("trabi[color]", inputColor.value);
  formData.append("trabi[user_id]", inputUserId.value);
  formData.append("commit", "Submit");

  return formData;
};

Dropzone.options.filesField = {
  url: '/trabis',
  method: 'post',
  maxFiles: 10,
  parallelUploads: 10,
  maxFilesize: 5,
  addRemoveLinks: true,
  autoProcessQueue: false,
  headers: { "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3" },
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
      //formData.append("authenticity_token", csfrToken.value);
      //formData = appendFormData(formData);
      userForm.submit();
    });

    myDropzone.on("complete", function(file) {
      //myDropzone.removeFile(file);
    });
  },
  successmultiple: dropZoneOnSuccess
};
