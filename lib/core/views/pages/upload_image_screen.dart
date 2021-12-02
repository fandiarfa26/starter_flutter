import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/constants/api_constants.dart';
import 'package:starter_flutter/constants/assets_path.dart';
import 'package:starter_flutter/core/providers/image_pick_provider.dart';
import 'package:starter_flutter/core/views/components/my_drawer.dart';
import 'package:starter_flutter/utils/ui/app_dialogs.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double tsf = width / mockupWidth;

    final ImagePickProvider imagePickProvider =
        Provider.of<ImagePickProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Image Picker & Cropper",
          textScaleFactor: tsf,
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(20 / mockupWidth * width),
        child: SizedBox(
          width: width,
          child: Consumer<ImagePickProvider>(builder: (context, imageP, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20 / mockupHeight * height),
                  child: imageP.pic != null
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                BorderRadius.circular(10 / mockupWidth * width),
                          ),
                          child: Image.file(
                            imageP.pic!,
                            fit: BoxFit.fitHeight,
                            height: width,
                          ),
                        )
                      : SvgPicture.asset(uploadImage),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: Btn.primary,
                    onPressed: () {
                      AppDialog.chooseCameraGallery(
                          context, imagePickProvider.setImage);
                    },
                    child: Text("Upload", textScaleFactor: tsf),
                  ),
                ),
                if (imageP.pic != null)
                  Padding(
                    padding: EdgeInsets.only(top: 10 / mockupHeight * height),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: Btn.danger,
                        onPressed: () {
                          imagePickProvider.removeImage();
                        },
                        child: Text("Remove", textScaleFactor: tsf),
                      ),
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
