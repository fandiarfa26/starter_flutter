import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/providers/info_provider.dart';
import 'package:starter_flutter/views/components/my_drawer.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class PackageInfoScreen extends StatefulWidget {
  const PackageInfoScreen({Key? key}) : super(key: key);

  @override
  _PackageInfoScreenState createState() => _PackageInfoScreenState();
}

class _PackageInfoScreenState extends State<PackageInfoScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<InfoProvider>(context, listen: false).getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Package Info",
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<InfoProvider>(builder: (context, infoP, _) {
          if (infoP.packageInfo == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Text(infoP.packageInfo!.appName),
              Text(infoP.packageInfo!.buildNumber),
              Text(infoP.packageInfo!.buildSignature),
              Text(infoP.packageInfo!.packageName),
              Text(infoP.packageInfo!.version),
            ],
          );
        }),
      ),
    );
  }
}
