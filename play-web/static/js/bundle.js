$(function() {

  // 搜索条出现
  var searchShow = function() {
    $('#seachInput')
      .focus()
      .bind('keydown', function(event) {
        if (event.keyCode == 13) {
          alert('search ' + $(this).val());
          seachPannel();
        }
      });
  };
  // 搜索条隐藏
  var searchHide = function() {
    $('#seachInput')
      .val('')
      .unbind('keydown');
  };

  // 搜索框操作
  var seachPannel = function() {
    $('.ui.labeled.icon.sidebar')
      .sidebar('toggle')
      .sidebar('setting', 'onShow', searchShow)
      .sidebar('setting', 'onHidden', searchHide);
  };

  $('.searchBtn').click(function() {
    seachPannel();
  });

  // 选项高亮
  $("a[class*=item]").click(function() {
    var $this = $(this);
    $this.addClass("active");
    $this.siblings(".active").removeClass("active");
  });

  // 搜索框
  $("#seachBand").click(function() {
    $("#seachInput").focus();
  });

});
