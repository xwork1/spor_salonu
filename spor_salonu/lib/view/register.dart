import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key }) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //formkey
  final _formkey = GlobalKey<FormState>();

  //controller
  final nameSurnameController = TextEditingController();
  final programDurationController = TextEditingController();
  final jobController = TextEditingController();
  final programDateController = TextEditingController();
  final telNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //name-surname field
    final nameSurnameField = TextFormField(
      autofocus: false,
      controller: nameSurnameController,
      keyboardType: TextInputType.text,
      
      onSaved: (value)
      {
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
    final programDurationField = TextFormField(
      autofocus: false,
      controller: programDurationController,
      keyboardType: TextInputType.text,
      
      onSaved: (value)
      {
        programDurationController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.timeline),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Program Süresi",
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
      
      onSaved: (value)
      {
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
    final programDateField = TextFormField(
      autofocus: false,
      controller: programDateController,
      keyboardType: TextInputType.datetime,
      
      onSaved: (value)
      {
        programDateController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.date_range),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Program Tarihi",
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

      onSaved: (value)
      {
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
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
          ),
        ),
        ),
    );
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.red),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.zall(36.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget> [
                  SizedBox(
                    height: 150,
                    child: Image.asset("images/gym-logo.gif",
                    fit: BoxFit.contain
                    ),
                  ),
                    const SizedBox(height: 10),
                    nameSurnameField,
                    const SizedBox(height: 10),
                    programDurationField,
                    const SizedBox(height: 10),
                    jobField,
                    const SizedBox(height: 10),
                    programDateField,
                    const SizedBox(height: 10),
                    telNumberField,
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
}