import 'package:pos_app/models/games.dart';

class CartItem {
  final GameItem game;
  int quantity;

  CartItem({required this.game, this.quantity = 1});

  double get total => game.amount * quantity;
}
