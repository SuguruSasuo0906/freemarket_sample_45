$(document).on('turbolinks:load', function () {
  $(function () {

    function buildHTML(message) {
      var html =
        `<li class="show-comments__wrap__message-box">
        <div class="show-comments__wrap__message-box-wrap">
          <div class="show-comments__wrap__message-box-wrap__user">
          </div>
          <div class="show-comments__wrap__message-box-wrap__comments">
            <div class="show-comments__wrap__message-box-wrap__comments-user">
              ${message.user_name}
            </div>
            <div class="show-comments__wrap__message-box-wrap__comments-text">
              ${message.comment}
              <div class="show-comments__wrap__message-box-wrap__comments-text-o">
                <div class="show-comments__wrap__message-box-wrap__comments-text-o-time">
                  <icon class="fa fa-clock-o">
                  </icon>
                  <span>
                    ${message.created_at}
                  </span>
                </div>
                <div class="show-comments__wrap__message-box-wrap__comments-text-o-flag">
                  <icon class="fa fa-flag-o">
                  </icon>
                </div>
              </div>
            </div>
            <icon class="fa fa-comment">
            </icon>
          </div>
        </div>
      </li>`
      return html;
    }

    function scroll() {
      $('.show-comments__wrap__message').animate({ scrollTop: $('.show-comments__wrap__message')[0].scrollHeight }, 'fast');
    }

    $('#new_message').on('submit', function (e) {
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      console.log(formData);
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })

        .done(function (data) {
          var html = buildHTML(data)
          $('.show-comments__wrap__message').append(html)
          scroll();
          $('.show-comments__wrap__btn').prop('disabled', false)
          $('.show-comments__wrap__box').val('')
          return false;
        })

        .fail(function () {
          alert('error')
          $('.form__submit').attr('disabled', false)
        })
    })


  });
});
