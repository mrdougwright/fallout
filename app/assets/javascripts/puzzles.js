
function submitPuzzle() {
  event.preventDefault()
  var guess = $('#puzzle_guess').val().toUpperCase()
  var formUrl = $('.edit_puzzle').attr('action')
  var postData = $('.edit_puzzle').serializeArray()
  $.post(formUrl, postData, function() {
  })
  .done(function(data) {
    $('#results').append("<div>" + data.msg + "</div>")
  })
  .fail(function(data) {
    $('#results').append("<div>Error! Something went terribly wrong!</div>")
  })
}
