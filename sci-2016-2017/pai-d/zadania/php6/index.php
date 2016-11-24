<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <?php
            // 1.
            $imiona = fopen('imiona.txt', 'r') or die('Nie mozna otworzyc pliku');
            $imionaCzyste = fopen('imiona_czyste.txt', 'w') or die('Nie mozna stworzyc pliku');
            $i = 0;
            while(!feof($imiona)) fwrite($imionaCzyste, preg_replace('/\s+/', '', fgets($imiona))."\n") && $i++;
            fclose($imiona) and fclose($imionaCzyste);
            
            // 2.
            $imionaCzyste = fopen('imiona_czyste.txt', 'r') or die('Nie mozna otworzyc pliku');
            while(!feof($imionaCzyste)) {
                $imie = fgets($imionaCzyste);
                echo "Imię ".$imie." zaczyna się na literę ".$imie[0]."<br />";
            }
            fclose($imionaCzyste);
            
            // 3.
            $imionaCzyste = fopen('imiona_czyste.txt', 'r') or die('Nie mozna otworzyc pliku');
            $l = array();
            while(!feof($imionaCzyste)) $l[fgets($imionaCzyste)[0]]++;
            foreach($l as $k => $v) {
                if (preg_match("/[A-Z]/", $k)) echo $k.": ".$v."<br />";
            }
            fclose($imionaCzyste);
            
            // 4.
            $imionaCzyste = fopen('imiona_czyste.txt', 'r') or die('Nie mozna otworzyc pliku');
            $niepuste = 0;
            $znaki = 0;
            while(!feof($imionaCzyste)) {
                $imie = fgets($imionaCzyste);
                if(preg_match("/[A-Z]/", $imie)) $niepuste++;
                $znaki += strlen($imie);
            }
            
            echo "Niepuste linie: ".$niepuste."<br />";
            echo "Znaki: ".$znaki."<br />";
        ?>
    </body>
</html>

