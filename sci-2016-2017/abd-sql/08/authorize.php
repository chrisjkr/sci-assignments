<?php

error_reporting(0);

$server = 'localhost';
$db = '2016_11_17';

if(isset($_POST['user']) && isset($_POST['pass'])) {
	$user = $_POST['user'];
	$pass = $_POST['pass'];

	$c = new mysqli($server, $user, $pass, $db);
	if($c->connect_error) {
		echo('<h1>Wrong credentials</h1>');
	} else {
		$data = $c->query('SELECT * FROM dane');
		if ($data->num_rows > 0) {
			echo '<table>';
			echo '
				<tr>
				<th>PESEL</th>
				<th>Imię</th>
				<th>Nazwisko</th>
				<th>Data urodzenia</th>
				<th>Miejsce urodzenia</th>
				</tr>';
			while($row = $data->fetch_assoc()) {
				echo '
					<tr>
					<td>' . $row['pesel'] . '</td>
					<td>' . $row['imie'] . '</td>
					<td>' . $row['nazwisko'] . '</td>
					<td>' . $row['data_urodzenia'] . '</td>
					<td>' . $row['miejsce_urodzenia'] . '</td>
					</tr>';
			}
			echo '</table>';
		}
	}
} else {
	echo '<h2>Missing data in form.</h2>';
}

?>