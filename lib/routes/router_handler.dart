import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:starter_flutter/core/views/pages/counter_screen.dart';
import 'package:starter_flutter/core/views/pages/detail_screen.dart';
import 'package:starter_flutter/core/views/pages/list_screen.dart';
import 'package:starter_flutter/core/views/pages/upload_image_screen.dart';
import 'package:starter_flutter/core/views/pages/welcome_screen.dart';
import 'package:starter_flutter/utils/ui/screen_arguments.dart';

class RouterHandler {
  static Handler welcomeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const WelcomeScreen());

  static Handler counterHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const CounterScreen());

  static Handler listHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const ListScreen());

  static Handler detailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
    final args =
        ModalRoute.of(context!)!.settings.arguments as DetailScreenArguments;
    return DetailScreen(post: args.post);
  });

  static Handler uploadImageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const UploadImageScreen());
}
