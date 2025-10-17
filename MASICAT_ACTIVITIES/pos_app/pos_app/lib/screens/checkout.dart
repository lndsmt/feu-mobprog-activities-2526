import 'package:flutter/material.dart';
import 'package:pos_app/charts/chart.dart';
import 'package:pos_app/models/cart_items.dart';
import 'package:pos_app/models/games.dart';
import 'package:pos_app/screens/login.dart';

class Checkout extends StatefulWidget {
  final List<CartItem> cartItems;

  const Checkout({super.key, required this.cartItems});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  void removeItem(CartItem item) {
    final itemIndex = widget.cartItems.indexOf(item);

    setState(() {
      widget.cartItems.remove(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: Text('${item.game.title} removed from cart.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              widget.cartItems.insert(itemIndex, item);
            });
          },
        ),
      ),
    );
  }

  double get grandTotal =>
      widget.cartItems.fold(0, (sum, item) => sum + item.total);

  List<GameItem> get allGames =>
      widget.cartItems.map((cartItem) => cartItem.game).toList();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget mainContent = Center(
      child: Text(
        'No items in cart. Try adding some games!',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );

    if (widget.cartItems.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (ctx, index) {
          final item = widget.cartItems[index];
          return Dismissible(
            key: ValueKey(item.game.title),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => removeItem(item),
            background: Container(
              color: Theme.of(
                context,
              ).colorScheme.inversePrimary.withOpacity(0.2),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: Image.asset(
                item.game.image,
                width: 40,
                height: 40,
              ),
              title: Text(item.game.title),
              subtitle: Text(
                '₱${item.game.amount.toStringAsFixed(2)} x ${item.quantity}',
              ),
              trailing: Text(
                '₱${item.total.toStringAsFixed(2)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout - Total: ₱${grandTotal.toStringAsFixed(2)}'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: screenWidth < 600
          ? Column(
              children: [
                Chart(game: allGames),
                Expanded(child: mainContent),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.home),
                        label: const Text('Return to Main Screen'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.logout),
                        label: const Text('Logout'),
                        onPressed: () {
                          setState(() {
                            widget.cartItems.clear();
                          });
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(game: allGames)),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: mainContent),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ElevatedButton.icon(
                              icon: const Icon(Icons.home),
                              label: const Text('Return to Main Screen'),
                              onPressed: () => Navigator.pop(context),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.logout),
                              label: const Text('Logout'),
                              onPressed: () {
                                setState(() {
                                  widget.cartItems.clear();
                                });
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                  (route) => false,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
