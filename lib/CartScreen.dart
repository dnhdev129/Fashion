import 'package:flutter/material.dart';
import 'models/Product.dart';
import 'models/Cart.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ của bạn'),
      ),
      body: Cart.cartItems.isEmpty
          ? Center(
              child: Text('Giỏ hàng của bạn trống'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: Cart.cartItems.length,
                    itemBuilder: (context, index) {
                      Product product = Cart.cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          product.image ?? 'assets/default_image.png',
                          width: 50,
                          height: 50,
                        ),
                        title: Text(product.title ?? 'No Title'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\$${product.price}"),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (product.quantity > 1) {
                                        product.quantity--;
                                      } else {
                                        Cart.removeFromCart(product);
                                      }
                                    });
                                  },
                                ),
                                Text(
                                    '${product.quantity}'), // Hiển thị số lượng
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      product.quantity++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              Cart.removeFromCart(product);
                            });

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('${product.title} removed from cart'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${Cart.getTotalPrice().toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Xử lý khi nhấn nút thanh toán
                          print("Proceed to Checkout");
                        },
                        child: Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
