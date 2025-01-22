import 'package:flutter/material.dart';
import 'package:our_menu_app/productBox.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "name": "ราเมง",
        "price": 80,
        "image": "1.jpg",
        "description": "เส้นนุ่มๆ ลื่นคอ",
      },
      {
        "name": "ผัดซีอิ้ว",
        "price": 60,
        "image": "2.jpg",
        "description": "ที่เห็นสีดำ เพราะไหม้",
      },
      {
        "name": "ไก่ย่าง",
        "price": 65,
        "image": "3.png",
        "description": "ไก่จากหาดใหญ่ คัดมาจากฟาร์มโคนม",
      },
      {
        "name": "ข้าวผัด",
        "price": 50,
        "image": "4.png",
        "description": "ผัด ผัด ผัด ผัด",
      },
      {
        "name": "ผัดไทย",
        "price": 60,
        "image": "5.png",
        "description": "ผัดที่ไทย ถูกใจฝรั่ง",
      },
      {
        "name": "สลัดผัก",
        "price": 70,
        "image": "6.jpg",
        "description": "ผักทั่วไป",
      },
      {
        "name": "ข้าวผัด",
        "price": 50,
        "image": "4.png",
        "description": "ผัด ผัด ผัด ผัด",
      },
      {
        "name": "ผัดซีอิ้ว",
        "price": 60,
        "image": "2.jpg",
        "description": "ที่เห็นสีดำ เพราะไหม้",
      },
      {
        "name": "ราเมง",
        "price": 80,
        "image": "1.jpg",
        "description": "เส้นนุ่มๆ ลื่นคอ",
      },
      {
        "name": "ผัดไทย",
        "price": 60,
        "image": "5.png",
        "description": "ผัดที่ไทย ถูกใจฝรั่ง",
      },
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
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
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
            description: products[index]["description"],
          );
        },
      ),
    );
  }
}
