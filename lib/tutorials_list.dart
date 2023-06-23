import 'package:flutter/material.dart';
import 'mydrawer.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'dart:math';

class TutorialList extends StatefulWidget {
  const TutorialList({super.key});

  @override
  State<TutorialList> createState() => _TutorialListState();
}

class _TutorialListState extends State<TutorialList> {
  Color bgColor = const Color.fromARGB(255, 27, 27, 50);
  List<TutPosts> posts = [];

  void initState() {
    super.initState();

    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.freecodecamp.org/news/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles =
        html.querySelectorAll("h2 > a").map((e) => e.innerHtml.trim()).toList();
    final urls = html
        .querySelectorAll("h2 > a")
        .map((e) => 'https://www.freecodecamp.org/${e.attributes['href']}')
        .toList();

    final imageUrls = html
        .querySelectorAll("#site-main > div > section > article > a > img")
        .map((e) => e.attributes['src']!)
        .toList();
    final tags = html
        .querySelectorAll(
            "#site-main > div > section > article > div > div > header > span > a")
        .map((e) => e.innerHtml.trim())
        .toList();
    final authors = html
        .querySelectorAll(
            "#site-main > div > section > article > div > footer > ul > li > span > a")
        .map((e) => e.innerHtml.trim())
        .toList();
    final imageAuthorUrls = html
        .querySelectorAll(
            "#site-main > div > section > article > div > footer > ul > li > a > img")
        .map((e) => e.attributes['src']!)
        .toList();
    final postTimes = html
        .querySelectorAll(
            "#site-main > div > section > article > div > footer > ul > li > span > time")
        .map((e) => e.innerHtml.trim())
        .toList();

    setState(() {
      posts = List.generate(
          titles.length,
          (index) => TutPosts(
              title: titles[index],
              url: urls[index],
              urlImage: imageUrls[index],
              tag: tags[index],
              authorName: authors[index],
              authorImageUrl: imageAuthorUrls[index],
              postTime: postTimes[index]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("TUTORIALS"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 10, 10, 35),
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
            elevation: 16,
            color: const Color.fromARGB(255, 27, 27, 50),
            child: Column(
              children: [
                Image.network(
                  post.urlImage,
                  fit: BoxFit.fitWidth,
                ),
                PostTag(post: post),
                ListTile(
                  title: Text(
                    post.title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  // subtitle: Text(post.url,
                  //     style: const TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Image.network(
                    post.authorImageUrl,
                  ),
                  title: Text(
                    post.authorName.toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(post.postTime.toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 16)
              ],
            ),
          );
        },
      ),
    );
  }
}

class PostTag extends StatelessWidget {
  const PostTag({
    super.key,
    required this.post,
  });

  final TutPosts post;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors
                    .primaries[Random().nextInt(Colors.primaries.length)]),
            child: Text(
              post.tag,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class TutPosts {
  final String url;
  final String title;
  final String urlImage;
  final String tag;
  final String authorImageUrl;
  final String authorName;
  final String postTime;

  TutPosts(
      {required this.url,
      required this.title,
      required this.urlImage,
      required this.tag,
      required this.authorName,
      required this.authorImageUrl,
      required this.postTime});
}
