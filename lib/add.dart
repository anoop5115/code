import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class adduser extends StatefulWidget {
  const adduser({Key? key}) : super(key: key);

  @override
  State<adduser> createState() => _adduserState();
}

class _adduserState extends State<adduser> {
  @override
  final blood = ['0-', 'o+'];

  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController address = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController city = TextEditingController();

  void adddonar() {
    final data = {
      'address': address.text,
      'date': date.text,
      'phone': phone.text,
      'quantity': quantity.text,
      'city': city.text
    };
    donor.add(data);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add user")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: address,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("address")),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: city,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("city")),
            ),
            TextField(
              controller: phone,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("phone number")),
            ),
            TextField(
              controller: quantity,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("quantity")),
            ),
            TextField(
              controller: date,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("date")),
            ),
            ElevatedButton(
              onPressed: () {
                adddonar();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  maximumSize:
                      MaterialStateProperty.all(Size(double.infinity, 50)),
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text("submit"),
            )
          ],
        ),
      ),
    );
  }
}
