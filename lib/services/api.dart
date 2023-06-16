import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class Api {
  static const baseUrl = "https://tiny-erin-wildebeest-fez.cyclic.app/api/";

  static addproduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}add_product");

    try {
      final res = await http.post(url, body: pdata);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get response");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<List<Product>> getProduct() async {
    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body) as List<dynamic>;

        List<Product> products = data.map((item) {
          return Product(
            id: item["_id"],
            name: item["pname"],
            price: item["pprice"],
            desc: item["pdesc"],
          );
        }).toList();

        return products;
      } else {
        throw Exception("Failed to fetch products");
      }
    } catch (e) {
      throw Exception("Failed to connect to the server");
    }
  }

  static Future<void> updateProduct(
      String id, Map<String, dynamic> body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    try {
      final res = await http.patch(url, body: body);
      if (res.statusCode == 200) {
        print(jsonDecode(res.body));
      } else {
        print("Failed to Update Data");
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    try {
      final res = await http.delete(url);
      if (res.statusCode == 204) {
        print(jsonDecode(res.body));
      } else {
        print("Failed to Delete the Product");
      }
    } catch (e) {
      print(e);
    }
  }
}
