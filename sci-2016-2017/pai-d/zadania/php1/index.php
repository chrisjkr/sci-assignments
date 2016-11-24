<html>

<head>
<title>ok</title>
<meta charset="utf-8">
</head>

<body>

<h1>1.</h1>
	<form method="POST">
		<input type="text" name="name">
		<input type="text" name="surname">
		<button type="submit">Elo</button>
	</form>
<?php 
error_reporting(E_ALL ^ E_NOTICE);
setlocale(LC_ALL, 'pl_PL.UTF-8');


if(!empty($_POST["name"]) && !empty($_POST["surname"])) {
	echo "<p>Siema " . $_POST["name"] . " " . $_POST["surname"] . "</p>"	;
} else {
}
?> </p>
	
<h1>2.</h1>
<form method="POST">
	<input type="number" name="d">
	<input type="number" name="m">
	<input type="number" name="y">
	<button type="submit">ok</button>
</form>

<?php 
$d = $_POST["d"];
$m = $_POST["m"];
$y = $_POST["y"];
if(empty($d) || empty($m) || empty($y)) {
	
} else {
	echo date("F", mktime(0, 0, 0, $m, $d, $y));
}
?>
	
<h1>3.</h1>
<form method="post" action="index.php">
<input type="text" name="liczba1" /><br />
<input type="radio" name="znak" value="+" /> +<br />
<input type="radio" name="znak" value="-" /> -<br />
<input type="radio" name="znak" value="*" /> *<br />
<input type="radio" name="znak" value="/" /> /<br />
<input type="radio" name="znak" value="pow" />potêga<br />
<input type="radio" name="znak" value="root" />pierwiastek<br />
<input type="text" name="liczba2" /><br />
<input type="submit" value="Licz" />
</form>
<?php
$liczba1 = $_POST['liczba1'];
$liczba2 = $_POST['liczba2'];
echo 'Wynik '.$liczba1.' '.$_POST['znak'].' '.$liczba2.' wynosi ';
switch($_POST['znak']) {
case "+": echo $liczba1 + $liczba2; break;
case "-": echo $liczba1 - $liczba2; break;
case "*": echo $liczba1 * $liczba2; break;
case "/": echo $liczba1 / $liczba2; break; 
case "pow": echo pow($liczba1, $liczba2); break;
case "root": echo pow($liczba1, 1/$liczba2); break;
}
?>	
	
</body>

</html>