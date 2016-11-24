<!DOCTYPE html>
<html>
    <head>
        <title>PHP5</title>
        <meta charset="utf-8">
    </head>
    <style type="text/css">
        div {
            margin: 20px;
        }
    </style>
    <body>
        <div>
            <form action="" method="post">
                Podaj dzień: 
                <input type="number" name="day"/>
                Podaj miesiąc:
                <input type="number" name="month"/>
                Podaj rok:
                <input type="number" name="year"/>
                <button type="submit">Wyślij</button>
            </form>
        </div>
        <div>
            <form action="" method="post">
                Podaj rok: 
                <input type="number" name="year2"/>
                <button type="submit">Wyślij</button>
            </form>
        </div>

        <?php
            // Zad. 1
            echo "<div>";
            echo date("F j, Y, g:i a")."<br>";
            echo date("m.d.y")."<br>";
            echo date("j.n.Y")."<br>";
            echo date("Y-m-d")."<br>";
            echo date('h-i-s, j-m-y, l')."<br>";
            echo "</div>";
            
            // Zad. 2
            if(!empty($_POST['month']) && !empty($_POST['year']) 
                && !empty($_POST['day']) && is_numeric($_POST['day']) 
                && is_numeric($_POST['month']) 
                && is_numeric($_POST['year'])) {
                $birth = mktime(0,0,0,$_POST['month'],$_POST['day'],$_POST['year']).'<br>';
                $today = mktime(0,0,0,date('n'),date('j'),date('Y'));
                $passed = $today - $birth;
                $days = $passed / 86400;
                echo '<div>Minęło '.$days.' dni</div>';
            }
            
            // Zad. 3
            if(!empty($_POST['year2']) && is_numeric($_POST['year2'])) {
                $year = $_POST['year2'];
                if((($year % 4 == 0) && ($year % 100 != 0)) || $year % 400 == 0) echo "Rok ".$year." jest przestępny";
                else echo "Rok ".$year." nie jest przestępny";
            }
        ?>

    </body>
</html>