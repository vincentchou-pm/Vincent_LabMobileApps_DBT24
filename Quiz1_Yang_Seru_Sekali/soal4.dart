import 'dart:io';

void main() {
  stdout.write("Masukkan Angka Prima: ");
  int input = int.parse(stdin.readLineSync()!);
  bool isPrime = true;

  for (int i = 2; i <= input / 2; i++) {
    if (input % i == 0) {
      isPrime = false;
      break;
    }
  }

  if (isPrime) {
    print("$input adalah angka prima.");
  } else {
    print("$input bukan angka prima.");
  }
}
