import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Color drawerbg = const Color.fromARGB(255, 59, 58, 79);
    return Drawer(
      backgroundColor: drawerbg,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        children: const [
          DrawerHeader(),
          LineDivider(),
          DrawerTile(Icons.forum_outlined, "TUTORIALS"),
          DrawerTile(Icons.code_outlined, "LEARN"),
          DrawerTile(Icons.podcasts_outlined, "PODCASTS"),
          DrawerTile(Icons.radio, "CODE RADIO"),
          LineDivider(),
          DrawerTile(Icons.info_outline, "PRIVACY"),
          DrawerTile(Icons.favorite, "DONATE")
        ],
      ),
    );
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Divider(
        color: Colors.white54,
        thickness: 0.1,
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding: EdgeInsets.only(top: 32),
      leading: Icon(
        Icons.person,
        color: Colors.white,
        size: 48,
      ),
      title: Text(
        "Anonymous user",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      subtitle: Text(
        "login to save your progress",
        style: TextStyle(color: Colors.white38),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerTile(this.icon, this.text, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Icon(
        icon,
        color: Colors.white,
        size: 32,
      ),
      title: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
