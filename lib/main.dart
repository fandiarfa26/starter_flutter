import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/app_constants.dart';
import './utils/ui/custom_styles.dart';
import './routes/router.dart';
import './providers/counter_provider.dart';
import './providers/image_pick_provider.dart';
import './providers/info_provider.dart';
import './providers/post_provider.dart';

void main() {
  RouterApp.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => ImagePickProvider()),
        ChangeNotifierProvider(create: (context) => InfoProvider()),
      ],
      child: MaterialApp(
        title: appTitle,
        theme: appTheme,
        initialRoute: '/',
        onGenerateRoute: RouterApp.router.generator,
      ),
    );
  }
}
