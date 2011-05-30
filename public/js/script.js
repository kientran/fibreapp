$(function(){
	$('a.top').click(function(e){
         e.preventDefault();
	     $('html, body').animate({scrollTop: '0px'}, 300);
	     return false;
	});
});
