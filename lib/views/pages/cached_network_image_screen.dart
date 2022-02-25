import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:starter_flutter/views/components/my_drawer.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';

class CachedNetworkImageScreen extends StatefulWidget {
  const CachedNetworkImageScreen({Key? key}) : super(key: key);

  @override
  _CachedNetworkImageScreenState createState() =>
      _CachedNetworkImageScreenState();
}

class _CachedNetworkImageScreenState extends State<CachedNetworkImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Cached Network Image",
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: CachedNetworkImage(
          imageUrl:
              'https://images.unsplash.com/photo-1608889476518-738c9b1dcb40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3580&q=80',
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
