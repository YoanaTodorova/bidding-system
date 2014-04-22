var reloadItems = function() {
  // $.get('/items/refresh', function(data){
  //   console.log(data);
  //   $("#items-list").html(data);
  //   setTimeout(reloadItems, 10000);
  // });
$.ajax({
  url: "/items/refresh",
  type: "GET",
  success: function(data){
    console.log(data);
    $("#items-list").html(data);
  },
  error: function(){

  }
})
};

var ready = function(){
  setTimeout(reloadItems, 10000);
  var intervalID = setInterval(reloadItems, 30000);
  setTimeout(function(){
    clearInterval(intervalID);
  }, 60000);
};

// $(document).ready(ready);
// $(document).on('page:load', ready);

$(document).ready(function(){
  $(document).on('page:change', function(){
    var url = document.URL;
    // if (url.indexOf("items/index") >= 0) {
    //   ready();
    // }
    if (url.search("items/[0-9]") != -1) {
      var id = url.match("items/([0-9]*)")[1];
      setInterval(function(){
        $.ajax({
          url: "/items/refresh_item_bids",
          type: "POST",
          data: {
            id: id
          },
          success: function(data){
            console.log(data);
            $("#bids-list").html(data);
          },
          error: function(){

          }
        });
      }, 7000);
    }
  });
  
});
