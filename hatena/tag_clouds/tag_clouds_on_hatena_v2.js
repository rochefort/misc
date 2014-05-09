<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
// タグクラウドもどき
(function($) {
    $(function() {
    var categories = $(".hatena-module-category ul li a");
    categories.each(function() {
      var elm = $(this);
      var elmText = elm.text().trim();
      var m = elmText.match(/(.+) \((\d+)\)/);
      if (m) {
        var category = m[1];
        var count = parseInt(m[2]);

        if(count >= 150)      elm.css("font-size", "300%");
        else if(count >= 100) elm.css("font-size", "250%");
        else if(count >= 50)  elm.css("font-size", "200%");
        else if(count >= 20)  elm.css("font-size", "150%");
        else elm.css("font-size", "90%");
        elm.text(category);
        elm.attr('title', elmText);
      };
    });
  });
})(jQuery);
</script>
