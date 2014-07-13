<?php
class FizzBuzz
{
    protected $start;
    protected $end;

    public function __construct($start, $end)
    {
        $this->start = $start;
        $this->end = $end;
    }

    public function publish()
    {
        for ($i = $this->start; $i <= $this->end; $i++) {
            $fizzbuzz = $this->evaluate($i);
            $this->render($fizzbuzz);
        }
    }

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
