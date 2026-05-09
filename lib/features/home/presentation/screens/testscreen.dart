import 'package:flutter/material.dart';

class testscreen extends StatelessWidget {
  static const String routeName = "/testscreen";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Screen"),
      ),
      body: Center(
        child: Text("- Received argument: $args"),
      ),
    );
  }
}
