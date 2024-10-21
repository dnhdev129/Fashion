import 'package:flutter/material.dart';
import 'ProductDetailsScreen.dart'; // Import trang ProductDetailsScreen
import 'models/Product.dart'; // Import Product model

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Danh sách sản phẩm đã lọc
  List<Product> filteredProducts = products;

  // Bộ điều khiển TextField để tìm kiếm
  TextEditingController searchController = TextEditingController();

  // Hàm lọc sản phẩm dựa vào tiêu đề
  void filterProducts(String query) {
    List<Product> filteredList = products.where((product) {
      return product.title?.toLowerCase().contains(query.toLowerCase()) ??
          false;
    }).toList();

    setState(() {
      filteredProducts = filteredList;
    });
  }

  @override
  void initState() {
    super.initState();
    // Khi khởi tạo, tất cả sản phẩm sẽ hiển thị
    filteredProducts = products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sản Phẩm'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Gọi hàm filter khi thay đổi giá trị trong ô tìm kiếm
                filterProducts(value);
              },
              decoration: InputDecoration(
                hintText: 'Tìm kiếm sản phẩm...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];

          return GestureDetector(
            onTap: () {
              // Điều hướng đến ProductDetailsScreen khi nhấn vào sản phẩm
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: product),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Image.asset(
                    product.image ??
                        'assets/default_image.png', // Hình ảnh mặc định
                    height: 150, // Chiều cao cho hình ảnh sản phẩm
                    fit: BoxFit
                        .cover, // Đảm bảo hình ảnh hiển thị đầy đủ trong khung
                  ),
                  SizedBox(height: 8),
                  Text(
                    product.title ??
                        'No Title', // Tiêu đề mặc định nếu không có tiêu đề
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Canh giữa tiêu đề sản phẩm
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
