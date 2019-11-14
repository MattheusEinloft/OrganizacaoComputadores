const fractionalPart = 0.2345;
const numBits = 7;
const binaryArray = [];

function longMultiplication(fractionalPart, numBits) {
  let multiplicand = fractionalPart;
  // multiplicator = 2
  let product;

  let bitsCount = 0;
  do {
    bitsCount++;

    // product = multiplicand * 2;
    product = Number(multiplicand * 2).toFixed(numBits);

    console.log(multiplicand.toString().replace('.', ',') + ' * 2 = ' + product.toString().replace('.', ','));

    multiplicand = Number(product - Math.floor(product)).toFixed(numBits);

    binaryArray.push(parseInt(product));

  } while(((product - Math.floor(product)) !== 0) && (bitsCount !== numBits));

  console.log('Multiplicacao encerrada!');
}

longMultiplication(fractionalPart, numBits);

let fractionalPartBinary = binaryArray.join('');

console.log(fractionalPartBinary);