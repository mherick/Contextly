// Generated by CoffeeScript 1.4.0
(function() {

  $(document).ready(function() {
    var bkg;
    $('#loadBootstrap').click(function(e) {
      e.preventDefault();
      return bkg.loadBootstrap();
    });
    bkg = chrome.extension.getBackgroundPage();
    $("#elementSelectedText").val("h1");
    $('#changeElement').click(function(e) {
      var changeClass, element;
      e.preventDefault();
      element = $("#elementSelectedText").val();
      changeClass = $("#class-list").val();
      return bkg.changeElement(element, changeClass);
    });
    return $('#font-style').click(function(e) {
      var element, font;
      e.preventDefault();
      font = $('#font-list').val();
      element = $("#elementSelectedText").val();
      return bkg.changeFont(element, font);
    });
  });

}).call(this);
