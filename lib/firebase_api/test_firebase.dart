import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

// https://www.youtube.com/watch?v=jDkKXJQ5xjE
class _TestPageState extends State<TestPage> {
  final Future<FirebaseApp> firebase = Firebase.initializeApp(); // เตรียม firebase
  final CollectionReference _carsCollection = FirebaseFirestore.instance.collection('cars');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Error'),
            ),
            body: Center(
              child: Text('${snapshot.error}'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(title: Text('Cars Data')),
            body: StreamBuilder(
              stream:
              _carsCollection.snapshots()
              // FirebaseFirestore.instance.collection('cars').snapshots()
              ,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      child: Row(
                        children: [Text('${document['name']},   ${document['type']}')],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
