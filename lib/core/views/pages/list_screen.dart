import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/constants/api_constants.dart';
import 'package:starter_flutter/core/models/post_model.dart';
import 'package:starter_flutter/core/providers/post_provider.dart';
import 'package:starter_flutter/core/views/components/my_drawer.dart';
import 'package:starter_flutter/routes/router.dart';
import 'package:starter_flutter/utils/ui/custom_styles.dart';
import 'package:starter_flutter/utils/ui/screen_arguments.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).fetchPosts();
  }

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
          "Fetch API",
          textScaleFactor: tsf,
          style: Typo.b18p,
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PostProvider>(builder: (context, postP, _) {
        if (postP.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        List<Widget> _listPosts = [];

        for (PostModel post in postP.data!) {
          _listPosts.add(Card(
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: ListTile(
              title: Text(
                post.title!,
                style: Typo.r14p.copyWith(color: Colors.black),
                textScaleFactor: tsf,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                post.description!,
                style: Typo.r12p.copyWith(color: Colors.grey[400]),
                textScaleFactor: tsf,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
              onTap: () {
                RouterApp.router.navigateTo(
                  context,
                  '/detail',
                  routeSettings: RouteSettings(
                    arguments: DetailScreenArguments(post),
                  ),
                );
              },
            ),
          ));
        }

        return ListView(
            padding: EdgeInsets.symmetric(vertical: 10 / mockupHeight * height),
            children: _listPosts);
      }),
    );
  }
}
