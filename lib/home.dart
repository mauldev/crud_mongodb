import 'package:crud_mongodb/create.dart';
import 'package:crud_mongodb/delete.dart';
import 'package:crud_mongodb/fetch.dart';
import 'package:crud_mongodb/update.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CreateData()),
                  );
                },
                child: const Text('CREATE')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FetchData()),
                  );
                },
                child: const Text('READ')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UpdateData()),
                  );
                },
                child: const Text('UPDATE')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeleteData()),
                  );
                },
                child: const Text('DELETE')),
          ],
        ),
      ),
    );
  }
}
