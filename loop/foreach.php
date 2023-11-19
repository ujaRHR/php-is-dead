<?php

$number = array(1, 2, 3, 4, 5, 6, 7, 8, 9);

foreach ($number as $value) {
    echo "$value ";
}

// For key => value pair
$grades = array(
    "Alex" => "A+",
    "Jonathan" => "C",
    "Jenny" => "B+",
    "Hemilton" => "B",
    "Paul" => "B-",
);

foreach ($grades as $name => $value) {
    echo "$name got $value";
}