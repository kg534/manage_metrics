$(function() {
  $(document).on('change',':checkbox',function(){
    console.log($(this).prop('checked'));
    $('#submit_btn').css('background-color', '#333333');
  });
})