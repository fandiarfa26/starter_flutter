import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/providers/counter_provider.dart';
import 'package:starter_flutter/views/components/my_drawer.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    final CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Counter",
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<CounterProvider>(builder: (context, counterP, _) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 50),
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
                      child: const Text("-1"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: Btn.success,
                      onPressed: () {
                        counterProvider.increaseNumber();
                      },
                      child: const Text("+1"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: Btn.primary,
                    onPressed: () {
                      counterProvider.resetNumber();
                    },
                    child: const Text("Reset"),
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
