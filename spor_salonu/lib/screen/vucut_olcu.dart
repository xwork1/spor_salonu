import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:spor_salonu/data/local_storage.dart';
import 'package:spor_salonu/main.dart';
import 'package:spor_salonu/model/vucut_ekle_model.dart';
import 'package:spor_salonu/widgets/body_item_list.dart';
import 'package:uuid/uuid.dart';


class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  late List<BodyModel> _allBodys;
  late LocalStorage _localStorage;

  final _bolgeController = TextEditingController();
  final _olcuController = TextEditingController();
  final _hedefController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _allBodys = <BodyModel>[];
    _getAllBodyFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: GestureDetector(
          onTap: () {},
          child: const Text(
            'title',
            style: TextStyle(color: Colors.black),
          ).tr(),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              _showAddBody();
              /* Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const AddBody())));*/
            },
            icon: const Icon(Icons.add),
            color: Colors.black,
          ),
        ],
      ),
      body: _allBodys.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                var _oankiListeElemani = _allBodys[index];
                return Dismissible(
                    background: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Bu kısım silindi')
                      ],
                    ),
                    key: Key(_oankiListeElemani.id),
                    onDismissed: (direction) {
                      _allBodys.removeAt(index);
                      _localStorage.deleteBody(bodymodel: _oankiListeElemani);
                      setState(() {});
                    },
                    child: BodyItem(bodymodel: _oankiListeElemani));
              },
              itemCount: _allBodys.length,
            )
          : const Center(
              child: Text('Hadi Vücut Ölçünü Ekle'),
            ),
    );
  }

  void _showAddBody() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(hintText: 'Bölge Girin'),
                  controller: _bolgeController,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: const InputDecoration(hintText: 'Ölçü Girin'),
                  controller: _olcuController,
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration:
                      const InputDecoration(hintText: 'Hedef ölçü Girin'),
                  controller: _hedefController,
                ),
                const SizedBox(height: 8),
                MaterialButton(
                    child: const Text('Bölge Ekle'),
                    onPressed: () async {
                      final String bolge = _bolgeController.text;
                      final String olcu = _olcuController.text;
                      final String hedef = _hedefController.text;

                      BodyModel yeniEklenecekBody = BodyModel(
                          id: const Uuid().v1(),
                          bolge: bolge,
                          olcu: olcu,
                          hedef: hedef,
                          createdAt: DateTime.now());

                      _allBodys.add(yeniEklenecekBody);
                      await _localStorage.addBody(bodymodel: yeniEklenecekBody);
                      setState(() {});
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  void _getAllBodyFromDb() async {
    _allBodys = await _localStorage.getAllBody();
    setState(() {});
  }
}
