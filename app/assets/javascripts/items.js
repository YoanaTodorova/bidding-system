var reloadItems = function() {
  $.get('/items/refresh', function(data){
    console.log(data);
    $("#items-list").html(data);
    setTimeout(reloadItems, 10000);
  });
};

var ready = function(){
  setTimeout(reloadItems, 10000);
  var intervalID = setInterval(reloadItems, 30000);
  // setTimeout(function(){
  //   clearInterval(intervalID);
  // }, 120000);
};

$(document).ready(ready);
$(document).on('page:load', ready);

// $(document).ready(function(){
//   $(document).on('page:change', function(){
//     var url = document.URL;
//     if (url.indexOf("items/index") >= 0) {
//       ready();
//     }
//   });

// });