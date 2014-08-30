$(document).ready(function() {

	$('div.video').click(function() {

		$('iframe').attr('src', $(this).attr('data_url'));

	});

});