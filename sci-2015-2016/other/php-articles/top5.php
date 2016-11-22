
<html>
  <head>
    <meta charset="UTF-8">
  </head>
  <body>

<?php

require_once('mysqli-connect.php');


$query = "SELECT * FROM articles ORDER BY views DESC LIMIT 5";
$response = @mysqli_query($dbc, $query);

if($response) {
  echo '<ul>';
  while($row = mysqli_fetch_array($response)) {
      echo '<li>
              <p>
                <a href="/artykul.php?id=' . $row['id'] . '">' . 
                  '<b>'
                    . $row['title'] . ' (' . $row['views'] . ' wyświetleń)
                  </b></a>
              </p>
              <p>'
                . $row['content'] . '
              </p>
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