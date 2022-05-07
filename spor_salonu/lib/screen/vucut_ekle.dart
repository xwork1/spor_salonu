import 'package:flutter/material.dart';

import '../constants.dart';

class AddBody extends StatefulWidget {
  const AddBody({Key? key}) : super(key: key);

  @override
  State<AddBody> createState() => _AddBodyState();
}

class _AddBodyState extends State<AddBody> {
  //formkey
  final _formkey = GlobalKey<FormState>();

  //controller
  final _kisimController = TextEditingController();
  final _uzunlukController = TextEditingController();
  final _tarihController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final kisimfield = TextFormField(
      controller: _kisimController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        _kisimController.text = value!;
      },
      decoration: InputDecoration(
        hintText: "Kısım Girin:",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final uzunlukfield = TextFormField(
      controller: _uzunlukController,
      keyboardType: TextInputType.text,
      onSaved: (value) {
        _uzunlukController.text = value!;
      },
      decoration: InputDecoration(
        hintText: "Uzunluk Girin:",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    final tarihfield = TextFormField(
      controller: _tarihController,
      keyboardType: TextInputType.datetime,
      onSaved: (value) {
        _tarihController.text = value!;
      },
      decoration: InputDecoration(
        hintText: "Tarih Girin:",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: kisimfield),
                        const SizedBox(width: 10),
                        Expanded(child: uzunlukfield),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: tarihfield),
                        const SizedBox(width: 10),
                        Expanded(child: TextFormField()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
