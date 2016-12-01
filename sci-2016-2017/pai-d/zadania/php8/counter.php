<?php
    $fn = 'counter.txt';
    $counter = (int)file_get_contents($fn);
    
    if (!isset($_COOKIE['lastVisit'])) {
        setcookie('lastVisit', 'k', time() + 30);
        file_put_contents($fn, ++$counter);
    }

    echo 'Odwiedzono nas ' . $counter . ' razy.';
?>