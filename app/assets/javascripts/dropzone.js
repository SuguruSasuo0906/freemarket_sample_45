$(function() {
  Dropzone.autoDiscover = false;

  $("#image-dropzone").dropzone({
    maxFilesize: 1,
    addRemoveLinks: true,
    dictRemoveFile: "削除",
    paramName: "image[image_url]",
    success: function(file, response) {
      $(file.previewElement)
        .find(".dz-remove")
        .attr("id", response.ImageId);
      $(file.previewElement).addClass("dz-success");
      console.log("OK");
    },
    removedfile: function(file) {
      var id = $(file.previewTemplate)
        .find(".dz-remove")
        .attr("id");
      $.ajax({
        type: "DELETE",
        url: "/" + locale + "/admin/images/" + id,
        success: function(data) {
          console.log("data.message");
        }
      });

      var previewElement;
      return (previewElement = file.previewElement) != null
        ? previewElement.parentNode.removeChild(file.previewElement)
        : void 0;
    }
  });
});
