// myRouter.add("1", $(".page1"), function($el, action, prev, next) {
//   alert("hello");
//   return action();
// }, function($el, action, prev, next) {
//   alert("bye");
//   return action();
// });

function createEnterFunc(path) {
  return function enter($el, action, prev, next) {
    return $.ajax({
      url: path,
      dataType: "html"
    }).then(function(d) {
      var content = $(d).find("[data-role=page] .inner");
      $el.html(content);
      return action();
    });
  };
}

function leave($el, action) {
  return $el.find(".inner")
    .fadeOut(300).promise()
    .then(function() {
      return action();
    });
}

$(document).on("click", ".page a", function(e) {
  e.preventDefault();
  var href = $(this).attr("href");
  myRouter.navigate(href);
  // history.pushState(null, null, href);
});

myRouter.add("/index.html", $("<section class='page'/>"), createEnterFunc("./index.html"), leave);
myRouter.add("/page2.html", $("<section class='page'/>"), createEnterFunc("./page2.html"), leave);
myRouter.add("/page3.html", $("<section class='page'/>"), createEnterFunc("./page3.html"), leave);
myRouter.add("/page4.html", $("<section class='page'/>"), createEnterFunc("./page4.html"), leave);

$(".page").detach();
myRouter.start();
