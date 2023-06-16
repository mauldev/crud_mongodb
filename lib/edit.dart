import 'package:crud_mongodb/models/product_model.dart';
import 'package:crud_mongodb/services/api.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key, required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    nameController.text = widget.data.price.toString();
    nameController.text = widget.data.desc.toString();
  }

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
                  Api.updateProduct(widget.data.id, {
                    'id': widget.data.id,
                    'pname': nameController.text,
                    'pdesc': descController.text,
                    'pprice': priceController.text,
                  });
                },
                child: const Text("Update Data"))
          ],
        ),
      ),
    );
  }
}
