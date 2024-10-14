class Product {
  final String? image, title, description;
  final int price, size, id;
  int quantity; // Thêm thuộc tính số lượng

  Product({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.size,
    this.id = 0,
    this.quantity = 1, // Khởi tạo số lượng mặc định là 1
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Office Bag",
    price: 299,
    size: 12,
    description: "Chiếc túi văn phòng tiện lợi, thiết kế hiện đại.",
    image: "assets/images/bag_1.png",
  ),
  Product(
    id: 2,
    title: "Belt Bag",
    price: 234,
    size: 8,
    description: "Túi đeo chéo thời trang với phong cách trẻ trung.",
    image: "assets/images/bag_2.png",
  ),
  Product(
    id: 3,
    title: "Hang Top",
    price: 234,
    size: 10,
    description: "Túi xách tay nữ sang trọng, chất liệu da cao cấp.",
    image: "assets/images/bag_3.png",
  ),
  Product(
    id: 4,
    title: "Old Fashion",
    price: 234,
    size: 11,
    description: "Phong cách cổ điển, dành cho người thích sự hoài cổ.",
    image: "assets/images/bag_4.png",
  ),
  Product(
    id: 5,
    title: "Office Code",
    price: 234,
    size: 12,
    description: "Sự kết hợp giữa tiện ích và thời trang công sở.",
    image: "assets/images/bag_5.png",
  ),
  Product(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: "Một chiếc túi tuyệt vời cho dân công sở.",
    image: "assets/images/bag_6.png",
  ),
  Product(
    id: 7,
    title: "Túi vải bố",
    price: 234,
    size: 12,
    description: "Chất liệu vải bố bền đẹp, thân thiện với môi trường.",
    image: "assets/images/bag7.jpg",
  ),
  Product(
    id: 8,
    title: "Túi vải",
    price: 234,
    size: 12,
    description: "Túi vải đa năng, phù hợp cho mọi dịp.",
    image: "assets/images/bag8.jpg",
  ),
  Product(
    id: 9,
    title: "Túi đeo nữ Venu",
    price: 234,
    size: 12,
    description: "Túi đeo nữ phong cách thời trang, hiện đại.",
    image: "assets/images/bag_9.png",
  ),
  Product(
    id: 10,
    title: "Túi đeo nữ Xì trum",
    price: 234,
    size: 12,
    description: "Sản phẩm chất lượng cao, phong cách dễ thương.",
    image: "assets/images/bag_10.png",
  ),
  Product(
    id: 11,
    title: "Túi đeo nữ Việt Tiến",
    price: 234,
    size: 12,
    description: "Sản phẩm nội địa với thiết kế thanh lịch.",
    image: "assets/images/bag_11.png",
  ),
  Product(
    id: 12,
    title: "Túi đeo nữ Coop",
    price: 234,
    size: 12,
    description: "Thiết kế đơn giản nhưng không kém phần tinh tế.",
    image: "assets/images/bag_12.png",
  ),
];

String dummyText = "Đây là sản phẩm tuyệt vời. Không thể tin được";
