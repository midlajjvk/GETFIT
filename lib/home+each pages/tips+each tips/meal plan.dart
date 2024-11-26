import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MealplanTip(
        title: 'Introducing meal plan',
      ),
    );
  }
}

class MealplanTip extends StatelessWidget {
  final String title;

  MealplanTip({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tips"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center( // Center the image
                  child: Image.asset(
                    'assets/images/img_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "Meal plan",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  "A well-structured meal plan is essential for "
                      "maintaining energy levels, supporting weight"
                      " management, and promoting overall health. Start your day with a nutritious breakfast,"
                      " such as two scrambled eggs or a cup of plain Greek yogurt paired with a slice of whole-grain "
                      "toast or half a cup of oatmeal. Add a small banana or some mixed berries for natural sweetness,"
                      " and include a tablespoon of peanut butter or chia seeds for healthy fats. Mid-morning, enjoy a "
                      "light snack like a handful of unsalted almonds or walnuts, or try carrot sticks with hummus for"
                      " a savory option. For lunch, prioritize a balanced plate featuring a lean protein like grilled "
                      "chicken or baked salmon, a large salad with spinach, kale, cucumber, and cherry tomatoes,"
                      " dressed with olive oil and lemon juice, and a carbohydrate source such as half a cup of"
                      " quinoa or a medium sweet potato In the afternoon, keep hunger at bay with a snack, "
                      "such as a low-sugar protein bar, cottage cheese, or a small handful of trail mix. Dinner "
                      "should be light yet satisfying, featuring a protein like baked fish or lean turkey, paired "
                      "with steamed or roasted vegetables such as broccoli, green beans, or Brussels sprouts, and a "
                      "healthy fat like a quarter avocado or olive oil drizzle. If you crave something sweet"
                      " post-dinner, opt for a small piece of dark chocolate (70% cacao or higher) or fresh fruit "
                      "like strawberries or kiwi. Throughout the day, stay hydrated with water or herbal teas,"
                      " avoiding sugary beverages. This meal plan is designed to provide sustained energy, essential"
                      " nutrients, and satisfaction while supporting your health goals.",
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
