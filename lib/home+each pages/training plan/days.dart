import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Day1(),
  ));
}

class Day1 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 1" ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.shade300,
                      Colors.teal.shade600,
                      Colors.teal.shade900,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


class Day2 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 2",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class Day3 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 3",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class Day4 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 4",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class Day5 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 5",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class Day6 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 6",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class Day7 extends StatelessWidget {
  final List<Map<String, String>> items = [
    {"title": "Card 1", "subtitle": "This is the first card."},
    {"title": "Card 2", "subtitle": "This is the second card."},
    {"title": "Card 3", "subtitle": "This is the third card."},
    {"title": "Card 4", "subtitle": "This is the fourth card."},
    {"title": "Card 5", "subtitle": "This is the fifth card."},
    {"title": "Card 6", "subtitle": "This is the sixth card."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Day 7",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.teal.shade900),),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade300,
                    Colors.teal.shade600,
                    Colors.teal.shade900,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        items[index]["subtitle"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
