<?php
header('Content-Type: text/xml');
echo '<?xml version="1.0" encoding="UTF-8" standlone="yes" ?>';

echo '<response>';
  $food = $_.GET['food'];
  $foodArray = array('tuna', 'bacon', 'beef', 'loaf','ham');
  if(in_array($food, $foodArray))
    echo 'We do have ' .$food. '!';
  elseif ($food=='')
    echo 'Enter a food you idiot'
  else
    echo 'Sorry we don\'t sell' .$food. '!';
echo '</response>';

?>
