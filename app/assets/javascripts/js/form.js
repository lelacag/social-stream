$(document).ready(function() {

  $(document).on('ajax:beforeSend', 'form#new_user', function() {
    $('#form-errors').empty();
    return clearErrors();
  });

  $(document).on('ajax:success', 'form#new_user', function(data, status, xhr) {
    // $("#form-errors").html("<div class='success'>Post update success</div>");
    $('#sign-up-email').modal('toggle');
    // window.location.href =   "http://"+window.location.hostname;
    return clearErrors();
  });

  $(document).on('ajax:error', 'form#new_user', function(data, status, xhr) {
    // $("#form-errors").html("<div class='error'>Post update error</div>");
    return markFormErrors(status, false);
  });

  window.markFormErrors = function(status) {
    var errors_array, key, selector, _results;
    try {
      errors_array = JSON.parse(status.responseText);
      // errors_array = status.responseJSON.errors;
      console.log(errors_array);
      _results = [];
      for (key in errors_array) {
        selector = '[id$=' + key + ']';
        // key_name = key.replace('_', ' ');
        // console.log(key_name);
        if ($(selector).length > 0 && $(selector).data('errorOn') !== 0) {
          _results.push(markWithError(selector, key, errors_array[key]));
        } else {
          _results.push($('#form-errors').append("<div class='error'>" + "key" + ': ' + errors_array[key] + "</div>"));
        }
      }
      return _results;
    } catch (_error) {

    }
  };

  window.markWithError = function(field_selector, key, error) {
    key = key.replace('_', ' ');
    $(field_selector).after("<div class='formError'>" + key + " " + error + "</div>");
    $(field_selector).closest('.form-group').addClass('has-error');
    // row.find("label:first").wrap("<div class='field_with_errors'></div>");
    // return $(field_selector).wrap("<div class='field_with_errors'></div>");
  };

  window.clearErrors = function() {
    return $('input').each(function() {
      var row;
      row = $(this).parents('.field');
      row.find('.formError').remove();
      $(this).parent().removeClass('has-error');
      $('.formError').remove();
      return row.find('.field_with_errors').find('>input,>label').unwrap();
    });
  };
});
