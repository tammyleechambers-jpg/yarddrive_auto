import 'package:flutter/material.dart';

class PartsPage extends StatelessWidget {

  final List<Map<String, dynamic>> demoParts = [
    {"name": "Brake Pad", "price": 50.0},
    {"name": "Oil Filter", "price": 15.0},
    {"name": "Air Filter", "price": 20.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Auto Parts")),
      body: ListView.builder(
        itemCount: demoParts.length,
        itemBuilder: (context, index) {

          final part = demoParts[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(part['name']),
              subtitle: Text("\$${part['price']}"),
              trailing: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${part['name']} ordered!"))
                  );
                },
                child: Text("Order"),
              ),
            ),
          );
        },
      ),
    );
  }
}
