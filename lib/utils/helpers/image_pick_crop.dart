import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImagePickCrop {
  static Future<File?> process(ImageSource source) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: source);

    File? croppedImage = await ImageCropper.cropImage(
      sourcePath: pickedFile!.path,
      maxWidth: 500,
      maxHeight: 500,
    );

    return Future.delayed(const Duration(seconds: 2), () => croppedImage);
  }
}
