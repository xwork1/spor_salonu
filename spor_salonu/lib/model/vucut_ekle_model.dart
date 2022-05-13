import 'package:hive/hive.dart';

part 'vucut_ekle_model.g.dart';

@HiveType(typeId: 1)
class BodyModel extends HiveObject{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String bolge;
  @HiveField(2)
  final String olcu;
  @HiveField(3)
  final String hedef;
  @HiveField(4)
  final DateTime createdAt;

  BodyModel({
    required this.id,
    required this.bolge,
    required this.olcu,
    required this.hedef,
    required this.createdAt
  });
}
