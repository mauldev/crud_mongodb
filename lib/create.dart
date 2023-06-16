import 'package:crud_mongodb/services/api.dart';
import 'package:flutter/material.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration:
                  const InputDecoration(hintText: "Name of the product"),
            ),
            TextField(
              controller: priceController,
              decoration:
                  const InputDecoration(hintText: "Price of the product"),
            ),
            TextField(
              controller: descController,
              decoration:
                  const InputDecoration(hintText: "Description of the product"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var data = {
                    "pname": nameController.text,
                    "pprice": priceController.text,
                    "pdesc": descController.text,
                  };

                  Api.addproduct(data);
                },
                child: const Text("Create Data"))
          ],
        ),
      ),
    );
  }
}
