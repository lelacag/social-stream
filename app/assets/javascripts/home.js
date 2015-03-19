$(document).on('click', '#create-user', function(event) {
  // event.preventDefault();
  $(this).remove();
  $('#user-input').show();
});

$(document).on('click', '#create-subscription', function(event) {
  $('#subscription-form').show();
});
