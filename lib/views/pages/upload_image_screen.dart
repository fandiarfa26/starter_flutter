import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/constants/assets_path.dart';
import 'package:starter_flutter/providers/image_pick_provider.dart';
import 'package:starter_flutter/views/components/my_drawer.dart';
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
    final ImagePickProvider imagePickProvider =
        Provider.of<ImagePickProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Image Picker & Cropper",
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Consumer<ImagePickProvider>(builder: (context, imageP, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: imageP.pic != null
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.file(
                            imageP.pic!,
                            fit: BoxFit.fitHeight,
                            height: MediaQuery.of(context).size.width,
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
                    child: const Text("Upload"),
                  ),
                ),
                if (imageP.pic != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: Btn.danger,
                        onPressed: () {
                          imagePickProvider.removeImage();
                        },
                        child: const Text("Remove"),
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
