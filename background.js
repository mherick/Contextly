// Generated by CoffeeScript 1.4.0
(function() {
  var popupVars;

  popupVars = new Object();

  chrome.extension.onMessage.addListener(function(request, sender, sendResponse) {
    return popupVars.element = request.element;
  });

  this.loadBootstrap = function() {
    return chrome.tabs.getSelected(null, function(tab) {
      return chrome.tabs.sendMessage(tab.id, {
        action: "loadBootstrap"
      });
    });
  };

  this.changeFont = function(element, font) {
    return chrome.tabs.getSelected(null, function(tab) {
      return chrome.tabs.sendMessage(tab.id, {
        action: "changeFont",
        element: element,
        font: font
      });
    });
  };

  this.changeColor = function(element, color) {
    return chrome.tabs.getSelected(null, function(tab) {
      return chrome.tabs.sendMessage(tab.id, {
        action: "changeColor",
        element: element,
        color: color
      });
    });
  };

  this.changeElement = function(element, changeClass) {
    return chrome.tabs.getSelected(null, function(tab) {
      return chrome.tabs.sendMessage(tab.id, {
        action: "changeElement",
        element: element,
        changeClass: changeClass
      });
    });
  };

  this.getpopupVars = function() {
    return popupVars;
  };

}).call(this);
