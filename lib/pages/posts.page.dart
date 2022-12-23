import 'package:church_app/widgets/categories_slider.widget.dart';
import 'package:church_app/widgets/list_posts_horizontal.widget.dart';
import 'package:church_app/widgets/search_posts.widget.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SearchPosts(),
            CategoriesSlider(),
            ListPostsHorizontal(),
          ],
        ),
      ),
    );
  }
}
