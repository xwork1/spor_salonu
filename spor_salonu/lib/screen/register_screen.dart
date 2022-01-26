import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spor_salonu/model/user_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  //formkey
  final _formkey = GlobalKey<FormState>();
  //controller
  final nameSurnameController = TextEditingController();
  final jobController = TextEditingController();
  final telNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //ad-soyad field
    final nameSurnameField = TextFormField(
      autofocus: false,
      controller: nameSurnameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Kayıt için isim gerekli");
        }
        if (!regex.hasMatch(value)) {
          return ("Lütfen geçerli isim girin(Min 3 karakter)");
        }
      },
      onSaved: (value) {
        nameSurnameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Ad-Soyad",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //program süresi field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Kayıt için şifre gerekli");
        }
        if (!regex.hasMatch(value)) {
          return ("Lütfen geçerli şifre girin(Min 6 karakter)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.timeline),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Şifre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //meslek field
    final jobField = TextFormField(
      autofocus: false,
      controller: jobController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Kayıt için meslek gerekli");
        }
        if (!regex.hasMatch(value)) {
          return ("Lütfen geçerli bir meslek girin(Min 3 karakter)");
        }
      },
      onSaved: (value) {
        jobController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.work),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Meslek",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //program tarihi field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordController,
      keyboardType: TextInputType.datetime,
      validator: (value) {
        if (passwordController.text.length > 6 &&
            passwordController.text != value) {
          return "Şifre eşleşmedi!";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.date_range),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Şifreyi tekrarla",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //telefon numarası field
    final telNumberField = TextFormField(
      autofocus: false,
      controller: telNumberController,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        telNumberController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Tel No",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    //register buton
    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: const Text(
          "Kayıt Ol",
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
    userModel.uid = user!.uid;
    userModel.firstname = nameSurnameController.text;
    userModel.telnumber = telNumberController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Kayıt işlemi tamamlandı");

    
  }
}
