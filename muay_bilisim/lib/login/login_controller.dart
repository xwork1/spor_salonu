import 'package:flutter/material.dart';
import 'package:muay_bilisim/constants.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isLoading = false;
  //kontroller düzenleme
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
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
        onPressed: () async {
          setState(() {
            isLoading = true;
            _emailController.text + _passwordController.text;
          });
          await Future.delayed(const Duration(seconds: 5));
          setState(() {
            isLoading = false;
          });
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
          key: formKey,
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