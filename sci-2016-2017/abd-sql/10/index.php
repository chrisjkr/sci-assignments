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

        $STH = $DBH->prepare("
        CREATE TABLE danerozszerzone (
            wzrost int(4),
            waga int(4),
            kolor_oczu varchar(50),
            pesel bigint NOT NULL,my
            PRIMARY KEY (pesel),
            FOREIGN KEY (pesel) REFERENCES dane(pesel)
        );");

        $file = file_get_contents('danerozszerzone.txt');
        $rows = explode(PHP_EOL, $file);
        $query = 'INSERT INTO daterozszerzone (pesel, wzrost, waga, kolor_oczu) VALUES';
        for ($i = 1; $i < sizeof($rows); $i++) {
            $values = explode(';', $rows[$i]);
            if ($i == sizeof($rows) - 1) {
                $query += " (" . $values[0] . ", " . $values[1] . ", " . $values[2] . ", '" . $values[3] . "');";
            } else {
                $query = $query . " (" . $values[0] . ", " . $values[1] . ", " . $values[2] . ", '" . $values[3] . "'),";
            }
        }
        $STH = $DBH->prepare($query);
        $STH->execute();
        echo "Imported data from file.";

        $query = $DBH->prepare('SELECT imie, nazwisko, wzrost
                                FROM dane
                                JOIN danerozszerzone
                                ON dane.pesel = danerozszerzone.pesel
                                WHERE danerozszerzone.wzrost > 170');
        $query->execute();
        while($row = $query->fetch(PDO::FETCH_OBJ)) {
            echo "Imie: " . $row->imie . " Nazwisko: " . $row->nazwisko . "Wzrost: " . $row->wzrost;
        }
    } catch (PDOException $e) {
        echo $e;
    }
?>