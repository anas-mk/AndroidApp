import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loopride/authentication/sign_up_screen.dart';
import 'package:loopride/splashScreen/splash_screen.dart';import 'package:loopride/widgets/progress_dialog.dart';
import '../global/global.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  validateForm()
  {
    if(emailTextEditingController.text.contains("@"))
    {
      Fluttertoast.showToast(msg: "Email address is not Valid.");
    }
    if(passwordTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Password is required.");
    }
    else
    {
      loginDriverNow();
    }
  }

  loginDriverNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Login, Please Wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error: $msg");
        })
    ).user;

    if(firebaseUser != null)
    {
      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Login Successful.");
      Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));


    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error Occurred during Login");
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
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("image/logo1.png"),
              ),
              const SizedBox(height: 10,),
              const Text(
                "Login as a Driver",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
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
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

              TextButton(
                child: const Text(
                    "Already have an Account? Login Here",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=> const SignUpScreen()));
                },
              ),


            ],
          ),
        ),

      ),
    );
  }
}
