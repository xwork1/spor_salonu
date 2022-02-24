import 'dart:convert';

class Endeks {
  final String kisim;
  final int boyut;
  final int kilo;
  final DateTime tarih;
  Endeks({
    required this.kisim,
    required this.boyut,
    required this.kilo,
    required this.tarih,
  });

  Map<String, dynamic> toMap() {
    return {
      'kisim': kisim,
      'boyut': boyut,
      'kilo': kilo,
      'tarih': tarih.millisecondsSinceEpoch,
    };
  }

  factory Endeks.fromMap(Map<String, dynamic> map) {
    return Endeks(
      kisim: map['kisim'] ?? '',
      boyut: map['boyut']?.toInt() ?? 0,
      kilo: map['kilo']?.toInt() ?? 0,
      tarih: DateTime.fromMillisecondsSinceEpoch(map['tarih']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Endeks.fromJson(String source) => Endeks.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endeks(kisim: $kisim, boyut: $boyut, kilo: $kilo, tarih: $tarih)';
  }
}
