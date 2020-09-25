// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery.jscroll.min.js
//= require bootstrap-sprockets
//= require_tree .
//= require chartkick
//= require Chart.bundle

document.addEventListener("turbolinks:load", function() {

  // ハンバーガーメニュー

  $(function() {
    $('.menu-trigger').on('click', function(event) {
      // classの切り替え
      $(this).toggleClass('active');
      // フェードインアウトの切り替え
      $('.navbar-right').fadeToggle();
      // デフォルトの処理をキャンセル
      event.preventDefault();
    });
  });

  // スライドショー

  $(document).ready(function () {
    $("#slideshow").skippr({
      transition : 'fade',
      speed : 1000,
      easing : 'easeOutQuart',
      navType : 'bubble',
      childrenElementType : 'div',
      arrows : false,
      autoPlay : true,
      autoPlayDuration : 3000,
      keyboardOnAlways : true,
      hidePrevious : false
    });
  });

  // トップに戻る

  $(function() {
    $("#back-to-top").hide();

    $(window).scroll(function(){
      // 60pxスクロールしたら表示
      if ($(this).scrollTop() > 60){
        $("#back-to-top").fadeIn();
      }else{
        $("#back-to-top").fadeOut();
      }
    })

    $('#back-to-top a').click(function() {
      $('html, body').animate({
        scrollTop:0
      }, 800);
      return false;
    })
  })

  // タブメニュー

  $('#tab-contents .tab[id != "tab1"]').hide();

  $('#tab-menu a').on('click', function(event) {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });

  // 無限スクロール

  $(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
      $('#jscroll').jscroll({
        // 無限に追加する要素
        contentSelector: '#jscroll',
        // 次のページを表示するためのリンク
        nextSelector: 'a.next',
        loadingHtml: '<div class="text-center"><i class="fas fa-2x fa-spinner faa-spin animated"></i></div>'
      });
    }
  });

})