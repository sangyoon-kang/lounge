$(function() {
	$.datetimepicker.setLocale('ko');
	$('.datetimepicker').datetimepicker({
		format:'Y-m-d H:m',
		hours12: true
	});
});