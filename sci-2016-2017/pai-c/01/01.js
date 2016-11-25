$(document).ready(function() {
	$('#calculate').click(function() {
		var a = $('#a').val(),
			b = $('#b').val(),
			c = $('#c').val(),
			x = $('#x').val();
		calculate(a, b, c, x);
	});
});

function calculate(a, b, c, x) {
	if(!a || !b || !c || !x) {
		alert("Brakuje danych.");
		return false;
	}

	var delta = Math.pow(b, 2) - 4 * a * c;
	if(delta > 0) {
		var x1 = (-b - Math.sqrt(delta)) / (2 * a);
		var x2 = (-b + Math.sqrt(delta)) / (2 * a);
		$('#result').html(`
			<p>Delta: ` + delta + `</p>
			<p> x1: ` + x1 + `</p>
			<p> x2: ` + x2 + `</p>
		`);
	} else if(delta === 0) {
		var x = -b / (2 * a);
		$('#result').html(`
			<p>Delta: ` + delta + `</p>
			<p>x: ` + x + `</p>
		`);
	} else {
		$('#result').html(`
			<p>Delta mniejsza niż 0, brak wyniku.</p>
		`);
	}
}