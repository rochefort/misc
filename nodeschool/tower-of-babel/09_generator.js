const max = process.argv[2];
let FizzBuzz = function*() {
  let num = 1;
  while(num <= max) {
    let value = num;
    if (num % 15 === 0) {
      value = 'FizzBuzz';
    } else if (num % 3 === 0) {
      value = 'Fizz';
    } else if (num % 5 === 0) {
      value = 'Buzz';
    }
    num++;
    yield value;
  }
}();

for (var n of FizzBuzz) {
  console.log(n);
}
