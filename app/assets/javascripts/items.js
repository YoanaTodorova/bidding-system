// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

(function() {
  var $;
  $ = jQuery;
  $.fn.myFunction = function() {

    var id = $("#show-item-container")[0].id
    console.log("id", id)
    var url = "/items/show/" + id;
    var data = {
              data1: "yes",
              data2: "no"
            };
    $.ajax({
            type: "POST",
            url : url,
            data: data,
            success: function() {  alert("Data Send!");},
            error: function(xhr){  alert("The error code is: "+xhr.statusText);}        
        });

  };
}).call(this);