import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: '1',
      title: 'Product 1',
      description: 'Description 1',
      price: 10.0,
      imageUrl: 'https://pixlr.com/images/generator/how-to-generate.webp',
    ),
    Product(
      id: '2',
      title: 'Product 2',
      description: 'Description 2',
      price: 20.0,
      imageUrl: 'https://pixlr.com/images/generator/how-to-generate.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.network(products[i].imageUrl),
          title: Text(products[i].title),
          subtitle: Text('\Rs ${products[i].price}'),
          trailing: IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () {
              Provider.of<CartProvider>(context, listen: false)
                  .addItem(products[i]);
            },
          ),
        ),
      ),
    );
  }
}
