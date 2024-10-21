import 'package:flutter/material.dart';
import 'package:test1/CartScreen.dart';
import 'package:test1/HomeScreen.dart';
import 'package:test1/LoginScreen.dart';
import 'package:test1/ProductScreen.dart';
import 'package:test1/UserListScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Xác định các trang để điều hướng
  final List<Widget> _pages = [
    HomeScreen(),
    ProductScreen(),
    CartScreen(),
    UserListScreen(),
  ];

  // Chức năng xử lý chuyển đổi tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Hiển thị trang tương ứng
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Màu nền đậm hơn cho thanh điều hướng
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange, // Màu khi mục được chọn
        unselectedItemColor: Colors.black, // Màu khi mục không được chọn
        onTap: _onItemTapped,
      ),
    );
  }
}
