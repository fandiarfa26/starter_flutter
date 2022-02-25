import 'package:flutter/material.dart';
import 'package:starter_flutter/models/post_model.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Detail Post",
          style: Typo.b18p,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            widget.post.title!,
            style: Typo.b24p.copyWith(
              color: Colors.black,
              fontFamily: fontSerif,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
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
