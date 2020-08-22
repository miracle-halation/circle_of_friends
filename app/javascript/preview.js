document.addEventListener("turbolinks:load", function() {
	$(function(){
		$('.form_image').change(function(e){
			const file = e.target.files[0];
			const reader = new FileReader();

			reader.onload = (function(file){
				return function(e){
					$(".prev-content").attr("src", e.target.result);
					$(".prev-content").attr("title", file.name);
				};
			})(file)
			reader.readAsDataURL(file);
		});
	});
})