import 'dart:io';

class Ujian {
  int totalNilai = 0;
  int totalMahasiswa = 0;

  void tambahNilai(int nilai) {
    totalNilai += nilai;
    totalMahasiswa++;
  }

  num rataRata() {
    if (totalMahasiswa == 0) return 0;
    return totalNilai / totalMahasiswa;
  }
}

void main() {
  Ujian AvgNilai = Ujian();
  stdout.write("Rata-rata nilai dari 3 mahasiswa:\n");

  for (int i = 1; i <= 3; i++) {
    stdout.write("Masukkan nilai mahasiswa ke-$i: ");
    int nilai = int.parse(stdin.readLineSync()!);
    AvgNilai.tambahNilai(nilai);
  }

  print("Rata-rata nilai: ${AvgNilai.rataRata()}");
}
