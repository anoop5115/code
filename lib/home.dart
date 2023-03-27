import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  void donate(docid) {
    donor.doc(docid).delete();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("test")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: donor.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot donorSnap = snapshot.data.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        // decoration: BoxDecoration(boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.pink,
                        //       blurRadius: 10,
                        //       spreadRadius: 10),
                        // ]),
                        color: Colors.pink[50],
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "ADDRESS:",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['address'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "CITY:",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['city'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "DATE:",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['date'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "quantity:",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['quantity'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Text(
                                    "PHONE NO:",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.red),
                                  ),
                                  Text(
                                    donorSnap['phone'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      donate(donorSnap.id);
                                    },
                                    child: Text('DONATE')),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
