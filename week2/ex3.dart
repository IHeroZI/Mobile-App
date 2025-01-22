const pizzaPrices = {
  'margherita': 5.5,
  'pepperoni': 7.5,
  'vegetarian': 6.5,
};

void main(List<String> pizza) {
  double total = 0;
  for (int i = 0; i < pizza.length; i++) {
    if (pizza[i] == 'margherita') {
      print("margherita: \$${pizzaPrices['margherita']}");
      total += pizzaPrices['margherita']!;
    } else if (pizza[i] == 'pepperoni') {
      print("pepperoni: \$${pizzaPrices['pepperoni']}");
      total += pizzaPrices['pepperoni']!;
    } else if (pizza[i] == 'vegetarian') {
      print("vegetarian: \$${pizzaPrices['vegetarian']}");
      total += pizzaPrices['vegetarian']!;
    } else {
      print("${pizza[i]} pizza is not on the menu");
    }
  }
  print("\nTotal: \$${total}");
}
