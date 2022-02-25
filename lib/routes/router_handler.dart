import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:starter_flutter/views/pages/cached_network_image_screen.dart';
import 'package:starter_flutter/views/pages/counter_screen.dart';
import 'package:starter_flutter/views/pages/detail_screen.dart';
import 'package:starter_flutter/views/pages/list_screen.dart';
import 'package:starter_flutter/views/pages/package_info_screen.dart';
import 'package:starter_flutter/views/pages/upload_image_screen.dart';
import 'package:starter_flutter/views/pages/welcome_screen.dart';
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

  static Handler cachedImageNetHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const CachedNetworkImageScreen());
  static Handler infoHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          const PackageInfoScreen());
}
