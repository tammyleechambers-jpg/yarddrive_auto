import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

class OrdersPage extends StatelessWidget {

  final TextEditingController partController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),

      body: StreamBuilder<QuerySnapshot>(
        stream: FirestoreService().getOrders(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final orders = snapshot.data!.docs;

          if (orders.isEmpty) {
            return Center(child: Text("No orders yet"));
          }

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {

              final order = orders[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(order["partName"]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      FirestoreService().deleteOrder(order.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text("New Order"),
              content: TextField(
                controller: partController,
                decoration: InputDecoration(labelText: "Part Name"),
              ),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: Text("Add"),
                  onPressed: () {
                    FirestoreService()
                        .addOrder(partController.text.trim());
                    partController.clear();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
