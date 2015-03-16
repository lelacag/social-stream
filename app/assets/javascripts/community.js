$(document).ready(function() {

  $(document).on('ajax:beforeSend', 'form#new_community', function() {
    $('#form-errors').empty();
    return clearErrors();
  });

  $(document).on('ajax:success', 'form#new_community', function(data, status, xhr) {
    return clearErrors();
  });

  $(document).on('ajax:error', 'form#new_community', function(data, status, xhr) {
    return markFormErrors(status, false);
  });

  window.markFormErrors = function(status) {
    var errors_array, key, selector, _results;
    try {
      errors_array = JSON.parse(status.responseText);
      console.log(errors_array);
      _results = [];
      for (key in errors_array) {
        selector = $('#community_name');
        if ($(selector).length > 0 && $(selector).data('errorOn') !== 0) {
            console.log(selector);
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
    $(field_selector).addClass('has-error');
  };
});

function popupCenter(url, width, height, name) {
  var left = (screen.width/2)-(width/2);
  var top = (screen.height/2)-(height/2);
  popup_window = window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
}

jQuery(function($) {
  $("a.popup").click(function(e) {
    popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
    e.stopPropagation(); return false;
  });
});
