import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:muay_bilisim/constants.dart';
import 'package:http/http.dart' as http;

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  //form key
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isLoading = false;
  //kontroller düzenleme
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<List?> login() async {
    var url = Uri.parse('http://10.0.2.2/muay_bilisim/login.php');
    var response = await http.post(url, body: {
      'email': _emailController.text,
      'password': _passwordController.text,
    });
    var datauser = jsonDecode(response.body);
    print(datauser);
  }

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Lütfen Email adresini girin");
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
        suffixIcon: IconButton(
          onPressed: _emailController.clear,
          icon: const Icon(Icons.clear),
        ),
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "E-mail",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: isObscure,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Giriş için şifre gerekli");
        }
        if (!regex.hasMatch(value)) {
          return ("Lütfen geçerli şifre girin(Min 6 karakter)");
        }
      },
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Şifre",
        hintStyle: kHintStyle,
        fillColor: Colors.grey,
        enabledBorder: kOutlineBorder,
        focusedBorder: kOutlineBorder,
        errorBorder: kErrorBorder,
        focusedErrorBorder: kErrorBorder,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          child: Icon(
            isObscure ? Icons.radio_button_off : Icons.radio_button_checked,
          ),
        ),
      ),
    );

    //login button
    final loginButton = SizedBox(
      width: 220,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          login();
        },
        child: (isLoading)
            ? const SizedBox(
                child: kLoaderBtn,
              )
            : const Text(
                "Giriş Yap",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: Image.asset("assets/logo-dark-yellow.png",
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                child: Text("Muay Bilişim Müşteri Paneli"),
              ),
              emailField,
              const SizedBox(height: 10),
              passwordField,
              const SizedBox(height: 15),
              loginButton,
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
