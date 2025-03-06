import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String category =
        ModalRoute.of(context)!.settings.arguments as String;

    final Map<String, List<Map<String, dynamic>>> products = {
      'Bakery': [
        {
          "name": "Banana ChocChip Muffin",
          "image": "assets/images/banana_muffin.png",
          "price": "75 Baht"
        },
        {
          "name": "Chocolate Glazed Donut",
          "image": "assets/images/choco_donut.png",
          "price": "50 Baht"
        },
        {
          "name": "Custard Cream Waffle",
          "image": "assets/images/mochi_waffle.png",
          "price": "65 Baht"
        },
        {
          "name": "Chocolate Pain Suisse",
          "image": "assets/images/choco_pain.png",
          "price": "125 Baht"
        },
        {
          "name": "Jumbo Sausage Bite",
          "image": "assets/images/sausage_bite.png",
          "price": "155 Baht"
        },
        {
          "name": "Chocolate Chip Cookie",
          "image": "assets/images/cookie.png",
          "price": "75 Baht"
        },
        {
          "name": "Dark Chocolate Bun",
          "image": "assets/images/dark_chocolate.png",
          "price": "100 Baht"
        },
        {
          "name": "Toaster Pancake",
          "image": "assets/images/toaster_pancake.png",
          "price": "95 Baht"
        },
      ],
      'Drinks': [
        {
          "name": "Hot Milk",
          "image": "assets/images/hotmilk.png",
          "price": "95 Baht"
        },
        {
          "name": "Hot Latte",
          "image": "assets/images/hotlatte.png",
          "price": "150 Baht",
        },
        {
          "name": "Cappuchino",
          "image": "assets/images/cappuchino.png",
          "price": "95 Baht"
        },
        {
          "name": "Espresso",
          "image": "assets/images/espresso.png",
          "price": "150 Baht",
        },
        {
          "name": "Chocolate",
          "image": "assets/images/chocolate.png",
          "price": "95 Baht"
        },
        {
          "name": "Ice Blackcurrant Tea",
          "image": "assets/images/iceblackcurranttea.png",
          "price": "150 Baht",
        },
        {
          "name": "Pure Matcha Latte",
          "image": "assets/images/purematchalatte.png",
          "price": "75 Baht"
        },
        {
          "name": "Pure Matcha Frappuccino",
          "image": "assets/images/purematchafrap.png",
          "price": "180 Baht"
        },
      ],
      'At Home': [
        {
          "name": "Breakfast Blend",
          "image": "assets/images/breakfastblend.png",
          "price": "545 Baht"
        },
        {
          "name": "Italian Roast",
          "image": "assets/images/italianroast.png",
          "price": "350 Baht"
        },
        {
          "name": "Caramel Latte",
          "image": "assets/images/caramellatte.png",
          "price": "225 Baht"
        },
        {
          "name": "Coffee Verona",
          "image": "assets/images/coffeeverona.png",
          "price": "350 Baht"
        },
      ],
      'Tumbler': [
        {
          "name": "Bearista Lion Mug",
          "image": "assets/images/bearistalionmug.png",
          "price": "1,100 Baht"
        },
        {
          "name": "Red Tumbler",
          "image": "assets/images/redtumbler.png",
          "price": "950 Baht"
        },
        {
          "name": "Floral Snake Tumbler",
          "image": "assets/images/floralsnaketumbler.png",
          "price": "1,150 Baht"
        },
        {
          "name": "Pink Cold Cup",
          "image": "assets/images/pinkcoldcup.png",
          "price": "850 Baht"
        },
      ]
    };

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Text(
              category,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: products[category]?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = products[category]![index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          product['image'],
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          product['name'],
                          style: TextStyle(fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          product['price'],
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
