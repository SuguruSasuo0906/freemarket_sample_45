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
  //カテゴリーの選択
  //カテゴリーの子カテゴリー
  function appendCategory1(sub_category) {
    var html = `<option value = '${sub_category.id}'> ${sub_category.name} </option>`
    $("#selectitem1").append(html);
  }

  $("#selectitem").change(function () {
    $('#selectitem1 option').remove();
    var item = $("#selectitem").val();

    if ($(this).val() !== "") {
      $("#selectitem1").show();
      if ($("#selectitem2").show()) {
        $("#selectitem2").hide()
        $("#selectsize").hide();
      }
    }
    else {
      $("#selectitem1").hide();
      $("#selectitem2").hide();
      $("#selectitem1").val("");
      $("#selectitem2").val("");
    }

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: { category_id: item },
      dataType: 'json'
    })
      .done(function (sub_categories) {
        sub_categories.forEach(function (sub_category) {
          appendCategory1(sub_category);
        });
      })
  })
  //子カテゴリーの孫カテゴリー
  function appendCategory2(sub_category) {
    var html = `<option value = '${sub_category.id}'> ${sub_category.name} </option>`
    $("#selectitem2").append(html);
  }

  $("#selectitem1").change(function () {
    $('#selectitem2 option').remove();
    var item = $("#selectitem1").val();

    if ($(this).val() !== "") {
      $("#selectitem2").show();
      $("#selectbrand").show();
      if (item <= 62)
        $("#selectsize").show();
    }
    else {
      $("#selectitem2").hide();
      $("#selectitem2").val("");
    }

    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: { category_id: item },
      dataType: 'json'
    })
      .done(function (sub_categories) {
        sub_categories.forEach(function (sub_category) {
          appendCategory2(sub_category);
        });
      })
  })
  //
  //配送の出現
  $("#item_feewho").change(function () {

    if ($(this).val() !== "") {
      $("#selecthow").show();
    } else {
      $("#selecthow").hide();
      $("#selecthow").val("");
    }
  })
  //
  //価格に数値が入力された時の計算
  $('.item_price').on('keyup', function () {
    var price = $('#item_price').val();
    var result10 = price * 0.1;
    var result10 = Math.floor(result10);
    var result90 = price - result10;
    if (price >= 300 && price <= 9999999) {
      $('#kakaku-text-10').text("¥" + result10);
      $('#kakaku-text-90').text("¥" + result90);
    } else {
      $('#kakaku-text-10').text("-");
      $('#kakaku-text-90').text("-");
    }
  });
  //
  //submitが押された際のイベント
  $('#new-item').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    files_array.forEach(function (file) {
      formData.append("images[name][]", file)
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
  });
});