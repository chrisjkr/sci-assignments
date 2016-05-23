<?php

require_once('mysqli-connect.php');

echo '<html>
        <head>
          <meta charset="UTF-8">
        </head>
        <body>';

$query = "SELECT * FROM artykuly";
$response = @mysqli_query($dbc, $query);

if($response) {
  echo '<ul>';
  while($row = mysqli_fetch_array($response)) {
      echo '<li>
              <p><b>' . $row['title'] . '(' . $row['views'] . ' wyświetleń)</b></p>
              <p>' . $row['content'] . '</p>
            </li>
          </ul>';
    }
  echo '</ul>';
} else {
  echo "Nie udało się pobrać danych z bazy.";
  echo mysqli_error($dbc);
}

mysqli_close($dbc);

echo '</body>
      </html';

?>