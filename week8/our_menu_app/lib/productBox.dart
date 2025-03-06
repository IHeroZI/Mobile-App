import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    this.description,
  });

  final String name;
  final int price;
  final String image;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              name: name,
              price: price,
              image: image,
              description: description,
            ),
          ),
        );
      },
      child: Container(
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
            const SizedBox(height: 2),
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
      ),
    );
  }
}