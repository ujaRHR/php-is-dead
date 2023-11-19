<?php

$num = 35;

for ($i = 0; $i <= $num; $i += 2) {
    echo "$i ";
}

// Looping through an Array
$number = [1, 2, 3, 4, 5, 6, 7, 8, 9];
$length = count($number);

for ($i = 0; $i < $length; $i++) {
    echo "$number[$i] ";
}