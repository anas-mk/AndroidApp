import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  ProgressDialog({super.key,this.message});

  String? message;


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Row(
          children: [

            const SizedBox(width: 6.0,),

            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),

            const SizedBox(width: 26.0,),

            Text(
              message!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            )
          ],
        ),

      ),
    );
  }
}
