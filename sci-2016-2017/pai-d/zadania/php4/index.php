<html>
    <head>
    <meta charset="utf-8">
    </head>
    <body>
        <form method="post">
            Zad 1. <input type="text" name="zad1" min="0" max="50"/>
            <input type="submit" name="silnia" value="silnia"/>
            <input type="submit" name="potega" value="potega"/>
            <br><br>
            Zad 2. <br> 
            <input type="number" name="zad2_1"/>
            <input type="number" name="zad2_2"/>
            <input type="submit" name="nww_nwd" value="NWD i NWW">
        </form>
    </body>
</html>
<?php
    error_reporting(E_ALL ^ E_NOTICE);

    if( isset( $_POST["silnia"]) ){
        preg_match("/([0-9]+[\.,]?)+/",$_POST["zad1"],$match);
        if(!empty($match[0])) {
            $value = (int)$match[0];
        } else {
            $value = "nope";
        }
        if($value == "nope"){
           echo "Wpisz liczbę naturalną od 0 do 50!";
        }else{
            $silnia  = 1;
            for($i = 1; $i <= $value; $i++){
                $silnia *= $i;
            }
            echo "Silnia: ".$silnia;
        }
    }
    if( isset( $_POST["potega"]) ){
        $zad = (int)$_POST['zad1'];
        if(is_int($zad)){
            echo "<br> 2 <sup>".$zad."</sup> = ".pow(2,$zad);
        }else{
            echo "Wpisz liczbę naturalną od 0 do 50!";
        }
    }
    $a = $_POST["zad2_1"];
    $b = $_POST["zad2_2"];
    $x = $a;
    $y = $b;
    if( isset( $_POST["nww_nwd"]) ){
        $a = (int)$a;
        $b = (int)$b;
        if( ( is_int($a) && is_int($b)  ) ){
            $a = (int)$a;
            $b = (int)$b;
            if($a != 0 && $b != 0){
                while ($a != $b) {
                    if ($a < $b) {
                        $helper = $a; 
                        $a = $b; 
                        $b = $helper;
                    } 
                    $a = $a - $b;
                }
                $nww = ($x * $y) / $a;
                echo "<br><br>NWD: ".$a;
                echo "<br><br>NWW: ".$nww;
            }else{
                echo "Wpisałeś zera...";
            }
        }else{
            echo "Wpisz liczbę";
        }
    }
?>
