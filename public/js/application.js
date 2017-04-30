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
     data: $form.serialize()
   })
    .done(function(resp) {
      $('.question-comment-list').children().last().append("<li>"+resp['comment']+"</li>")
     $("form.add_q_com input").val("")
      console.log(resp['comment']);
    })
  });

  $('div.answers-div').on('submit','form.add-com',function(e){
    e.preventDefault();
    var $form = $(this);
    $.ajax({
     method: $form.attr('method'),
     url: $form.attr('action'),
     data: $form.serialize()
   })
    .done(function(resp) {
      comment = JSON.parse(resp["comment"])
      $('.answer-' + comment.commentable_id + ' .answer-comment-list').append("<li>"+comment.body+"</li>")
      $("form input").val("")
      console.log(resp['comment']);    
    })
  });

  $('.container').on('submit','form.add_answer', function(e) {
    e.preventDefault();
    var $form = $(this);
    $.ajax({
     method: $form.attr('method'),
     url: $form.attr('action'),
     data: $form.serialize()
   })
    .done(function(resp) {
      var answer = JSON.parse(resp["answer"])

      $('.answers-list').append("<ul class='vote-buttons' data-id=" + answer.id + "<li><input type='image' class='arrow-1' name='submit' src='/images/up-triangle.png' height='15px' data-direction='up'></li><li id='vote-button-v-count'>0</li><li><input type='image' class='arrow-2' name='submit' src='/images/down-triangle.png' height='15px' data-direction='down'></li></ul><li><div class='answers-area answer-"+answer.id+"'><p>ANSWER: "+answer.body+"</p><ul class='answer-comment-list'></ul><form class='add-com' action='/add_com/"+answer.id+"/' method='post'><input type='text' name='comment'><button class='answer-comment'>add comment</button></form></li></div>")
      $("form textarea").val("")


      console.log(resp['answer']);
    })
  })


$('.arrow-1').on('click', function(event) {
  event.preventDefault();
  var $arrow = $(this);
  var $id = $arrow.parent().parent().data('id');
  var $votes = $('#vote-button-v-count-1')
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
    $votes.html(response.count);
  });
 });

$('.arrow-2').on('click', function(event) {
  event.preventDefault();
  var $arrow = $(this);
  var $id = $arrow.parent().parent().data('id');
  var $votes = $('#vote-button-v-count-2')
  var data = {
    'direction': $arrow.data('direction'),
    'id': $id
  }
  debugger;
  $.ajax ({
    method: 'post',
    url: '/comment/' + $id + "/vote",
    data: data
  })
  .done(function(response){
    $votes.html(response.count);
  });
 });
})




