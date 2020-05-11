// Put colors for input[type=radio]
$('.color').each(function() {
  var color = $(this).attr('data-color');
  $(this).css('background-color', color);
});

// Arrows for input[type=range]
$('.arrow-right').on('click', function(e) {
  //e.preventDefault();
  var value = parseFloat($(this).prev().val()),
    newValue = parseFloat(value + 1),
    max = $(this).parent().prev().attr('data-legend');
  if (newValue > max) {
    newValue = max;
  }
  $(this).prev().val(newValue);
  $(this).parent().prev().text(newValue + '/' + max);
});

$('.arrow-left').on('click', function(e) {
  //e.preventDefault();
  var value = parseFloat($(this).next().val()),
    newValue = parseFloat(value - 1),
    max = $(this).parent().prev().attr('data-legend');
  if (newValue < 0) {
    newValue = 0;
  }
  $(this).next().val(newValue);
  $(this).parent().prev().text(newValue + '/' + max);
});

// Arrows for clothes module
$('.arrowvetement-right').on('click', function(e) {
  var li = $(this).parent().find('li.active'),
    active = li.next(),
    id = active.attr('order'),
    max = $(this).parent().find('li').length - 1;
  if ($(this).prev().hasClass('active')) {
    li.removeClass('active');
    $(this).parent().find('li:first-of-type').addClass('active');
    $(this).parent().parent().find('.vetements-value').text('0/' + max)
  } else {
    li.removeClass('active');
    active.addClass('active');
    $(this).parent().parent().find('.vetements-value').text(id + '/' + max)
  }
  $.post('http://skincreator/zoom', JSON.stringify({
    zoom: $(this).parent().attr('data-link')
  }));
});
$('.arrowvetement-left').on('click', function(e) {
  var li = $(this).parent().find('li.active'),
    active = li.prev(),
    id = active.attr('order'),
    max = $(this).parent().find('li').length - 1;
  if ($(this).next().hasClass('active')) {
    li.removeClass('active');
    $(this).parent().find('li:last-of-type').addClass('active');
    $(this).parent().parent().find('.vetements-value').text(max + '/' + max)
  } else {
    li.removeClass('active');
    active.addClass('active');
    $(this).parent().parent().find('.vetements-value').text(id + '/' + max)
  }
  $.post('http://skincreator/zoom', JSON.stringify({
    zoom: $(this).parent().attr('data-link')
  }));
});

// Put value of input into label-value
$('.input .label-value').each(function() {
  var max = $(this).attr('data-legend'),
    val = $(this).next().find('input').val();
  $(this).parent().find('.label-value').text(val + '/' + max);
});
$('input[type=range]').change(function() {
  var value = parseFloat($(this).val()),
    max = $(this).parent().prev().attr('data-legend');
  $(this).parent().prev().text(value + '/' + max);
});
$('.vetements .group').each(function() {
  var max = $(this).find('li').length - 1;
  $(this).find('.vetements-value').text('0/' + max);
});

// Popup click on submit
$('.submit').on('click', function(e) {
  e.preventDefault();
  $('.popup').fadeIn(200);
});
$('.popup .button').on('click', function(e) {
  e.preventDefault();
  $('.popup').fadeOut(200);
});
