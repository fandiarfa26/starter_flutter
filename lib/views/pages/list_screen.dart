import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starter_flutter/models/post_model.dart';
import 'package:starter_flutter/providers/post_provider.dart';
import 'package:starter_flutter/views/components/my_drawer.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: Text(
          "Fetch API",
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
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                post.description!,
                style: Typo.r12p.copyWith(color: Colors.grey[400]),
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          children: _listPosts,
        );
      }),
    );
  }
}
