void main() {
  List<int> a = [10, 5, 8, 3, 6, 2, 7, 4, 9, 1];
  List<int> b = [20, 15, 18, 13, 16, 12, 17, 14, 19, 11];
  List<int> largest = [...a, ...b];
  int max = largest[0];
  int secondMax = largest[0];

  for (int i in largest) {
    if (i > max) {
      secondMax = max;
      max = i;
    } else if (i > secondMax && i != max) {
      secondMax = i;
    }
  }
  print("Nilai terbesar kedua adalah: $secondMax");
}
