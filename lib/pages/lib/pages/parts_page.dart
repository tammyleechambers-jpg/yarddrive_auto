import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class PartsPage extends StatefulWidget {
  @override
  _PartsPageState createState() => _PartsPageState();
}

class _PartsPageState extends State<PartsPage> {

  final TextEditingController searchController = TextEditingController();

  final List<String> allParts = [
    "Brake Pad",
    "Oil Filter",
    "Air Filter",
    "Spark Plug",
    "Radiator",
    "Fuel Pump",
    "Battery",
    "Alternator"
  ];

  List<String> filteredParts = [];

  @override
  void initState() {
    super.initState();
    filteredParts = allParts;
  }

  void searchParts(String query) {
    final results = allParts
        .where((part) =>
            part.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredParts = results;
    });
  }

  void orderPart(String part) {

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirm Order"),
        content: Text("Order $part ?"),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text("Order"),
            onPressed: () {
              FirestoreService().addOrder(part);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$part ordered"))
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Browse Parts")),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search Parts",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: searchParts,
            ),

            SizedBox(height: 20),

            Expanded(
              child: filteredParts.isEmpty
                  ? Center(child: Text("No parts found"))
                  : ListView.builder(
                      itemCount: filteredParts.length,
                      itemBuilder: (context, index) {

                        final part = filteredParts[index];

                        return Card(
                          child: ListTile(
                            title: Text(part),
                            trailing: ElevatedButton(
                              child: Text("Order"),
                              onPressed: () => orderPart(part),
                            ),
                          ),
                        );
                      },
                    ),
            )

          ],
        ),
      ),
    );
  }
}
