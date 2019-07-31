// Set language
$("#appearanceTab").html(scLocale.appearanceTab);
$("#hairinessTab").html(scLocale.hairinessTab);
$("#clothesTab").html(scLocale.clothesTab);

// Put colors for input[type=radio]
$('.color').each(function () {
  var color = $(this).attr('data-color');
  $(this).css('background-color', color);
});

// Arrows for input[type=range]
$('.arrow-right').on('click', function (e) {
  e.preventDefault();
  var value = parseFloat($(this).prev().val()),
    newValue = parseFloat(value + 1),
    max = $(this).parent().prev().attr('data-legend');
  $(this).prev().val(newValue);
  $(this).parent().prev().text(newValue + '' + max);
});

$('.arrow-left').on('click', function (e) {
  e.preventDefault();
  var value = parseFloat($(this).next().val()),
    newValue = parseFloat(value - 1),
    max = $(this).parent().prev().attr('data-legend');
  $(this).next().val(newValue);
  $(this).parent().prev().text(newValue + '' + max);
});

// Arrows for clothes module
$('.arrowvetement-right').on('click', function (e) {
  var li = $(this).parent().find('li.active'),
    active = li.next(),
    id = active.attr('data'),
    max = $(this).parent().find('li:last-of-type').attr('data');
  if ($(this).prev().hasClass('active')) {
    li.removeClass('active');
    $(this).parent().find('li:first-of-type').addClass('active');
    $(this).parent().parent().find('.label-value').text('0/' + max)
  } else {
    li.removeClass('active');
    active.addClass('active');
    $(this).parent().parent().find('.label-value').text(id + '/' + max)
  }
});
$('.arrowvetement-left').on('click', function (e) {
  var li = $(this).parent().find('li.active'),
    active = li.prev(),
    id = active.attr('data'),
    max = $(this).parent().find('li:last-of-type').attr('data');
  if ($(this).next().hasClass('active')) {
    li.removeClass('active');
    $(this).parent().find('li:last-of-type').addClass('active');
    $(this).parent().parent().find('.label-value').text(max + '/' + max)
  } else {
    li.removeClass('active');
    active.addClass('active');
    $(this).parent().parent().find('.label-value').text(id + '/' + max)
  }
});

// Put value of input into label-value
$('.input .label-value').each(function () {
  var max = $(this).attr('data-legend'),
    val = $(this).next().find('input').val();
  $(this).parent().find('.label-value').text(val + '' + max);
});
$('input[type=range]').change(function () {
  var value = parseFloat($(this).val()),
    max = $(this).parent().prev().attr('data-legend');
  $(this).parent().prev().text(value + '' + max);
});
$('.vetements .group').each(function () {
  var max = $(this).find('li:last-of-type').attr('data');
  $(this).find('.label-value').text('0/' + max);
});

// Popup click on submit
$('.submit').on('click', function (e) {
  e.preventDefault();
  $('.popup').fadeIn(200);
});
$('.popup .button').on('click', function (e) {
  e.preventDefault();
  $('.popup').fadeOut(200);
  // Set language
  $("#hairinessTab").html(scLocale.useItem);
  $("#appearanceTab").html(scLocale.useItem);
  $("#clothesTab").html(scLocale.useItem);
});