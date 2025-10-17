import 'package:flutter/material.dart';
import 'package:pos_app/games/add_game.dart';
import 'package:pos_app/models/cart_items.dart';
import 'package:pos_app/models/games.dart';

class GameItems extends StatelessWidget {
  const GameItems(this.game, this.cartItems, {super.key});

  final GameItem game;
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    void openGameModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
          ),
          child: AddGame(
            game: game,
            cartItems: cartItems,
          ),
        ),
      );
    }

    return InkWell(
      onTap: openGameModal,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Row(
            children: [
              Image.asset(
                game.image,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          game.title,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const Spacer(),
                        Text(
                          '₱${game.amount.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          game.category.name.toUpperCase(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        ),
                        const Spacer(),
                        Icon(
                          categoryIcon[game.category],
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
