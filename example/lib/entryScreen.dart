import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return enter();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.restoreSystemUIOverlays();
  }

  Widget enter() {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.clear, color: Colors.black),
        backgroundColor: Color(0xFFEDEDED),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: Colors.black),
            onPressed: null,
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  child: Container(
                height: 350,
                width: double.infinity,
                color: Color(0xFF24B04D),
                child: Center(
                  child: Text(
                    "进馆成功！",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              )),
            ]),
      ),
    );
  }
}
