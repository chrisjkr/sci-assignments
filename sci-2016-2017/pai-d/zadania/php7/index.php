<?php
	function p2 ($x, $verbose) {
		$lastDigit = (string)$x;
		$lastDigit = (int)($lastDigit[strlen($lastDigit) - 1]);
		if ($lastDigit % 2 == 0) {
			echo ($verbose ? "Liczba " . $x . " jest podzielna przez 2" : NULL);
			return true;
		}else {
			echo ($verbose ? "Liczba " . $x . " nie jest podzielna przez 2" : NULL);
			return false;
		}
	}

	function p3 ($x, $verbose) {
		$strX = (string)$x;
		$strlen = strlen($strX);
		$sum = 0;

		for ($i = 0; $i < $strlen; $i++) {
			$sum += (int)($strX[$i]);
		}

		if ($sum % 3 == 0) {
			echo ($verbose ? "Liczba " . $x . " jest podzielna przez 3" : NULL);
			return true;
		}else {
			echo ($verbose ? "Liczba " . $x . " nie jest podzielna przez 3" : NULL);
			return false;
		}
	}

	function p4 ($x, $verbose) {
		$strX = (string)$x;
		$strlen = strlen($strX);
		$last2Digits = (int)substr($strX, $strlen - 2, 2);
		
		if (($last2Digits == 0 && $x % 4 == 0) || $last2Digits % 4 == 0) {
			echo ($verbose ? "Liczba " . $x . " jest podzielna przez 4" : NULL);
			return true;
		} else {
			echo ($verbose ? "Liczba " . $x . " nie jest podzielna przez 4" : NULL);
			return false;
		}
	}

	function p5 ($x) {
		$strX = (string)$x;
		$lastDigit = (int)$strX[strlen($strX) - 1];
		if ($lastDigit == 5 || $lastDigit == 0) {
			echo "Liczba " . $x . " jest podzielna przez 5";
			return true;
		} else {
			echo "Liczba " . $x . " nie jest podzielna przez 5";
			return false;
		}
	}

	function p6 ($x) {
		if (p2($x, false) && p3($x, false)) {
			echo "Liczba " . $x . " jest podzielna przez 6";
			return true;
		} else {
			echo "Liczba " . $x . " nie jest podzielna przez 6";
			return false;
		}
	}

	function p7 ($x) {
		$strX = (string)$x;
		$strlen = strlen($strX);
		$sum = 0;

		for ($i = $strlen - 1, $p = 0; $i >= 0; $i-- && $p++) {
			$digit = (int)$strX[$i];
			$sum += pow(3, $p) * $digit;
		}
		
		if ($sum % 7 == 0) {
			echo "Liczba " . $x . " jest podzielna przez 7";
			return true;
		} else {
			echo "Liczba " . $x . " nie jest podzielna przez 7";
			return false;
		}
	}

	function p8 ($x) {
		if (p2($x, false) && p4($x, false)) {
			echo "Liczba " . $x . " jest podzielna przez 8";
			return true;
		} else {
			echo "Liczba " . $x . " nie jest podzielna przez 8";
			return false;
		}
	}

	function p9 ($x) {
		$strX = (string)$x;
		$strlen = strlen($strX);
		$sum = 0;

		for ($i = 0; $i < $strlen; $i++) {
			$sum += (int)($strX[$i]);
		}

		if ($sum % 9 == 0) {
			echo "Liczba " . $x . " jest podzielna przez 9";
			return true;
		}else {
			echo "Liczba " . $x . " nie jest podzielna przez 9";
			return false;
		}
	}

	function p10 ($x) {
		$strX = (string)$x;
		if($strX[strlen($strX) - 1] == "0") {
			echo "Liczba " . $x . " jest podzielna przez 10";
			return true;
		} else {
			echo "Liczba " . $x . " nie jest podzielna przez 10";
			return false;
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8'>
	<title>PHP 7</title>
	<style>
        button {
            color: blue;
        }

        button[name='p2'] {
            background-color: red;
        }

        button[name='p3'] {
            background-color: limegreen;
        }

        button[name='p4'] {
            background-color: yellow;
        }

        button[name='p5'] {
            background-color: cyan;
        }

        button[name='p6'] {
            background-color: darkred;
        }

        button[name='p7'] {
            background-color: yellowgreen;
        }

        button[name='p8'] {
            background-color: dodgerblue;
        }

        button[name='p9'] {
            background-color: darkslategrey;
        }

        button[name='p10'] {
            background-color: purple;
        }
	</style>
</head>
<body>
	<form method='POST' action='index.php'>
		<div id='buttons'>
			<p>Podaj liczbę:</p>
			<br />
			<input type="number" name="x">
			<br />
			<button type='submit' name='p2'>Przez 2</button>
			<button type='submit' name='p3'>Przez 3</button>
			<button type='submit' name='p4'>Przez 4</button>
			<button type='submit' name='p5'>Przez 5</button>
			<button type='submit' name='p6'>Przez 6</button>
			<button type='submit' name='p7'>Przez 7</button>
			<button type='submit' name='p8'>Przez 8</button>
			<button type='submit' name='p9'>Przez 9</button>
			<button type='submit' name='p10'>Przez 10</button>
		</div>
	</form>
	<br />
<?php
    if (isset($_POST['x'])) {
        if (isset($_POST['p2'])) {
            p2($_POST['x'], true);
        }
        if (isset($_POST['p3'])) {
            p3($_POST['x'], true);
        }
        if (isset($_POST['p4'])) {
            p4($_POST['x'], true);
        }
        if (isset($_POST['p5'])) {
            p5($_POST['x']);
        }
        if (isset($_POST['p6'])) {
            p6($_POST['x']);
        }
        if (isset($_POST['p7'])) {
            p7($_POST['x']);
        }
        if (isset($_POST['p8'])) {
            p8($_POST['x']);
        }
        if (isset($_POST['p9'])) {
            p9($_POST['x']);
        }
        if (isset($_POST['p10'])) {
            p10($_POST['x']);
        }
    }
?>
</body>
</html>