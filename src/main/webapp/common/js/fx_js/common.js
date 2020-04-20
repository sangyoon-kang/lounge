

// 비밀번호 보이기/숨기기

$('input:password').on('keyup',function(){
     var length = $(this).val().length;
     var toggle_pass = $(this).next('.show-pass');
     if (length > 0) {
          toggle_pass.addClass('show');
     }else {
          toggle_pass.removeClass('show');
     }
});
$('.show-pass').on('click',function(){
     $(this).toggleClass('hide');
     var prev_input = $(this).prev('input');
     if (prev_input.attr('type') == "password") {
          prev_input.attr('type','text')
     }else {
          prev_input.attr('type','password')
     }
});

$('.accordion').click(function(e) {
    e.preventDefault();

   var $this = $(this);

   if ($this.next().hasClass('show')) {
       $this.next().removeClass('show');
       $this.next().slideUp(350);
   } else {
       $this.parent().parent().find('li .inner').removeClass('show');
       $this.parent().parent().find('li .inner').slideUp(350);
       $this.next().toggleClass('show');
       $this.next().slideToggle(350);
   }
});

$('.toggle').on('click',function(){
    $('.nav').slideToggle();
})

 $('.nav-link').on('click',function(){
	 if (window.matchMedia('(max-width: 992px)').matches){
		 $(this).next($('.sub-menu')).slideToggle();
	 }
 });
$(window).resize(function(){
	 if (window.matchMedia('(min-width: 992px)').matches) {
		 $('.nav').removeAttr('style');
		 $('.sub-menu').removeAttr('style');
	  };
	
})
 
