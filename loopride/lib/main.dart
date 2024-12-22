import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loopride/splashScreen/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
       MyApp(
        child: MaterialApp(
          title: "Driver App",
          debugShowCheckedModeBanner: false,
          home: const MySplashScreen(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key,required this.child});

  final Widget? child;

  static void restartApp(BuildContext context)
  {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Key key = UniqueKey();
  void restartApp()
  {
    setState(() {
       key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key : key,
      child: widget.child!,
    );
  }

}

