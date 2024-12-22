import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loopride/global/global.dart';
import 'package:loopride/splashScreen/splash_screen.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {

  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();

  List<String> carTypesList = ["uber-x", "Uber-go","bike"];
  String? selectedCarType;


  saveCarInfo(){
    Map driverCarInfoMap =
    {
      "car_model" :carModelTextEditingController.text.trim(),
      "car_color" : carColorTextEditingController.text.trim(),
      "car_number" :carNumberTextEditingController.text.trim(),
      "type" :selectedCarType,
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("drivers");
    driversRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Car Details has been saved.");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));



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
              const SizedBox(height: 24,),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("image/logo1.png"),
                ),
              const SizedBox(height: 10,),
              const Text(
                "Write Car Details",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextField(
                controller: carModelTextEditingController,
                style: const TextStyle(
                    color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Car Model',
                  hintText: "Car Model",
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
                controller: carNumberTextEditingController,
                style: const TextStyle(
                    color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Car Number',
                  hintText: "Car Number",
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
                controller: carColorTextEditingController,
                style: const TextStyle(
                    color : Colors.grey
                ),
                decoration: const InputDecoration(
                  labelText: 'Car Color',
                  hintText: "Black",
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

              DropdownButton(
                dropdownColor: Colors.black,
                hint: const Text(
                    "Please choose Car type",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey
                  ),
                ),
                value: selectedCarType,
                onChanged: (newValue)
                {
                  setState(() {
                    selectedCarType = newValue.toString();
                  });
                },
                items: carTypesList.map((car){
                  return DropdownMenuItem(
                      value: car,
                      child: Text(
                          car,
                        style: const TextStyle(color: Colors.grey),
                      ),
                  );
                }).toList(),

              ),

              const SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: ()
                {
                  if(carModelTextEditingController.text.isNotEmpty
                      && carNumberTextEditingController.text.isNotEmpty
                      && carColorTextEditingController.text.isNotEmpty
                      && selectedCarType != null)
                  {
                    saveCarInfo();
                  }

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent
                ),
                child: const Text(
                  "Save Now",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
