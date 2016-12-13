<?php
  $connection = new mysqli('localhost', 'root', '', 'szkola');

  if ($connection->connect_error) {
    die('Nie można połączyć z bazą danych. Szczegóły błędu: '.$connection->connect_error);
  }

  $queriesF = file_get_contents('kwerendy.txt') or die('Nie udało się otworzyć pliku.');
  $queries = explode('\n', fread($queriesF, filesize('kwerendy.txt')));
  $queriesArr = array();
  for ($i = 0; $i < count($queries); $i++) {
    $tmp = explode(':', $queries[$i]);
    $queriesArr[$tmp[0]] = $tmp[1];
  }
?>

<!DOCTYPE html>
<html lang='pl'>
  <head>
    <title>Szkoła Podstawowa</title>
    <meta charset='UTF-8'>
    <link href='style.css' rel='stylesheet'>
  </head>
  <body>
    <div class='bg baner'>
      <h1>Oceny uczniów: biologia</h1>
    </div>
    <div class='row'>
      <div class='left'>
        <h3>
          Uczeń: 
          <?php
            $sql2 = $queriesArr['zapytanie 2'];
            $result = $connection->query($sql2);
            if ($result->num_rows > 0) {
              while($row = $result->fetch_assoc()) {
                  echo $row['imie'].' '.$row['nazwisko'];
              }
            }
          ?>
        </h3>

        <p>
          Najwyższa ocena z biologii:
          <?php
            $sql3 = $queriesArr['zapytanie 3'];
            $result2 = $connection->query($sql3);
            if ($result2->num_rows > 0) {
              while($row = $result2->fetch_assoc()) {
                  echo $row['najwyzsza_ocena'];
              }
            }
          ?>
        </p>
      </div>

      <div class='right'>
        <h3>Nazwiska i numery PESEL uczniów:</h3>
        <ul>
          <?php
            $sql1 = $queriesArr['zapytanie 1'];
            $result3 = $connection->query($sql1);
            if ($result3->num_rows > 0) {
              while($row = $result3->fetch_assoc()) {
                  echo '<li>'.$row['nazwisko'].' '.$row['PESEL'];
              }
            }
          ?>
        </ul>
      </div>
    </div>

    <footer class='footer bg'>
      <h2>Szkoła Podstawowa</h2>
      <p>Stronę stworzył: Krzysztof Kraszewski</p>
    </footer>
  </body>
</html>
