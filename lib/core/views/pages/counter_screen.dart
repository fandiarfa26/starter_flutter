import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/constants/api_constants.dart';
import 'package:starter_flutter/core/providers/counter_provider.dart';
import 'package:starter_flutter/core/views/components/my_drawer.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double tsf = width / mockupWidth;

    final CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Counter",
          textScaleFactor: tsf,
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20 / mockupWidth * width),
        child: SizedBox(
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<CounterProvider>(builder: (context, counterP, _) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 50 / mockupHeight * height),
                  child: Text(
                    counterP.number.toString(),
                    style: Typo.b64p.copyWith(
                      color: Colors.black,
                      fontFamily: fontMono,
                    ),
                  ),
                );
              }),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: Btn.danger,
                      onPressed: () {
                        counterProvider.decreaseNumber();
                      },
                      child: Text("-1", textScaleFactor: tsf),
                    ),
                  ),
                  SizedBox(width: 10 / mockupWidth * width),
                  Expanded(
                    child: ElevatedButton(
                      style: Btn.success,
                      onPressed: () {
                        counterProvider.increaseNumber();
                      },
                      child: Text("+1", textScaleFactor: tsf),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 8 / mockupHeight * height),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: Btn.primary,
                    onPressed: () {
                      counterProvider.resetNumber();
                    },
                    child: Text("Reset", textScaleFactor: tsf),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
