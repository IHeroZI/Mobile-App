import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting =
        hour < 12 ? "Good Morning, Chawalwit" : "Good Afternoon, Chawalwit";
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(greeting),
        ),
        actions: [
          Icon(Icons.location_on_outlined),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(
                Icons.coffee,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/products', arguments: 'Drinks');
              },
            ),
            IconButton(
              icon: Icon(Icons.fastfood),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/products', arguments: 'Bakery');
              },
            ),
            IconButton(
              icon: Icon(Icons.store_mall_directory),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/products', arguments: 'At Home');
              },
            ),
            IconButton(
              icon: Icon(Icons.blender),
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, '/products', arguments: 'Tumbler');
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          height: 100,
          child: Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(color: const Color.fromARGB(255, 51, 128, 54)),
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(children: [
                    Text(
                      "Green 126 ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    )
                  ]))),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "News & Promotion",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              NewsCard(title: "Cheers!", image: "assets/images/news1.png"),
              NewsCard(
                  title: "Comfort is Calling",
                  image: "assets/images/news2.png"),
              NewsCard(title: "Gifting Day", image: "assets/images/news3.png"),
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(selectedIndex: 0),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String title;
  final String image;

  NewsCard({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 16),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 194, 214),
              borderRadius: BorderRadius.circular(20)),
          height: 500,
          width: 300,
          child: Column(
            children: [
              Text(title),
              Image.asset(image, width: 280),
            ],
          ),
        ));
  }
}
