;(function() {
  var $pages;
  var pageObjects = [];
  var urlHistory = [];

  function pageFactory(url, $el, enter, leave) {
    return {
      url: url,
      $el: $el,
      enter: enter || pageEnter,
      leave: leave || pageLeave
    };
  }

  function getPage(pages, key) {
    return pages.filter(function(e) {
      return e.url == key;
    })[0] || null;
  }

  function pageEnter($el) {
    var $page = $el.addClass("page-enter").appendTo("article");
    return animEnd($page).then(function() {
      $el.removeClass("page-enter");
    });
  }

  function pageLeave($el) {
    return animEnd($el.addClass("page-leave")).then(function() {
      $el.detach();
      $el.removeClass("page-leave");
    });
  }

  function scanLast(arr, f) {
    var temp = arr.slice(-2);
    if (temp.length === 1) temp.unshift(null);
    return f.apply(this, temp);
  }

  var firstPromise = new $.Deferred().resolve();

  function urlChangeHandler() {
    var pageid = parseUrl(location.pathname);
    urlHistory.push(pageid);
    // var pageid = parseUrl(location.hash);
    // urlHistory.push(pageid);

    scanLast(urlHistory, function(prev, next) {
      var prevPage = getPage(pageObjects, prev),
        nextPage = getPage(pageObjects, next);

      if (!nextPage) throw new Error(pageid + "に対応するページがありません");
      firstPromise.then(function() {
        var page = prevPage;
        if (page) return page.leave(page.$el, pageLeave.bind(this, page.$el), prev, next);
      }).then(function() {
        var page = nextPage;
        return page.enter(page.$el, pageEnter.bind(this, page.$el), prev, next);
      });
    });

    // animEnd(
    //   $prevPage.addClass("page-leave")
    // ).then(function() {
    //   $prevPage.detach().removeClass("page-leave");
    //   return animEnd(
    //     $nextPage
    //       .appendTo("article")
    //       .addClass("page-enter")
    //   );
    // }).then(function() {
    //   $nextPage.removeClass("page-enter");
    // });

    // function enter() {
    //   $pages.detach();
    //
    //   $nextPage
    //     .removeClass("page-enter")
    //     .appendTo("article")
    //     .addClass("page-enter");
    // }
    //
    // if ($prevPage.length > 0) {
    //   $prevPage
    //     .addClass("page-leave")
    //     .on("webkitAnimationEnd", function onFadeOut() {
    //       $nextPage
    //         .off("webkitAnimationEnd", onFadeOut)
    //         .removeClass("page-leave")
    //         .detach();
    //       enter();
    //     });
    // } else {
    //   enter();
    // }

    // $pages
    //   .detach()
    //   .removeClass("page-enter")
    //   .filter(".page"+pageid)
    //   .appendTo("article")
    //   .addClass("page-enter")
    //   .on("webkitAnimationEnd", function() {
    //     alert("animationEnd");
    //   }, false);

    // setTimeout(function() {
    //   $page.addClass("page-enter");
    // }, 0);
  }

  function animEnd($el) {
    var dfd = new $.Deferred
    , callback = function() { dfd.resolve($el); };

    if ($el.length === 0 || $el.css("-webkit-animation") === undefined) {
      dfd.resolve();
      return dfd;
    }

    $el.on("webkitAnimationEnd", callback);
    dfd.done(function() {
      $el.off("webkitAnimationend", callback);
    });
    return dfd;
  }

  function parseUrl(url) {
    if (url == "/") url = "/index.html";
    return url;
    // return url.slice(1) || 1;
  }

  function start() {
    $(window)
      .on('popstate', urlChangeHandler)
      .trigger('popstate');
    // $(window)
    //   .on('hashchange', urlChangeHandler)
    //   .trigger('hashchange');
  }

  function add(url, $el, enter, leave) {
    pageObjects.push(pageFactory(url, $el, enter, leave));
  }

  function navigate(url) {
    history.pushState(null, null, url);
    urlChangeHandler();
  }

  window.myRouter = {
    add: add,
    navigate: navigate,
    start: start
  };
})();
