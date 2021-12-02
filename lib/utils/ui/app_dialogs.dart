import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starter_flutter/constants/api_constants.dart';

import 'custom_styles.dart';

class AppDialog {
  static chooseCameraGallery(BuildContext context, Function fnc) async {
    final double width = MediaQuery.of(context).size.width;
    final double tsf = width / mockupWidth;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.camera, color: primaryColor),
              title: Text('Kamera', textScaleFactor: tsf, style: Typo.r14p),
              onTap: () {
                fnc(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.image, color: primaryColor),
              title: Text('Galeri', textScaleFactor: tsf, style: Typo.r14p),
              onTap: () {
                fnc(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
