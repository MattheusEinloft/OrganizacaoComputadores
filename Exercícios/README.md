# Exercícios

### Exercício 1
a = b - c;

### Exercício 2
b = a + c;

### Exercício 3
d = (a + b - c);

### Exercício 4
a = b[15] - c;

### Exercício 5
b = a[5] + c[3];

### Exercício 6
if (x == y) go to L2  
a[1] = b - c;  
b = a[2] + c;  
c = b + c[3];  
L2: a[4] = a[6] + a[5];  

### Exercício 7
if ( a == b ) {
  c = a + b;
  a = b - c;
}
else {
  b = a + c;
  c = b - c;
}

### Exercício 8
g = h + a[i]

### Exercício 9
while(save[i] == k) {
  i += 1;
}

### Exercício 10
switch(i) {
  case 0:
    a[i] = a[i] - 1;
    break;
  case 1:
    a[i] = a[i] + 1;
    break;
  case 2:
    a[i] = a[i] - 10;
    break;
};

### Exercício 11
int exemplo ( int g, int h, int i, int j) {
  int f;
  f = ( g + h ) - ( i + j );
  return f;
}

### Exercício 12
main() {
  n1 = 10;
  n2 = 15;
  printf(soma(n1,n2));
}

int soma ( int n1, int n2) {
  return ( n1 + n2 );
}