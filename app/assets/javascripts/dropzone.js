$(function() {
  // disable auto discover
  Dropzone.autoDiscover = false;

  $(".dropzone").dropzone({
    maxFilesize: 1,
    addRemoveLinks: true
  });
});
