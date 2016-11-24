<!DOCTYPE html>
<html>
    <head>
        <title>PHP 3</title>
        <meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <link rel="stylesheet" href="index.css" type="text/css" />
        <script type="text/javascript">
            $(function(){
                $('label').width($('input').width());
                console.log($('#1').width());
            });
        </script>
    </head>
    <body>
        <h3>Rozwiąż równanie kwadratowe:</h2>
        <div class="form">
        </div>
        <form action="" method="post">
            <div class="form">
                <div>
                <label for="a">a</label>
                <label for="b" class="label">b</label>
                <label for="c" class="label2">c</label>
                </div>

                <input type="number" name="a"/><span id="1"> x<sup>2</sup> +</span>
                <input type="number" name="b"/><span>x +</span>
                <input type="number" name="c"/><span> = 0</span>
            </div>
            <div class="form">
                <input class="submit" type="submit" value="Rozwiąż"/>
            </div>
        </form>
        
        <?php 
           if(!empty($_POST['a']) && $_POST['a'] !== 0){
              $delta = pow($_POST['b'], 2) - (4 * $_POST['a'] * $_POST['c']);
              if($delta == 0){
                  $x = (-$_POST['b'] / (2 * $_POST['a']));
                  echo 'x = '.$x;
              } else if ($delta > 0){
                  $x1 = (-$_POST['b'] - sqrt($delta)) / (2 * $_POST['a']);
                  $x2 = (-$_POST['b'] + sqrt($delta)) / (2 * $_POST['a']);
                  echo '<div>x<sub>1</sub> = '.round($x1,2).'</div><div> x<sub>2</sub> = '.round($x2,2);
              } else if ($delta < 0){
                  echo 'Delta mniejsza od zera. &Delta; = '.$delta;
              }
           } else {
               echo 'Parametr a nie może być pusty lub równy 0!';
           }
        ?>
    </body>
</html>