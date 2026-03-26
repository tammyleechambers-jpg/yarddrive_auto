import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  // Demo list of orders
  List<Map<String, dynamic>> orders = [
    {"part": "Brake Pad", "status": "Pending"},
    {"part": "Oil Filter", "status": "Delivered"},
  ];

  // Function to delete order
  void deleteOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Order deleted"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Orders")),
      body: orders.isEmpty
          ? Center(child: Text("No orders yet"))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(order['part']),
                    subtitle: Text("Status: ${order['status']}"),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteOrder(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Demo: add a new order
          setState(() {
            orders.add({"part": "New Part", "status": "Pending"});
          });
        },
      ),
    );
  }
}
