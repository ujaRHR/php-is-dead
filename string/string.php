<?php

$text = "String Manipulation in PHP!";

// Length of String
echo strlen($text);

// Count Number of Words
echo str_word_count($text);

// Converting to Lowercase
echo strtolower($text);

// Converting to Uppercase
echo strtoupper($text);

// Capitalize the String
echo ucwords($text);

// Reverse String
echo strrev($text);

// String Replace
echo str_replace("PHP", "Ruby", $text);

$search = array("String", "PHP");
$replace_with = array("Conditional", "Ruby");
echo str_replace($search, $replace_with, $text);