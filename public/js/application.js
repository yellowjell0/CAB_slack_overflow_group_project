$(document).ready(function() {
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

  // do not delete

  $('.arrow').on('click', function(event) {
    event.preventDefault();
    var $arrow = $(this);
    var $id = $arrow.parent().parent().data('id');
    var data = {
      'direction': $arrow.data('direction'),
      'id': $id
    }
    $.ajax ({
      method: 'post',
      url: '/question/' + $id + "/vote",
      data: data
    })
    .done(function(response){
      console.log("Hi")
    });
  });
})
