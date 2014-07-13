<?php
require_once __DIR__ . '/class/FizzBuzz.php';

$obj = new FizzBuzz(1, 20);
$obj->publish();

// for ($i=1; $i <= 20; $i++) {
//     $fizzbuzz = $obj->evaluate($i);
//     $obj->render($fizzbuzz);
// }
