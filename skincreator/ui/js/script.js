var CONFIG = {
  "lang": "fr",
  "supportedLangs": ["fr", "en"]
};

function localize(language) {
  if ($.inArray(language, CONFIG.supportedLangs) >= 0) {
    let lang = ':lang(' + language + ')';
    let hide = '[lang]:not(' + lang + ')';
    document.querySelectorAll(hide).forEach(function(node) {
      node.style.display = 'none';
    });
    let show = '[lang]' + lang;
    document.querySelectorAll(show).forEach(function(node) {
      node.style.display = 'unset';
    });
  }
}

function update(save) {
  $.post('http://skincreator/updateSkin', JSON.stringify({
    value: save,
    // Face
    dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
    mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
    gender: $('input[name=gender]:checked', '#formSkinCreator').val(),
    skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
    eyecolor: $('input[name=eyecolor]:checked', '#formSkinCreator').val(),
    acne: $('.acne').val(),
    skinproblem: $('.pbpeau').val(),
    freckle: $('.tachesrousseur').val(),
    wrinkle: $('.rides').val(),
    wrinkleopacity: $('.intensiterides').val(),
    hair: $('.hair').val(),
    haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
    eyebrow: $('.sourcils').val(),
    eyebrowopacity: $('.epaisseursourcils').val(),
    beard: $('.barbe').val(),
    beardopacity: $('.epaisseurbarbe').val(),
    beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
    // Clothes
    hats: $('.chapeaux .active').attr('data'),
    hats_texture: $('input[class=helmet_2]').val(),
    glasses: $('.lunettes .active').attr('data'),
    glasses_texture: $('input[class=glasses_2]').val(),
    ears: $('.oreilles .active').attr('data'),
    ears_texture: $('input[class=ears_2]').val(),
    tops_torso_a: $('.hauts .active').attr('data-torso-a'),
    tops_torso_b: $('.hauts .active').attr('data-torso-b'),
    tops_neck_a: $('.hauts .active').attr('data-neck-a'),
    tops_neck_b: $('.hauts .active').attr('data-neck-b'),
    tops_undershirt_a: $('.hauts .active').attr('data-undershirt-a'),
    tops_undershirt_b: $('.hauts .active').attr('data-undershirt-b'),
    tops_hands: $('.hauts .active').attr('data-bras'),
    pants: $('.pantalons .active').attr('data'),
    pants_texture: $('input[class=pantalons_2]').val(),
    shoes: $('.chaussures .active').attr('data'),
    shoes_texture: $('input[class=chaussures_2]').val(),
    watches: $('.montre .active').attr('data'),
    watches_texture: $('input[class=montre_2]').val(),
  }))
}

$(document).ready(function() {
  localize(CONFIG.lang);
  // Listen for NUI Events
  window.addEventListener('message', function(event) {
    // Open Skin Creator
    if (event.data.openSkinCreator == true) {
      $(".skinCreator").css("display", "block");
      $(".rotation").css("display", "flex");
    }
    // Close Skin Creator
    if (event.data.openSkinCreator == false) {
      $(".skinCreator").fadeOut(400);
      $(".rotation").css("display", "none");
    }
    // Click
    if (event.data.type == "updateMaxVal") {
      $('input.' + event.data.classname).prop('max', event.data.maxVal);
      $('input.' + event.data.classname).val(event.data.defaultVal);
      $('div[name=' + event.data.classname + ']').attr('data-legend', event.data.maxVal);
      $('div[name=' + event.data.classname + ']').text(event.data.defaultVal + '/' + event.data.maxVal);
    }
  });

  // Form update
  $('input').change(function() {
    update(false);
  });
  $('.arrow').on('click', function(e) {
    e.preventDefault();
    update(false);
  });

  // Form submited
  $('.yes').on('click', function(e) {
    e.preventDefault();
    update(true);
  });
  // Rotate player
  $(document).keypress(function(e) {
    if (e.which == 97) { // A pressed
      $.post('http://skincreator/rotaterightheading', JSON.stringify({
        value: 10
      }));
    }
    if (e.which == 101) { // E pressed
      $.post('http://skincreator/rotateleftheading', JSON.stringify({
        value: 10
      }));
    }
  });

  // Zoom out camera for clothes
  $('#tabs label').on('click', function(e) {
    //e.preventDefault();
    $.post('http://skincreator/zoom', JSON.stringify({
      zoom: $(this).attr('data-link')
    }));
  });

  $('.oreilles li').on('click', function(e) {
    $.post('http://skincreator/zoom', JSON.stringify({
      zoom: 'oreilles'
    }));
  });
});
