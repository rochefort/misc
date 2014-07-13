<?php
require_once __DIR__ . '/class/FizzBuzz.php';

$obj = new FizzBuzz();

for ($i=1; $i <= 20; $i++) {
    $fizzbuzz = $obj->evaluate($i);
    $obj->render($fizzbuzz);
}
