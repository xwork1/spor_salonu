import 'package:flutter/material.dart';
import 'package:spor_salonu/view/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form key
  final _formkey = GlobalKey<FormState>();

  //kontroller düzenleme
  final TextEditingController telNumController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    //telno field
    final telNumField = TextFormField(
      autofocus: false,
      controller: telNumController,
      keyboardType: TextInputType.phone,
      
      onSaved: (value)
      {
        telNumController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
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
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,

      //validator: () {},
      onSaved: (value)
      {
        passwordController.text = value!;
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
      color: Colors.redAccent,
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
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),
        ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  SizedBox(
                    height: 250,
                    child: Image.asset("images/gym-logo1.gif",
                    fit: BoxFit.contain
                    ),
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
                       GestureDetector(onTap: () {
                         Navigator.push(context, 
                         MaterialPageRoute(builder: (context) => const RegisterPage()));
                       },
                       child: const Text("Kayıt ol", 
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