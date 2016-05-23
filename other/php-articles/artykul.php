
<html>
  <head>
    <meta charset="UTF-8">
  </head>
  <body>

<?php

require_once('mysqli-connect.php');

$id = $_GET['id'];

$updateQuery = "UPDATE articles SET views = views + 1 WHERE id = " . $id;
$updateResponse = @mysqli_query($dbc, $updateQuery);

$query = "SELECT * FROM articles WHERE `id`=" . $id;
$response = @mysqli_query($dbc, $query);

if($response) {
  echo '<ul>';
  while($row = mysqli_fetch_array($response)) {
      echo '<li>
              <p><b>' . $row['title'] . ' (' . $row['views'] . ' wyświetleń)</b></p>
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