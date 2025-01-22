import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto_Mono',
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontFamily: 'Noto_Sans_Thai'),
        ),
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {"name": "ราเมง", "price": 80, "image": "1.jpg"},
      {"name": "ผัดซีอิ้ว", "price": 60, "image": "2.jpg"},
      {"name": "ไก่ย่าง", "price": 65, "image": "3.png"},
      {"name": "ข้าวผัด", "price": 50, "image": "4.png"},
      {"name": "ผัดไทย", "price": 60, "image": "5.png"},
      {"name": "สลัดผัก", "price": 70, "image": "6.jpg"},
      {"name": "ข้าวผัด", "price": 50, "image": "4.png"},
      {"name": "ผัดซีอิ้ว", "price": 60, "image": "2.jpg"},
      {"name": "ราเมง", "price": 80, "image": "1.jpg"},
      {"name": "ผัดไทย", "price": 60, "image": "5.png"},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          "Our Menu",
          style: TextStyle(
            fontFamily: 'Roboto_Mono',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(Icons.shopping_cart),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductBox(
            name: products[index]["name"],
            price: products[index]["price"],
            image: products[index]["image"],
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  final String name;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.65),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset("assets/images/$image"),
              const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.pink,
                  size: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            name,
            style: const TextStyle(
              fontFamily: 'Noto_Sans_Thai',
              color: Color.fromARGB(255, 78, 78, 78),
              letterSpacing: .2,
              fontSize: 22,
            ),
          ),
          Text(
            "$price บาท",
            style: const TextStyle(
              fontFamily: 'Roboto_Mono',
              color: Color.fromARGB(202, 255, 17, 0),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
