import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class VehiclePage extends StatefulWidget {
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {

  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();

  bool loading = false;
  bool fetching = true;

  Map<String, dynamic>? vehicle;

  @override
  void initState() {
    super.initState();
    loadVehicle();
  }

  void loadVehicle() async {

    final data = await FirestoreService().getVehicle();

    if (data != null) {
      makeController.text = data["make"];
      modelController.text = data["model"];
      yearController.text = data["year"];
    }

    setState(() {
      vehicle = data;
      fetching = false;
    });
  }

  void saveVehicle() async {

    setState(() {
      loading = true;
    });

    await FirestoreService().saveVehicle(
      make: makeController.text.trim(),
      model: modelController.text.trim(),
      year: yearController.text.trim(),
    );

    setState(() {
      loading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Vehicle saved successfully"))
    );
  }

  @override
  Widget build(BuildContext context) {

    if (fetching) {
      return Scaffold(
        appBar: AppBar(title: Text("My Vehicle")),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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

            loading
              ? CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: saveVehicle,
                  child: Text("Save Vehicle"),
                ),

          ],
        ),
      ),
    );
  }
}
