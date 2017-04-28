$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('form.add_q_com').on('submit',function(e){
    e.preventDefault();
    var $form = $(this);

    $.ajax({
     method: $form.attr('method'),
     url: $form.attr('action'),
     data: $form.serialize(),
   })
    .done(function(resp) {
      $('.question-comment-list').children().last().append("<li>"+resp['comment']+"</li>")

      console.log(resp['comment']);
    })
  });

  $('form.add-com').on('submit',function(e) {
    e.preventDefault();
    var $form = $(this);

    $.ajax({
     method: $form.attr('method'),
     url: $form.attr('action'),
     data: $form.serialize(),
   })
    .done(function(resp) {
      $('.answer-comment-list').children().last().append("<li>"+resp['comment']+"</li>")

      console.log(resp['comment']);
    })
  });

  $('.some').on('submit','form.add_answer', function(e) {
    e.preventDefault();
    var $form = $(this);
    $.ajax({
     method: $form.attr('method'),
     url: $form.attr('action'),
     data: $form.serialize()
   })
    .done(function(resp) {
      $('.answers-list').children().last().append("<ul class='vote-buttons' data-id=" + resp['answer'] + "<li><input type='image' class='arrow-1' name='submit' src='/images/up-triangle.png' height='15px' data-direction='up'></li><li id='vote-button-v-count'>0</li><li><input type='image' class='arrow-2' name='submit' src='/images/down-triangle.png' height='15px' data-direction='down'></li></ul><li><p>ANSWER: "+resp['answer']+"</p><form class='add-com' action='/add_com/<%="+resp['answer']+".id%>/' method='post'><input type='text' name='comment'><button class='answer-comment'>add comment</button></form></li>")

      console.log(resp['answer']);
    })
  })
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

});
