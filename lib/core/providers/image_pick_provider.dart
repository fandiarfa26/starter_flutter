import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starter_flutter/utils/helpers/image_pick_crop.dart';

class ImagePickProvider extends ChangeNotifier {
  File? _pic;

  File? get pic => _pic;

  void setImage(ImageSource source) async {
    File? img = await ImagePickCrop.process(source);

    if (img != null) {
      _pic = img;
      notifyListeners();
    }
  }

  void removeImage() {
    _pic = null;
    notifyListeners();
  }
}
