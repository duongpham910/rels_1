var countdown = function() {
  $('#clock').countdown({ //clock là thẻ chứa bộ đếm đồng hồ
    until: $('#remaining_time').val(), //thời gian đếm
    format: 'HMS', //địn dạng thời gian
    onExpiry: function() {
      var button = document.getElementById('submit-time-out')
      button.click();
    }
  });
}
document.addEventListener('turbolinks:load', countdown);
$(document).on('page:update', countdown);
