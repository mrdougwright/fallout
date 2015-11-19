
function submitPuzzle() {
  event.preventDefault()
  var guess = $('#puzzle_guess').val().toUpperCase()
  var form = $('.edit_puzzle')
  var postData = $('.edit_puzzle').serializeArray()
  $.post(form.attr('action'), postData, function() {
  })
  .done(function(data) {
    document.getElementById('tries').innerText = ['four','three','two','one','zero'][data.guesses]
    form[0].reset()
    $('#results').append("<div>" + data.msg + "</div><br>")
  })
  .fail(function(data) {
    $('#results').append("<div>Error! Something went terribly wrong!</div>")
  })
}
