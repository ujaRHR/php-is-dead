<?php
// Integers are between -2147483648 and 2147483647.

$i = 34;
var_dump(is_int($i));
$f = 23.509384;
var_dump(is_float($f));

echo round(($i + $f), 2); // Float upto 2 Decimal Points

$number = 7490050;

// Formatting Large Number
echo number_format($number);

// using the default number_format function
$new_num = 58;
echo number_format($new_num, 2, ".", "");

printf("\nBinary of $new_num is %b", $new_num);
printf("\nFloat of $new_num is %f", $new_num);
printf("\nOctal of $new_num is %o", $new_num);
printf("\nHexaDecimal of $new_num is %x", $new_num);