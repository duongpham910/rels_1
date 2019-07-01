$(document).on('click', '#sub_question', function(e){
	var field = $(this).data('content');
	var new_id = new Date().getTime();
	$('.question-field').append(field.replace(/hello/g, new_id));
	return e.preventDefault();
});
$(document).on('click', '#sub_answer', function(e){
	var field = $(this).data('content');
	var new_id = new Date().getTime();
	$('.answer-field').append(field.replace(/helloo/g, new_id));
	return e.preventDefault();
});
$(document).on('click', '.remove-fields', function(e) {
	$(this).prev('input[type=hidden]').val('1');
	$(this).closest('div').hide();
	return e.preventDefault();
});