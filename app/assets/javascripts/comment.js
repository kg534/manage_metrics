$(function() {
  function buildHTML(comment){
    var html = `<div class="comment">
                  <div class="comment__owner">${comment.user_name}</div>
                  <div class="comment__separate">：</div>
                  <div class="comment__text">${comment.text}</div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments__list').append(html);
      $('.comment__text').val('');
      $('.comment__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})