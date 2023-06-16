import 'package:crud_mongodb/edit.dart';
import 'package:crud_mongodb/models/product_model.dart';
import 'package:crud_mongodb/services/api.dart';
import 'package:flutter/material.dart';

class UpdateData extends StatelessWidget {
  const UpdateData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.storage),
                    title: Text("${pdata[index].name}"),
                    subtitle: Text("${pdata[index].desc}"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditScreen(
                                    data: pdata[index],
                                  )),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
