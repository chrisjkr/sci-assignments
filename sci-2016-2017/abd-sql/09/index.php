<?php
    try {
        $DBH = new PDO("mysql:host=localhost;dbname=dbnowa", "wdbnowa", "wdbnowa123");
        $DBH->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
        echo "Connected to database.";
        $STH = $DBH->prepare("CREATE TABLE dane (
                              pesel bigint NOT NULL,
                              imie varchar(20),
                              nazwisko varchar(50),
                              PRIMARY KEY (pesel)
                              );");
        $STH->execute();
        echo "Created table dane";
        
        $STH = $DBH->prepare("INSERT INTO dane (pesel, imie, nazwisko)
                              VALUES (89030312345, 'Andrzej', 'Biały'),
                                     (72102176543, 'Małgorzata', 'Wiśniewska'),
                                     (02321204567, 'Błażej', 'Prążkowski');");
        $STH->execute();
        echo "Inserted data into table dane";
    } catch (PDOException $e) {
        echo $e;
    }
?>