import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Gunting-Batu-Kertas, pilih salah satu: ');
  String? input = stdin.readLineSync();

  if (input == null ||
      !(input.toLowerCase() == 'gunting' ||
          input.toLowerCase() == 'batu' ||
          input.toLowerCase() == 'kertas')) {
    print('Pilihan tidak valid. Silakan pilih gunting, batu, atau kertas.');
    return;
  }

  List<String> choices = ['gunting', 'batu', 'kertas'];
  String computerChoice = choices[Random().nextInt(3)];
  print('Komputer memilih: $computerChoice');

  if (input.toLowerCase() == computerChoice) {
    print('Hasil: Seri!');
  } else if ((input.toLowerCase() == 'gunting' && computerChoice == 'kertas') ||
      (input.toLowerCase() == 'batu' && computerChoice == 'gunting') ||
      (input.toLowerCase() == 'kertas' && computerChoice == 'batu')) {
    print('Hasil: Kamu menang!');
  } else {
    print('Hasil: Komputer menang!');
  }
}
