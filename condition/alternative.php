<?php

// Alternative Syntax (More Readble / Skip...)

$discount = 0;

if ($country !== 'USA') :
// Do Nothing (Skip)
elseif ($coupon_discount > 0.3) :
    $discount = $subtotal * $coupon_discount;
elseif (count($cart) >= 10) :
    $discount = $subtotal * .3;
elseif ($coupon_discount > .15) :
    $discount = $subtotal * $coupon_discount;
elseif (count($cart) >= 5) :
    $discount = $subtotal * .15;
else :
    $discount = $subtotal * .05;
endif;
