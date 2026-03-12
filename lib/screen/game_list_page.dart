import 'package:flutter/material.dart';
import 'package:kuis/screen/game_detail_page.dart';
import 'package:kuis/screen/profile_page.dart';
import '../models/game_data.dart';


class GameListPage extends StatefulWidget {

  final String username;

  const GameListPage({super.key, required this.username});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Welcome, ${widget.username}"),
        actions: [

          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfilePage(username: widget.username),
                ),
              );

            },
          ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),

      body: ListView.builder(

        itemCount: gameList.length,

        itemBuilder: (context, index) {

          final game = gameList[index];

          return Card(

            margin: const EdgeInsets.all(8),

            child: ListTile(

              leading: Image.network(
                game.imageUrls[0],
                width: 80,
                fit: BoxFit.cover,
              ),

              title: Text(game.name),

              subtitle: Text(game.price),

              trailing: IconButton(
                icon: const Icon(Icons.favorite_border),

                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${game.name} berhasil disukai"),
                    ),
                  );
                },
              ),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        GameDetailPage(game: game),
                  ),
                );

              },
            ),

          );

        },

      ),

    );
  }
}