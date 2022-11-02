import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Transferencias",
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.0'),
              subtitle: Text('1000'),
            )
          ),
          Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100.0'),
                subtitle: Text('1000'),
              )
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),


      ),
    ),
  ));
}
