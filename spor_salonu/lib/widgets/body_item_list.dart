import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spor_salonu/screen/istatistik/model/vucut_ekle_model.dart';

class BodyItem extends StatefulWidget {
  final BodyModel bodymodel;
  const BodyItem({Key? key, required this.bodymodel}) : super(key: key);

  @override
  State<BodyItem> createState() => _BodyItemState();
}

class _BodyItemState extends State<BodyItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              blurRadius: 10,
            ),
          ]),
      child: ListTile(
        title: Text(widget.bodymodel.bolge),
        trailing: Text(DateFormat('yMd').format(widget.bodymodel.createdAt) +
            DateFormat(' H:m').format(widget.bodymodel.createdAt)),
        subtitle: Text('Ölçünüz: ${widget.bodymodel.olcu}cm' +
            ' \nHedef Ölçünüz: ${widget.bodymodel.hedef}cm'),
      ),
    );
  }
}
