<?php
class FizzBuzzTest extends PHPUnit_Framework_TestCase
{
  public function testRender()
  {
    $expected = <<<EOT
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz

EOT;
    $this->expectOutputString($expected);
    include __DIR__ . '/../fizzbuzz.php';
  }
}
