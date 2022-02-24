import 'dart:convert';

class Egzersiz {
  String imagePath;
  String name;
  String instruction;

  Egzersiz({
    required this.imagePath,
    required this.name,
    required this.instruction,
  });
  
  //veriyi db'ye göndermek için
  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'name': name,
      'instruction': instruction,
    };
  }
  //baglantı kurmak için
  factory Egzersiz.fromMap(Map<String, dynamic> map) {
    return Egzersiz(
      imagePath: map['imagePath'] ?? '',
      name: map['name'] ?? '',
      instruction: map['instruction'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Egzersiz.fromJson(String source) => Egzersiz.fromMap(json.decode(source));

  @override
  String toString() => 'Egzersiz(imagePath: $imagePath, name: $name, instruction: $instruction)';
}
