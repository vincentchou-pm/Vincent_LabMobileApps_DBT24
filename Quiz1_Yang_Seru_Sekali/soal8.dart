import 'dart:io';

void main() {
  stdout.write("Masukkan Angka: ");
  int perfectNumber = int.parse(stdin.readLineSync()!);

  int sum = 0;
  for (int i = 1; i < perfectNumber; i++) {
    if (perfectNumber % i == 0) {
      sum += i;
    }
  }

  if (sum == perfectNumber) {
    print("$perfectNumber adalah bilangan sempurna.");
  } else {
    print("$perfectNumber bukan bilangan sempurna.");
  }
}