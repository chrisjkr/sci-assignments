<?php

$f = fopen("dane2.txt", "r");
$numbers = array();
while($line = fgets($f)) {
	array_push($numbers, intval($line));
}
fclose($f);

$max = 0;
$avg = 0;
for($i = 0; $i < sizeof($numbers); $i++) {
	if($numbers[$i] > $max) {
		$max = $numbers[$i];
	}
	$avg = $avg + $numbers[$i];
}
$avg = $avg / sizeof($numbers);

file_put_contents("dane3.txt", "Max: ".$max.PHP_EOL."Avg: ".$avg.PHP_EOL);

?>