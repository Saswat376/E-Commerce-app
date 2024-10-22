import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final product = cart.items.values.toList()[i];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text('\Rs ${product.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cart.removeItem(product.id);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total: \Rs ${cart.totalAmount}',
                style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
