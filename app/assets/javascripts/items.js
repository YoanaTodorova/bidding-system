var reloadItems = function() {
  $.get('/items/refresh', function(data){
    console.log(data);
    $("#items-list").html(data);
    setTimeout(reloadItems, 10000);
  });
};

var ready = function(){
  setTimeout(reloadItems, 10000);
  setInterval(reloadItems, 30000);
};

$(document).ready(ready);
$(document).on('page:load', ready);