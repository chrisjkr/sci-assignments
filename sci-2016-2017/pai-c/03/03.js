$(document).ready(function() {
	$('#calculate').click(function() {
		var n = $('#n').val(),
			d = $('#d').val();
		var divisible = checkDivisor(n, d);
		if(divisible) {
			$('#result').html('<p>Liczba ' + n + ' jest podzielna przez ' + d + '.');
		} else {
			$('#result').html('<p>Liczba ' + n + ' nie jest podzielna przez ' + d + '.');
		}
	});
});

function checkDivisor(n, d) {
	if(n % d === 0) {
		return true;
	} else {
		return false;
	}
}