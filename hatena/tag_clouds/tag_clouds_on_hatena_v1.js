<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>
// タグクラウドもどき
(function($) {
    $(function() {
    var MAX_LEVEL = 8;
    var ZOOM_INCREASE = 0.1;
    var maxCount = 0;
    var categories = $(".hatena-module-category ul li a");
    // 一番大きなタグを取得
    categories.each(function() {
      var elmText = $(this).text().trim();
      var m = elmText.match(/(.+) \((\d+)\)/);
      // m: ["brew (4)", "brew", "4", index: 0, input: "brew (4)"]
      if (m) {
        var count = parseInt(m[2]);
        maxCount = Math.max(maxCount, count);
      };
    });

    var distance = parseInt(maxCount / MAX_LEVEL);
    // cssを変更
    categories.each(function() {
      var elm = $(this);
      var elmText = elm.text().trim();
      var m = elmText.match(/(.+) \((\d+)\)/);
      if (m) {
        var category = m[1];
        var count = parseInt(m[2]);

        var level = parseInt(count / distance);
        var zoomPercent = (1 + level * ZOOM_INCREASE) * 100;
        elm.css('font-size', zoomPercent + "%");
        elm.text(category);
        elm.attr('title', elmText);
      };
    });
  });
})(jQuery);
</script>

