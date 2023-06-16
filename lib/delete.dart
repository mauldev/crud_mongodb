import 'package:crud_mongodb/models/product_model.dart';
import 'package:crud_mongodb/services/api.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({super.key});

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text("${pdata[index].name}"),
                    subtitle: Text("${pdata[index].desc}"),
                    trailing: IconButton(
                      onPressed: () async {
                        Api.deleteProduct(pdata[index].id);
                        pdata.removeAt(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
