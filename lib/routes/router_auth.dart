import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/providers/auth_provider.dart';

class RouterAuth extends StatefulWidget {
  const RouterAuth({Key? key}) : super(key: key);

  @override
  _RouterAuthState createState() => _RouterAuthState();
}

class _RouterAuthState extends State<RouterAuth> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).initAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authP, _) {
      switch (authP.status) {
        case StatusAuth.LoggedIn:
        // return Home
        case StatusAuth.NotLoggedIn:
        // return Login
        default:
          return Container(); // LoadingScreen
      }
    });
  }
}
