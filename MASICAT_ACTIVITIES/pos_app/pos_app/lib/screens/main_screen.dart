import 'package:flutter/material.dart';
import 'package:pos_app/games/games_list.dart';
import 'package:pos_app/models/cart_items.dart';
import 'package:pos_app/models/games.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  final List<GameItem> registeredGames = [
    GameItem(
      title: 'Counter Strike',
      amount: 300.49,
      category: GameCategory.fps,
      image: 'assets/images/cs.png',
    ),
    GameItem(
      title: 'Valorant',
      amount: 1000.49,
      category: GameCategory.fps,
      image: 'assets/images/valorant.png',
    ),
    GameItem(
      title: 'Call of Duty',
      amount: 450.49,
      category: GameCategory.fps,
      image: 'assets/images/cod.png',
    ),
    GameItem(
      title: 'Stardew Valley',
      amount: 499.49,
      category: GameCategory.adventure,
      image: 'assets/images/stardew.png',
    ),
    GameItem(
      title: 'Minecraft',
      amount: 399.49,
      category: GameCategory.adventure,
      image: 'assets/images/minecraft.png',
    ),
    GameItem(
      title: 'Terraria',
      amount: 299.49,
      category: GameCategory.adventure,
      image: 'assets/images/terraria.png',
    ),
    GameItem(
      title: 'Phasmophobia',
      amount: 659.49,
      category: GameCategory.horror,
      image: 'assets/images/Phasmophobia.png',
    ),
    GameItem(
      title: 'Pacify',
      amount: 129.49,
      category: GameCategory.horror,
      image: 'assets/images/pacify.png',
    ),
    GameItem(
      title: 'R.E.P.O',
      amount: 599.49,
      category: GameCategory.horror,
      image: 'assets/images/repo.png',
    ),
  ];
  final List<CartItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No games found.',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    if (registeredGames.isNotEmpty) {
      mainContent = GamesList(
        game: registeredGames,
        cartItems: cartItems,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add to Cart',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
