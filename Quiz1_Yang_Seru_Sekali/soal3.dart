import 'dart:io';
import 'dart:math';

void main () {
  final random = Random();
  int randomNumber = random.nextInt(100) + 1;
  int attempts = 0;

  while (true) {
    stdout.write("Tebak angka antara 1 sampai 100: ");
    String? input = stdin.readLineSync();
    int? inputNumber = int.tryParse(input ?? '');
    attempts++;

    if (inputNumber == null) {
      print("Input tidak valid. Silakan coba lagi.");
      continue;
    }

    if (inputNumber > randomNumber) {
      print("Terlalu tinggi! Coba lagi.");
    } else if (inputNumber < randomNumber) {
      print("Terlalu rendah! Coba lagi.");
    } else {
      print("Selamat! Kamu menebak angka $randomNumber dalam $attempts percobaan.");
      break;
    }
  }
}