import 'package:flutter/material.dart';
import 'package:loopride/global/global.dart';
import 'package:loopride/splashScreen/splash_screen.dart';


class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ElevatedButton(
          onPressed: ()
          {
            fAuth.signOut();
            Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
          },
          child: const Text(
            "sign Out",
          ),
      ),
    );
  }
}
