import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loopride/authentication/login_screen.dart';
import 'package:loopride/global/global.dart';
import 'package:loopride/widgets/progress_dialog.dart';

import 'car_info_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm()
  {
    if(nameTextEditingController.text.length < 3)
    {
      Fluttertoast.showToast(msg: "Name must be at least 3 Characters.");
    }
    if(emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "Email address is not Valid.");
    }
    if(phoneTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Phone number is required.");
    }
    if(passwordTextEditingController.text.length < 6)
    {
      Fluttertoast.showToast(msg: "Password must be at least 6 Characters.");
    }
    else
    {
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please Wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
            email: emailTextEditingController.text.trim(),
            password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: $msg");
        })
    ).user;

    if(firebaseUser != null)
    {
      Map driverMap =
      {
        "id" : firebaseUser.uid,
        "name" :nameTextEditingController.text.trim(),
        "email" :emailTextEditingController.text.trim(),
        "phone" :phoneTextEditingController.text.trim(),
      };

      DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
      driversRef.child(firebaseUser.uid).set(driverMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Account has been Created.");
      Navigator.push(context, MaterialPageRoute(builder: (c)=> const CarInfoScreen()));


    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been Created.");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("image/logo1.png"),
              ),
              const SizedBox(height: 10,),
              const Text(
                  "Register as a Driver",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                controller: nameTextEditingController,
                keyboardType: TextInputType.name,
                style: const TextStyle(
                  color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: "Ali Ahmed",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: "eample@email.com",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                    color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: "01000665566",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: "******",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: (){
                    validateForm();
                    // Navigator.push(context, MaterialPageRoute(builder: (c)=> const CarInfoScreen()));
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent
                ),
                child: const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
              ),

              TextButton(
                child: const Text(
                  "I Already have an Account",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> const LoginScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
