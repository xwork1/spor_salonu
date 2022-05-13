import 'package:hive/hive.dart';
import 'package:spor_salonu/model/vucut_ekle_model.dart';

abstract class LocalStorage {
  Future<void> addBody({required BodyModel bodymodel});
  Future<BodyModel?> getBody({required String id});
  Future<List<BodyModel>> getAllBody();
  Future<bool> deleteBody({required BodyModel bodymodel});
}

class HiveLocalStorage extends LocalStorage {
  late Box<BodyModel> _bodyBox;

  HiveLocalStorage() {
    _bodyBox = Hive.box<BodyModel>('bodys');
  }
  @override
  Future<void> addBody({required BodyModel bodymodel}) async {
    await _bodyBox.put(bodymodel.id, bodymodel);
  }

  @override
  Future<bool> deleteBody({required BodyModel bodymodel}) async {
    await bodymodel.delete();
    return true;
  }

  @override
  Future<List<BodyModel>> getAllBody() async {
    List<BodyModel> _allBody = <BodyModel>[];
    _allBody = _bodyBox.values.toList();
    if (_allBody.isNotEmpty) {
      _allBody.sort(
          (BodyModel a, BodyModel b) => a.createdAt.compareTo(b.createdAt));
    }
    return _allBody;
  }

  @override
  Future<BodyModel?> getBody({required String id}) async {
    if (_bodyBox.containsKey(id)) {
      return _bodyBox.get(id);
    } else {
      return null;
    }
  }
}
