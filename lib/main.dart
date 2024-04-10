import 'dart:io';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Call the function to add CSV data to Firestore
  await addCsvDataToFirestore('professors'); // Specify the collection name
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Data Example',
      debugShowCheckedModeBanner: false,
      home: FirestoreDataScreen(),
    );
  }
}

class FirestoreDataScreen extends StatelessWidget {
  final String collectionName = 'professors'; // Collection name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Data'),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection(collectionName).snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child:
                  CircularProgressIndicator(), // Display a loading indicator while data is being fetched
            );
          }

          return ListView(
            children: snapshot.data!.docs
                .map((QueryDocumentSnapshot<Map<String, dynamic>> document) {
              Map<String, dynamic> data = document.data();
              return ListTile(
                title: Text(data['Name']),
                subtitle: Text(data['Research']),
                onTap: () {
                  // Handle tap on the list tile
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

Future<void> addCsvDataToFirestore(String collectionName) async {
  final String csvFilePath =
      'C:\\Users\\Saumya\\OneDrive\\Desktop\\csvfile.csv'; // CSV file path

  // Read CSV file
  final File csvFile = File(csvFilePath);
  final csvContent = await csvFile.readAsString();

  // Parse CSV data
  try {
    final List<List<dynamic>> csvDataList =
        CsvToListConverter().convert(csvContent);

    // Convert CSV data to Firestore-compatible format
    final List<Map<String, dynamic>> firestoreDataList = csvDataList.map((row) {
      return {
        'Name': row[0], // Map CSV fields to Firestore document fields
        'Research': row[1],
        'URL': row[2]
      };
    }).toList();

    // Add documents to Firestore
    final CollectionReference<Map<String, dynamic>> collectionRef =
        FirebaseFirestore.instance.collection(collectionName);
    for (final data in firestoreDataList) {
      await collectionRef.add(data);
    }
    print('CSV data added to Firestore successfully');
  } catch (e, stackTrace) {
    print('Error uploading CSV data:  $e');
    print(stackTrace); // Print stack trace for more information
  }
}
