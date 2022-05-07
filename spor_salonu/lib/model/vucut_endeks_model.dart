import 'dart:convert';



class Endeks {
  final String kisim;
  final String boyut;
  final String kilo;
  final DateTime tarih;
  Endeks({
    required this.kisim,
    required this.boyut,
    required this.kilo,
    required this.tarih,
  });
  

  

  Endeks copyWith({
    String? kisim,
    String? boyut,
    String? kilo,
    DateTime? tarih,
  }) {
    return Endeks(
      kisim: kisim ?? this.kisim,
      boyut: boyut ?? this.boyut,
      kilo: kilo ?? this.kilo,
      tarih: tarih ?? this.tarih,
    );
  }

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
      boyut: map['boyut'] ?? '',
      kilo: map['kilo'] ?? '',
      tarih: DateTime.fromMillisecondsSinceEpoch(map['tarih']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Endeks.fromJson(String source) => Endeks.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Endeks(kisim: $kisim, boyut: $boyut, kilo: $kilo, tarih: $tarih)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Endeks &&
      other.kisim == kisim &&
      other.boyut == boyut &&
      other.kilo == kilo &&
      other.tarih == tarih;
  }

  @override
  int get hashCode {
    return kisim.hashCode ^
      boyut.hashCode ^
      kilo.hashCode ^
      tarih.hashCode;
  }
}
