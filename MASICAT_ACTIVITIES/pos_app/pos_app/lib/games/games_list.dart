import 'package:flutter/material.dart';
import 'package:pos_app/games/game_items.dart';
import 'package:pos_app/models/cart_items.dart';
import 'package:pos_app/models/games.dart';

class GamesList extends StatelessWidget {
  const GamesList({
    super.key,
    required this.game,
    required this.cartItems,
  });

  final List<GameItem> game;
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: game.length,
      itemBuilder: (ctx, index) => GameItems(
        game[index],
        cartItems,
      ),
    );
  }
}
