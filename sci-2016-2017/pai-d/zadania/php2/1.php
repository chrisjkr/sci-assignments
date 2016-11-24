<html>
<head>
	<meta charset="utf-8">
	<title>PHP 2</title>
</head>

<body>
	<form method="POST">
	<input type="text" name="n1">
	<input type="text" name="n2">
	<button type="submit">Wyślij</button>
	</form>
</body>
</html>

<?php
error_reporting(E_ALL ^ E_NOTICE);

$n1 = $_POST["n1"];
$n2 = $_POST["n2"];

if(empty($n1) || empty($n2)) {

} else {
	$file = "dane1.txt";
	$data1 = "a)".PHP_EOL.$n1.PHP_EOL.$n2.PHP_EOL.PHP_EOL;
	file_put_contents($file, $data1);

	$data2 = "b)".PHP_EOL.$n1." ".$n2.PHP_EOL.PHP_EOL;
	file_put_contents($file, $data2, FILE_APPEND);

	$sum = $n1 + $n2;
	$product = $n1 * $n2;

	$data3 = "c)".PHP_EOL."Suma: ".$sum.PHP_EOL."Iloczyn: ".$product.PHP_EOL;
	file_put_contents($file, $data3, FILE_APPEND);
}

?>