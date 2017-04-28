$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('ul.answer-comment-list').on('submit','form.add-com',function(e) {
    e.preventDefault();
    var $form = $(this);

    $.ajax({
       method: $form.attr('method'),
       url: $form.attr('action'),
       data: $form.serialize(),
     })
    .done(function(resp) {
      // $('.answer-comment-list').children().append(resp);

      console.log(resp['comment']);
    })
  });

});
