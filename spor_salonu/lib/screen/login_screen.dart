import 'package:flutter/material.dart';
import 'package:spor_salonu/screen/register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  //form key
  final _formkey = GlobalKey<FormState>();
  
  //kontroller düzenleme
  final TextEditingController _telNumController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    //telnum field
    final telNumField = TextFormField(
      
      autofocus: false,
      controller: _telNumController,
      keyboardType: TextInputType.phone,
      onSaved: (value) {
        _telNumController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
      onPressed: _telNumController.clear,
      icon: const Icon(Icons.clear),
    ),
        prefixIcon: const Icon(Icons.phone_android),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Tel No",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,

      //validator: () {},
      onSaved: (value) {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Şifre",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueGrey,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.pushNamed(context, '/homescreen');
        },
        child: const Text(
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

    return Scaffold(
      backgroundColor: Colors.white,
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
                      height: 250,
                      child: Image.asset("images/gym-logo1.gif",
                          fit: BoxFit.contain),
                    ),
                    const SizedBox(height: 10),
                    telNumField,
                    const SizedBox(height: 15),
                    passwordField,
                    const SizedBox(height: 35),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Hala kayıt olmadınız mı? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterPage()));
                          },
                          child: const Text(
                            "Kayıt ol",
                            style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
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
