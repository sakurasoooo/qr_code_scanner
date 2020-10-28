import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'entryScreen.dart';
import 'scanner.dart';

void main() => runApp(MaterialApp(home: QRViewExample()));

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample>
    with TickerProviderStateMixin {
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  //AnimationController _animationController;
  //final bool _animationStopped = false;
  //String scanText = "Scan";
  //bool scanning = false;

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    _controller = new AnimationController(
      duration: new Duration(seconds: 2),
      vsync: this,
    )..repeat();

    //control();
  }

  void control() {
    _controller.reverse(from: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: Icon(Icons.cancel, color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.white),
              onPressed: null,
            ),
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
            flex: 4,
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  overlayColor: Colors.transparent,
                  //borderColor: Colors.green,
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 3000,
                ),
              ),
              ImageScannerAnimation(
                false,
                800,
                animation: _controller,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "扫描二维码/条码/小程序码",
                        style: TextStyle(color: Color(0xCCFFFFFF)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          fillColor: Color(0xBB808080),
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.qr_code,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: () {},
                          elevation: 0,
                          fillColor: Color(0xBB808080),
                          padding: EdgeInsets.all(10),
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.image,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ]),
          ),
          SizedBox(
            height: 70,
            child: Container(
                color: Colors.black, //remove color to make it transpatrent
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Center(
                            child: Text("扫码",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Center(
                            child: Text("识物",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Center(
                            child: Text("翻译",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 185,
                        ),
                        Center(
                          child: Text(" • ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        SizedBox(
                          width: 185,
                        ),
                      ],
                    ),
                  ],
                ))),
          ),
        ]));
  }

  // void animateScanAnimation(bool reverse) {
  //   if (reverse) {
  //     _controller.reverse(from: 1.0);
  //   } else {
  //     _controller.forward(from: 1.0);
  //   }
  // }

  // Widget enter() {
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: Icon(Icons.clear, color: Colors.black),
  //       backgroundColor: Color(0xFFEDEDED),
  //       elevation: 0,
  //       actions: [
  //         IconButton(
  //           icon: Icon(Icons.more_horiz, color: Colors.black),
  //           onPressed: null,
  //         ),
  //       ],
  //     ),
  //     body: Center(
  //       child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //                 child: Container(
  //               height: 350,
  //               width: double.infinity,
  //               color: Color(0xFF24B04D),
  //               child: Center(
  //                 child: Text(
  //                   "进馆成功！",
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(fontSize: 35),
  //                 ),
  //               ),
  //             )),
  //           ]),
  //     ),
  //   );
  // }

  Widget scanner() {
    return Expanded(
      flex: 4,
      child: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 300,
        ),
      ),
    );
  }

  // bool _isFlashOn(String current) {
  //   return flashOn == current;
  // }

  // bool _isBackCamera(String current) {
  //   return backCamera == current;
  // }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (flashState == flashOn) {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => EntryScreen()),
        );
      }
      setState(() {
        qrText = scanData;
        flashState = flashOff;
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }
}
