import 'package:flutter/material.dart';

void main() {
  runApp(PizzaApp());
}

class Ingredient {
  final String name;
  final bool isVegan;

  Ingredient({required this.name, required this.isVegan});
}

class Pizza {
  final String name;
  final List<Ingredient> ingredients;

  Pizza({required this.name, required this.ingredients});
}

class PizzaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Définir les ingrédients
    Ingredient tomatoSauce = Ingredient(name: 'Tomato Sauce', isVegan: true);
    Ingredient mozzarella = Ingredient(name: 'Mozzarella', isVegan: false);
    Ingredient mushrooms = Ingredient(name: 'Mushrooms', isVegan: true);
    Ingredient pepperoni = Ingredient(name: 'Pepperoni', isVegan: false);
    Ingredient olives = Ingredient(name: 'Olives', isVegan: true);
    Ingredient basil = Ingredient(name: 'Basil', isVegan: true);

    // Créer des pizzas
    Pizza margherita = Pizza(
      name: 'Margherita',
      ingredients: [tomatoSauce, mozzarella, basil],
    );

    Pizza pepperoniPizza = Pizza(
      name: 'Pepperoni Pizza',
      ingredients: [tomatoSauce, mozzarella, pepperoni],
    );

    Pizza veggie = Pizza(
      name: 'Veggie Pizza',
      ingredients: [tomatoSauce, mushrooms, olives, basil],
    );

    // Liste de pizzas
    List<Pizza> pizzas = [margherita, pepperoniPizza, veggie];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pizza Ingredients'),
        ),
        body: ListView.builder(
          itemCount: pizzas.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pizzas[index].name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pizzas[index].ingredients.map((ingredient) {
                        return Text(
                          '${ingredient.name} ${ingredient.isVegan ? "(Vegan)" : "(Non-Vegan)"}',
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
