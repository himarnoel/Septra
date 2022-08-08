import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("sdfsdaf")))
        ],
      ),
    );
  }
}
