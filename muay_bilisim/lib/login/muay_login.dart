import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muay_bilisim/login/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //bool değer
      onWillPop: _onWillPop,
      child: GestureDetector(
        onTap: () => Focus.of(context).unfocus(),
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: LoginController(),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Uygulamadan Çıkılıyor"),
                  content: const Text("Emin misiniz?"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                        child: const Text(
                          "EVET",
                          style: TextStyle(color: Colors.red),
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("HAYIR",
                          style: TextStyle(color: Colors.black54)),
                    ),
                  ],
                ))) ??
        false;
  }
}
