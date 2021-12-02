import 'package:flutter/material.dart';
import 'package:starter_flutter/constants/api_constants.dart';
import 'package:starter_flutter/core/views/components/my_drawer.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double tsf = width / mockupWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Welcome",
          textScaleFactor: tsf,
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Text("Hello World!", style: Typo.b36p),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "Starter Flutter Template",
                  style: Typo.b14p.copyWith(color: Colors.black),
                  textScaleFactor: tsf,
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  "github/fandiarfa26",
                  style: Typo.r14p.copyWith(color: Colors.black),
                  textScaleFactor: tsf,
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        },
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}
