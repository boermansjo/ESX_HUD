// Put colors for input[type=radio]
$('.color').each(function () {
  var color = $(this).attr('data-color');
  $(this).css('background-color', color);
});

// Arrows for input[type=range]
$('.arrow-right').on('click', function (e) {
  //e.preventDefault();
  var value = parseFloat($(this).prev().val()),
    newValue = parseFloat(value + 1),
    max = $(this).parent().prev().attr('data-legend');
  if (newValue > max){
	  newValue = max;
  }
  $(this).prev().val(newValue);
  $(this).parent().prev().text(newValue + '/' + max);
});

$('.arrow-left').on('click', function (e) {
  //e.preventDefault();
  var value = parseFloat($(this).next().val()),
    newValue = parseFloat(value - 1),
    max = $(this).parent().prev().attr('data-legend');
  if (newValue<0) {
	  newValue = 0;
  }
  $(this).next().val(newValue);
  $(this).parent().prev().text(newValue + '/' + max);
});

// Arrows for clothes module
$('.arrowvetement-right').on('click', function (e) {
  var li = $(this).parent().find('li.active'),
    active = li.next(),
    id = active.attr('order'),
    max = $(this).parent().find('li').length -1;
  if ($(this).prev().hasClass('active')) {
    li.removeClass('active');
    $(this).parent().find('li:first-of-type').addClass('active');
    $(this).parent().parent().find('.vetements-value').text('0/' + max)
  } else {
    li.removeClass('active');
    active.addClass('active');
    $(this).parent().parent().find('.vetements-value').text(id + '/' + max)
  }
});
$('.arrowvetement-left').on('click', function (e) {
  var li = $(this).parent().find('li.active'),
    active = li.prev(),
    id = active.attr('order'),
    max = $(this).parent().find('li').length -1;
  if ($(this).next().hasClass('active')) {
    li.removeClass('active');
    $(this).parent().find('li:last-of-type').addClass('active');
    $(this).parent().parent().find('.vetements-value').text(max + '/' + max)
  } else {
    li.removeClass('active');
    active.addClass('active');
    $(this).parent().parent().find('.vetements-value').text(id + '/' + max)
  }
});

// Put value of input into label-value
$('.input .label-value').each(function () {
  var max = $(this).attr('data-legend'),
    val = $(this).next().find('input').val();
  $(this).parent().find('.label-value').text(val + '/' + max);
});
$('input[type=range]').change(function () {
  var value = parseFloat($(this).val()),
    max = $(this).parent().prev().attr('data-legend');
  $(this).parent().prev().text(value + '/' + max);
});
$('.vetements .group').each(function () {
  var max = $(this).find('li').length -1;
  $(this).find('.vetements-value').text('0/'+max);
});

// Popup click on submit
$('.submit').on('click', function (e) {
  e.preventDefault();
  $('.popup').fadeIn(200);
});
$('.popup .button').on('click', function (e) {
  e.preventDefault();
  $('.popup').fadeOut(200);
});

// Set language
$("#tab1").html(scLocale.appearanceTab);
$("#tab2").html(scLocale.hairinessTab);
$("#tab3").html(scLocale.clothesTab);
$("#morphology").html(scLocale.morphology);
$("#maleFaces").html(scLocale.maleFaces);
$("#femaleFaces").html(scLocale.femaleFaces);
$("#eyeColor").html(scLocale.eyeColor);
$("#skinHeader").html(scLocale.skinHeader);
$("#skinColor").html(scLocale.skinColor);
$("#wrinkles").html(scLocale.wrinkles);
$("#wrinkleIntensity").html(scLocale.wrinkleIntensity);
$("#hairHeader").html(scLocale.hairHeader);
$("#hairstyle").html(scLocale.hairstyle);
$("#hairColor").html(scLocale.hairColor);
$("#eyebrowHeader").html(scLocale.eyebrowHeader);
$("#eyebrowShape").html(scLocale.eyebrowShape);
$("#eyebrowThickness").html(scLocale.eyebrowThickness);
$("#beardHeader").html(scLocale.beardHeader);
$("#beardStyle").html(scLocale.beardStyle);
$("#beardThickness").html(scLocale.beardThickness);
$("#beardColor").html(scLocale.beardColor);
$("#hatsHeader").html(scLocale.hatsHeader);
$("#headHeader").html(scLocale.headHeader);
$("#glassesHeader").html(scLocale.glassesHeader);
$("#earringsHeader").html(scLocale.earringsHeader);
$("#topsHeader").html(scLocale.topsHeader);
$("#jeansHeader").html(scLocale.jeansHeader);
$("#shoesHeader").html(scLocale.shoesHeader);
$("#watchHeader").html(scLocale.watchHeader);
$("#finishButton").html(scLocale.finishButton);
$("#rotationLabel").html(scLocale.rotationLabel);
$("#popupConfirm").html(scLocale.popupConfirm);
$("#popupYes").html(scLocale.popupYes);
$("#popupNo").html(scLocale.popupNo);
$("#geneticsHeader").html(scLocale.geneticsHeader);
$("#frecklesHeader").html(scLocale.frecklesHeader);
$("#skinMarksHeader").html(scLocale.skinMarksHeader);
$("#acneHeader").html(scLocale.acneHeader);