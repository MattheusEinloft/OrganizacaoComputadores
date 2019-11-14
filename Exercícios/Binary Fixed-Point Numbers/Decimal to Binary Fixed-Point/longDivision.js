const integerPart = 118;
const binaryArray = [];

function longDivision(integerPart) {
  let dividend = integerPart;
  let quotient;
  let remainder;

  do {
    quotient = dividend / 2;
    remainder = dividend % 2;

    console.log(dividend + ' / 2 = ' + quotient.toString().replace('.', ',') + '\t' + 'resto = ' + remainder);

    dividend = parseInt(quotient);

    binaryArray.push(remainder);

  } while(parseInt(quotient) !== 0);

  console.log('Divisao encerrada!');
}

longDivision(integerPart);

let integerPartBinary = binaryArray.reverse().join('');

console.log(integerPartBinary);