import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Product Listing")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const <Widget>[
            ProductBox(
                name: "Nike Air Force 1",
                description: "Nike No.1 forever.",
                price: 3500,
                image: "NIKE.png"),
            ProductBox(
                name: "Converse Run Star Hike",
                description: "So tall, So good.",
                price: 4700,
                image: "converse.jpg"),
            ProductBox(
                name: "New Balance 530",
                description: "Walk so soft",
                price: 3700,
                image: "newbalance.jpg"),
            ProductBox(
                name: "vans old skool",
                description: "Very Very OG",
                price: 2690,
                image: "vans.jpg"),
            ProductBox(
                name: "Adidas Superstar",
                description: "for skrt boy.",
                price: 4000,
                image: "adidas.jpg"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox(
      {super.key,
      required this.name,
      required this.description,
      required this.price,
      required this.image});

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/appimages/" + image),
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.description),
                        Text("Price: \$" + this.price.toString()),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
