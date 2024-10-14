import 'dart:io';
import 'package:flutter/material.dart';
import 'package:test1/CartScreen.dart';
import 'package:test1/MyHttpOverrides.dart';
import 'package:test1/models/Product.dart';
import 'package:test1/ProductDetailsScreen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Gọi trang HomeScreen
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Image.network(
              'https://img.freepik.com/premium-vector/ho-chi-minh-city-vietnam-skyline-with-panorama-white-background-vector-illustration-business-travel-tourism-concept-with-modern-buildings-image-banner-web-site_596401-63.jpg?w=1060'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color(0xffcf83a9),
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Điều hướng đến trang chi tiết sản phẩm
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        product: products[index], // Truyền sản phẩm đã chọn
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffebf0f2),
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15.0)),
                          child: Hero(
                            tag: "${products[index].id}",
                            child: Image.asset(
                              products[index].image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(
                            products[index].title.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  Text(
                                    "${products[index].price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
