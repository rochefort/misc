<?php

class FizzBuzz
{
    public function evaluate($i)
    {
        if ($i % 3 === 0 && $i % 5 === 0) {
            return 'FizzBuzz';
        } else if ($i % 3 === 0) {
            return 'Fizz';
        } else if ($i % 5 === 0) {
            return 'Buzz';
        } else {
            return $i;
        }
    }

    public function render($output)
    {
        echo $output . PHP_EOL;
    }
}
