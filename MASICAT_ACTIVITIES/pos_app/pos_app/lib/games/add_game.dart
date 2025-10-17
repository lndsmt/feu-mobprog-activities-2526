import 'package:flutter/material.dart';
import 'package:pos_app/models/cart_items.dart';
import 'package:pos_app/models/games.dart';
import 'package:pos_app/screens/checkout.dart';

class AddGame extends StatefulWidget {
  const AddGame({super.key, required this.game, required this.cartItems});

  final GameItem game;
  final List<CartItem> cartItems;

  @override
  State<AddGame> createState() => _AddGameState();
}

class _AddGameState extends State<AddGame> {
  int quantity = 1;

  double get totalPrice => widget.game.amount * quantity;

  void addToCart(GameItem game, int quantity) {
    final existingItem = widget.cartItems
        .where((item) => item.game.title == game.title)
        .toList();

    setState(() {
      if (existingItem.isNotEmpty) {
        existingItem.first.quantity += quantity;
      } else {
        widget.cartItems.add(CartItem(game: game, quantity: quantity));
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${game.title} added to cart x$quantity!'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.game.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Image.asset(
            widget.game.image,
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 12),
          Text(
            'Price per unit: ₱${widget.game.amount.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                  }
                },
                icon: const Icon(Icons.remove_circle_outline),
              ),
              Text(
                '$quantity',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(fontSize: 20),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                },
                icon: const Icon(Icons.add_circle_outline),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Total: ₱${totalPrice.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  addToCart(widget.game, quantity);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Add to Cart'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Checkout(cartItems: widget.cartItems),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart_checkout),
                label: const Text('View Cart'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
