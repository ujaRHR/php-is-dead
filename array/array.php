<?php

// 1. Create an array
$animal = array("Dog", "Cat", "Cow", "Lion", "Tiger", "Dog");

// Removing duplicates items
$animal = array_unique($animal);

print_r($animal);
echo "Length of the array is " . count($animal);

// Associative Array
$animal_sound = array(
    "Dog" => "Bark",
    "Cat" => "Meow",
    "Cow" => "Moo",
    "Lion" => "Roar",
    "Tiger" => "Growl",
);

// Loop through an Associative Array
foreach ($animal_sound as $name=>$sound){
    echo "\n$name -- $sound.";
}

// Sorting Array
sort($animal); // ascending
rsort($animal); // descending
asort($animal); // ascending by value
ksort($animal); // ascending by key
arsort($animal); // descending by value
krsort($animal); // descending by key