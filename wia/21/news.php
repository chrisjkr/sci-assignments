<?php

if((int)$_GET['id'] == 1) {
  echo "
    <news>
      <article>
        <img>https://i.ytimg.com/vi/Dkm8Hteeh6M/maxresdefault.jpg</img>
      </article>

      <article>
        <img>http://i.imgur.com/q96FkXe.jpg</img>
      </article>
      
      <article>
        <img>https://coubsecure-a.akamaihd.net/get/b247/p/coub/simple/cw_timeline_pic/a1b5593ad5e/06238fe4be1c018186179/big_1458929593_image.jpg</img>
      </article>
    </news>
  ";
} elseif ((int)$_GET['id'] == 2) {
  echo "
    <news>
      <article>
        <img>https://i.ytimg.com/vi/nytzHVEHLLs/hqdefault.jpg</img>
      </article>

      <article>
        <img>https://i.ytimg.com/vi/3V3gkStkZ0k/maxresdefault.jpg</img>
      </article>
      
      <article>
        <img>https://i.ytimg.com/vi/nqfNzH9wuP0/maxresdefault.jpg</img>
      </article>
    </news>
  ";
} elseif ((int)$_GET['id'] == 3) {
  echo "
    <news>
      <article>
        <img>http://i.imgur.com/KTtBikR.jpg</img>
      </article>

      <article>
        <img>http://www.telegraph.co.uk/content/dam/film/AntMan/antman-xlarge.jpg</img>
      </article>
      
      <article>
        <img>http://i.imgur.com/vNlsRbF.jpg</img>
      </article>
    </news>
  ";
}

?>