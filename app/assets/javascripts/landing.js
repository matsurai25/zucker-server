$(function(){
  $('a[href="#install"]').on('click', function(e){
    var href = $(this).attr('href');
    var $target = $(href == '#' || href == '' ? 'html' : href);
    $('html, body').animate({scrollTop:$target.offset().top}, 800, 'easeOutQuint');
    return false;
  });
})
