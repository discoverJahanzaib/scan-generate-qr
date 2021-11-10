import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'app_theme/theme.dart';

class GenerateQr extends StatefulWidget {

  @override
  _GenerateQrState createState() => _GenerateQrState();
}

class _GenerateQrState extends State<GenerateQr> {
  TextEditingController dataController = TextEditingController();
  var data ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: dataController.text,
              version: QrVersions.auto,
              size: 200.0,
              foregroundColor: CustomizedTheme.primaryColor.withOpacity(.6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: TextFormField(
              controller: dataController,
              // keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 24.44,right: 34.47, bottom: 12.3,top: 15.03),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black,width: 1.0)),
                labelText: "Type word",
                labelStyle: CustomizedTheme.sf_bo_W300_1503,
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Color(0xff006E7D)),
                ),
              ),
              onChanged: (abc){
                setState(() {
                  data = abc;
                });
              },
              // controller: passwordController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Cant be empty';
                }
                // Check if the entered email has the right format
                if (value.trim().length < 1) {
                  return 'Enter something ';
                }
                // Return null if the entered email is valid
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
