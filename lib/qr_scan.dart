import 'package:flutter/material.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'app_theme/theme.dart';

class QrScan extends StatefulWidget {

  @override
  _QrScanState createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  var qr = "";
  // bool _validURL = Uri.parse(_adVertData.webLink).isAbsolute;
  bool camState = false;
  PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        controller: panelController,
        onPanelOpened: controlQR,
        onPanelClosed: controlQR,
        backdropEnabled: true,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        parallaxEnabled: true,
        body: QR_Code(),
        panel: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 150,right:150,bottom: 10),
                child: Container(
                  color: CustomizedTheme.primaryColor,
                  height:2,
                  width: double.infinity,
                ),
              ),
              qr == "" ? Text("Scanned result will show here ",style: CustomizedTheme.sf_b_W400_17)
                  :Column(
                    children: [
                      Text("QR Result :",style: CustomizedTheme.sf_b_W400_17),
                      SizedBox(height: 10,)
                    ],
                  ),

              qr != "" ? Text(qr): Container(),
            ],
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //     child: const Text(
      //       "press me",
      //       textAlign: TextAlign.center,
      //     ),
      //     onPressed: () {
      //       setState(() {
      //         camState = !camState;
      //       });
      //     }),

    );
  }
  Center QR_Code() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // SizedBox(height: 20,),
            // Text("QRCODE: $qr"),
            Expanded(
                child: camState
                    ? Center(
                  child: QrCamera(
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * .7,
                        height: MediaQuery.of(context).size.height * .4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border(top: BorderSide(color: CustomizedTheme.primaryBold,width: 5),bottom: BorderSide(color: CustomizedTheme.primaryBold,width: 5)
                                ,left: BorderSide(color: CustomizedTheme.primaryBold,width: 5),right: BorderSide(color: CustomizedTheme.primaryBold,width: 5))
                        ),
                      ),
                    ),
                    onError: (context, error) => Text(
                      error.toString(),
                      style: TextStyle(color: Colors.red),
                    ),
                    qrCodeCallback: (code) {
                      setState(() {
                        qr = code!;
                      });
                    },
                  ),
                )
                    : const Center(child: Text("Camera inactive"))),
            // Text("QRCODE: $qr"),
          ],
        ),
      ),
    );
  }

  controlQR() {
    if(panelController.isPanelClosed){
      setState(() {
        // panelController.close();
        camState = true;
      });
    }else{
      setState(() {
        camState = false;
      });
    }

  }
}
