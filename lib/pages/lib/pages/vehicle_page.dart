import 'package:flutter/material.dart';

class VehiclePage extends StatefulWidget {
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {

  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();

  Map<String, String> vehicle = {};

  void saveVehicle() {
    setState(() {
      vehicle = {
        "make": makeController.text,
        "model": modelController.text,
        "year": yearController.text,
      };
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Vehicle saved!"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Vehicle")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: makeController,
              decoration: InputDecoration(labelText: "Make"),
            ),

            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: "Model"),
            ),

            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: "Year"),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveVehicle,
              child: Text("Save Vehicle"),
            ),

            SizedBox(height: 30),

            vehicle.isEmpty
              ? Text("No vehicle saved yet")
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Vehicle:"),
                    Text("Make: ${vehicle['make']}"),
                    Text("Model: ${vehicle['model']}"),
                    Text("Year: ${vehicle['year']}"),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
