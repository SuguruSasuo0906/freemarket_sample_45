document.addEventListener("DOMContentLoaded", function () {

  const image__howmany = document.querySelector('.image__howmany');

  function buildImage(loadedImageUri) {
    var html =
      `<div class="image__preview">
        <img class="image-size" src=${loadedImageUri}>
          <div class="image__preview_area-wrap" >
            <div>
              <a class="image__preview_area-delete" > 削除 </a>
            </div> 
          </div >
      </div>`
    return html
  };
  // 画像を入れる配列
  var files_array = [];
  //
  $('#image__drop_area').on('dragover', function (e) {
    e.preventDefault();
  });
  //画像をドロップした時の処理
  $('#image__drop_area').on('drop', function (event) {
    event.preventDefault();
    files = event.originalEvent.dataTransfer.files;
    for (var i = 0; i < files.length; i++) {
      files_array.push(files[i]);
      var fileReader = new FileReader();
      fileReader.onload = function (event) {
        var loadedImageUri = event.target.result;
        $(buildImage(loadedImageUri)).appendTo(".image__preview_area").trigger("create");
      };
      fileReader.readAsDataURL(files[i]);
    }
    image__howmany.style.display = 'none';
  });
  //
  //プレビューエリアがクリックされた時
  const image__drop_area = document.querySelector('#image__drop_area');
  image__drop_area.addEventListener('click', function () {
    imagefile.click();
  });
  document.getElementById("imagefile").addEventListener("change", function () {
    var fileList = this.files;
    for (var i = 0, l = fileList.length; l > i; i++) {
      var fileReader = new FileReader();
      fileReader.onload = function (event) {
        var loadedImageUri = event.target.result;
        $(buildImage(loadedImageUri)).appendTo(".image__preview_area").trigger("create");
      }
      fileReader.readAsDataURL(fileList[i]);
      image__howmany.style.display = 'none';
    }
  });
  //
  //プレビューからの削除
  $(document).on('click', '.image__preview_area a', function () {
    var index = $(".image__preview_area a").index(this);
    files_array.splice(index - 1, 1);
    $(this).parent().parent().parent().remove();
    const image__howmany = document.querySelector('.image__howmany');
    image__howmany.style.display = 'block';
  });
  //
  //submitが押された際のイベント
  $('#new-item').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    files_array.forEach(function (file) {
      formData.append("image[image][]", file)
    });
    $.ajax({
      url: '/items',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
    })
      .done(function (data) {
        alert('出品に成功しました');
      })
      .fall(function (XMLHttpRequest, textStatus, errorThrown) {
        alert('出品に失敗しました');
      });
  });
});