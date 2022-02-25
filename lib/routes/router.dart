import 'package:fluro/fluro.dart';
import 'package:starter_flutter/routes/router_handler.dart';

class RouterApp {
  static FluroRouter router = FluroRouter();

  static void setupRouter() {
    router.define('/',
        handler: RouterHandler.welcomeHandler,
        transitionType: TransitionType.none);

    router.define('/counter',
        handler: RouterHandler.counterHandler,
        transitionType: TransitionType.none);

    router.define('/list',
        handler: RouterHandler.listHandler,
        transitionType: TransitionType.none);

    router.define('/detail',
        handler: RouterHandler.detailHandler,
        transitionType: TransitionType.inFromRight);

    router.define('/upload_image',
        handler: RouterHandler.uploadImageHandler,
        transitionType: TransitionType.none);

    router.define('/cached_image',
        handler: RouterHandler.cachedImageNetHandler,
        transitionType: TransitionType.none);

    router.define('/package_info',
        handler: RouterHandler.infoHandler,
        transitionType: TransitionType.none);
  }
}
