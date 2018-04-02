$(document).ready(function() {
  var height = $(window).height();
  $('#form-comment').on('keydown', function(event) {
    if (event.keyCode === 13) {
      comment_content = event.target.value
      request_id = $("#request-id").text()
      $.ajax({
        url: "/comments",
        method: "post",
        data: {comment:{content: comment_content, request_id: request_id}},
        success: function(result){
          event.target.value = "";
        }
      })
      return event.preventDefault();
    }
  })
})
