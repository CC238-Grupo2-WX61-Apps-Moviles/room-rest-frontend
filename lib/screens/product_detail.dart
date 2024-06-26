import 'package:flutter/material.dart';
import 'package:akira_mobile/screens/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/cart_service.dart';
import 'cart_model.dart';
import 'login.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

   ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  final Map<String, dynamic> userData = UserDataProvider.userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.image,
                    height: 400.0, 
                    width: 400.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'S/. ${product.price}',
                          style: const TextStyle(fontSize: 20.0, color: Colors.green),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          product.description ?? 'No description available',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            CartItem item = CartItem(
                              id: product.id,
                              quantity: 1,
                              userId: userData['userId'],
                              nameCategory: product.nameCategory,
                              name: product.name,
                              price: product.price,
                              color: product.color,
                              category: product.category,
                              description: product.description,
                              image: product.image,
                              productId: product.id,
                            );
                            CartService().addToCart(item);
                            Fluttertoast.showToast(
                                msg: "Producto agregado al carrito",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          },
                          child: const Text('Agregar al carrito'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    product.image,
                    height: 300.0, 
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'S/. ${product.price}',
                    style: const TextStyle(fontSize: 20.0, color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    product.description ?? 'No description available',
                    style: const TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      CartItem item = CartItem(
                        id: product.id,
                        quantity: 1,
                        userId: userData['userId'],
                        nameCategory: product.nameCategory,
                        name: product.name,
                        price: product.price,
                        color: product.color,
                        category: product.category,
                        description: product.description,
                        image: product.image,
                        productId: product.id,
                      );
                      CartService().addToCart(item);
                      Fluttertoast.showToast(
                          msg: "Producto agregado al carrito",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    },
                    child: const Text('Agregar al carrito'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
