import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spor_salonu/model/user_model.dart';
import 'package:spor_salonu/model/vucut_endeks_model.dart';

import '../constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLoading = false;

  final _auth = FirebaseAuth.instance;

  //formkey
  final _formkey = GlobalKey<FormState>();

  //controller
  final _nameSurnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _telNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //ad-soyad field
    final nameSurnameField = TextFormField(
      autofocus: false,
      controller: _nameSurnameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Kayıt için isim gerekli");
        }
        if (!regex.hasMatch(value)) {
          return ("Lütfen geçerli isim girin(Min 3 karakter)");
        }
        return null;
      },
      onSaved: (value) {
        _nameSurnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Ad-Soyad",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
      ),
    );
    //program süresi field
    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Kayıt için şifre gerekli");
        }
        if (!regex.hasMatch(value)) {
          return ("Lütfen geçerli şifre girin(Min 6 karakter)");
        }
        return null;
      },
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Şifre",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
      ),
    );
    //meslek field
    final jobField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Kayıt için Email adresini girin");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Geçerli bir mail adresi giriniz");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "E-Mail",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
      ),
    );
    //program tarihi field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: _confirmPasswordController,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (_passwordController.text.length > 6 &&
            _passwordController.text != value) {
          return "Şifre eşleşmedi!";
        }
        return null;
      },
      onSaved: (value) {
        _confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Şifreyi tekrarla",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
      ),
    );
    //telefon numarası field
    final telNumberField = TextFormField(
      autofocus: false,
      controller: _telNumberController,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        _telNumberController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Tel No",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
      ),
    );
    //register buton
    final registerButton = SizedBox(
      width: 220,
      height: 40,
      child: ElevatedButton(
        onPressed: () async {
          try {
            signUp(_emailController.text, _passwordController.text);
          } catch (e) {
            debugPrint(e.toString());
          }
        },
        child: const Text(
          "Kayıt ol",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 150,
                      child: Image.asset("images/gym-logo.gif",
                          fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 10),
                    nameSurnameField,
                    const SizedBox(height: 10),
                    jobField,
                    const SizedBox(height: 10),
                    telNumberField,
                    const SizedBox(height: 10),
                    passwordField,
                    const SizedBox(height: 10),
                    confirmPasswordField,
                    const SizedBox(height: 10),
                    registerButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //firestore çağırma
    //user model çağırma
    //değerleri gönderme
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    // bütün değerleri yazma
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = _nameSurnameController.text;
    userModel.telnumber = _telNumberController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Kayıt işlemi tamamlandı");

    Navigator.pushNamed(context, "/");
  }
}
