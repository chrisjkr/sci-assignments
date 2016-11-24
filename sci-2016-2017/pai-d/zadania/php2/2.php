<?php

for($i = 0; $i < 10; $i++) {
	if($i == 0) {
		file_put_contents("dane2.txt", rand().PHP_EOL);
	} else {
		file_put_contents("dane2.txt", rand().PHP_EOL, FILE_APPEND);
	}
}

?>