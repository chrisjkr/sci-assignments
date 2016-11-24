<?php

$f = fopen("dane4.txt", "r");
$i = 1;
while($line = fgets($f)) {

	echo nl2br($i.". wiersz: ".strlen($line)."\r\n");
	$i++;
}

?>