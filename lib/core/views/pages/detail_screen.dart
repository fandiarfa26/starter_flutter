import 'package:flutter/material.dart';
import 'package:starter_flutter/constants/api_constants.dart';
import 'package:starter_flutter/core/models/post_model.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class DetailScreen extends StatefulWidget {
  final PostModel post;
  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double tsf = width / mockupWidth;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Detail Post",
          textScaleFactor: tsf,
          style: Typo.b18p,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20 / mockupWidth * width),
        children: [
          Text(
            widget.post.title!,
            style: Typo.b24p.copyWith(
              color: Colors.black,
              fontFamily: fontSerif,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20 / mockupHeight * height,
              bottom: 10 / mockupHeight * height,
            ),
            child: Text(
              "Description",
              style: Typo.b14p.copyWith(color: Colors.grey[400]),
            ),
          ),
          Text(
            widget.post.description!,
            style: Typo.r18p.copyWith(
              color: Colors.black,
              fontFamily: fontSerif,
            ),
          ),
        ],
      ),
    );
  }
}
