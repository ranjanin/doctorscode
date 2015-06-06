 

$(document).ready(function(){

	var screenWidth = $(window).width();

	// place holder

	$(function(event) {
		$('[placeholder]').focus(function() {
			var input = $(this);
			if (input.val() == input.attr('placeholder')) {
				input.val('');
				input.removeClass('placeholder');
			}
		}).blur(function() {
			var input = $(this);
			if (input.val() == '' || input.val() == input.attr('placeholder')) {
				input.addClass('placeholder');
				input.val(input.attr('placeholder'));
			}
		}).blur();
		$('[placeholder]').parents('form').submit(function() {
			$(this).find('[placeholder]').each(function() {
				var input = $(this);
				if (input.val() == input.attr('placeholder')) {
					input.val('');
				}
			})
		});
	});

	//////////////

	if(screenWidth<960){		

		$(".menuIconWrap").click(function(){
			if ($(".menu").css('display')==='none') 
			{
				$("#menuBG2").hide();
				$("#menuBG1").removeClass("menuBG1").addClass("ActiveMenuBG1");			
				$("#menuBG3").removeClass("menuBG3").addClass("ActiveMenuBG3");
				$(".menu").fadeIn("1000");
			}
			else
			{
				$("#menuBG1").removeClass("ActiveMenuBG1").addClass("menuBG1");			
				$("#menuBG3").removeClass("ActiveMenuBG3").addClass("menuBG3");			
				$("#menuBG2").fadeIn("1000");	
				$(".menu").fadeOut("1000");
			}
		});

	}

	/////////////////

	$(".contentHomeRegisterLoginWrapperhead").eq(0).addClass('contentHomeRegisterLoginWrapperheadActive');
	$(".contentHomeRegisterLoginWrapperhead").eq(0).click(function(){
		$(".contentHomeRegisterLoginWrapperhead").removeClass('contentHomeRegisterLoginWrapperheadActive');
		$(this).addClass('contentHomeRegisterLoginWrapperheadActive');
		$(".loginQuad").slideDown();
	});
	$(".contentHomeRegisterLoginWrapperhead").eq(1).click(function(){
		$(".contentHomeRegisterLoginWrapperhead").removeClass('contentHomeRegisterLoginWrapperheadActive');
		$(this).addClass('contentHomeRegisterLoginWrapperheadActive');
		$(".loginQuad").slideUp();
	});

	//////////////////

	var bloodDoctorWidth = $(".bloodDoctor").width() - 25;
	$(".bloodDoctorRight").css('width', bloodDoctorWidth +"px");

	var bloodDoctorWidthBottom = $(".bloodDoctorBottom").width() - 35;
	$(".bloodDoctorRightBottom").css('width', bloodDoctorWidthBottom +"px");
	$(".bloodDoctorRightBottomInnertext").css('width', bloodDoctorWidthBottom - 22 +"px");
	$(".bloodDoctorRightBottomInnertextAdd").css('width', bloodDoctorWidthBottom - 22 +"px");
	
	//////////////


});
 $(document).on("pagecreate",function(event){
 	$(window).on("orientationchange",function(){
 		window.location.reload();
 	});
 });
