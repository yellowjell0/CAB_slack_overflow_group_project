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

  $('ul.answer-comment-list').on('submit','form.add-com',function(e) {
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
      $('.answers-list').children().last().append("<li><p>ANSWER: "+resp['answer']+"</p><form class='add-com' action='/add_com/<%=answer.id%>/' method='post'><input type='text' name='comment'><button class='answer-comment'>add comment</button></form></li>")

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




