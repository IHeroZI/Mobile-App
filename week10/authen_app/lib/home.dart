import 'package:authen_app/services/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  void openFoodBox(
    BuildContext context, {
    String? docID,
    String? name,
    String? price,
  }) {
    // add a new food menu
    if (docID != null) {
      _nameController.text = name.toString();
      _priceController.text = price.toString();
    } else {
      _nameController.clear();
      _priceController.clear();
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(docID == null ? 'Add Food' : 'Update Food'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(hintText: 'Price'),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                firestoreService.addFood(
                  _nameController.text,
                  double.parse(_priceController.text),
                );
              } else {
                firestoreService.updateFood(
                  docID,
                  _nameController.text,
                  double.parse(_priceController.text),
                );
              }

              _nameController.clear();
              _priceController.clear();
              Navigator.pop(context);
            },
            child: Text(docID == null ? 'Add' : 'Update'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Authentication'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(title: const Text('User Profile')),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.pushReplacementNamed(context, '/sign-in');
                      })
                    ],
                  ),
                ),
              );
            },
            icon: Icon(Icons.person_rounded),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/sign-in');
              }
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openFoodBox(context),
        child: const Icon(Icons.add_rounded),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getFoodStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var foodList = snapshot.data?.docs ?? [];
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = foodList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String name = data['name'];
                String price = data['price'].toString();
                return ListTile(
                  title: Text(name),
                  subtitle: Text('฿$price'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => openFoodBox(
                          context,
                          docID: docID,
                          name: name,
                          price: price,
                        ),
                        icon: Icon(Icons.edit_rounded),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm Delete Data'),
                              content:
                                  const Text('Do you want to delete this item'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    firestoreService.deleteFood(docID);
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red,
                                  ),
                                  child: const Text('Delete'),
                                )
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete_rounded),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('No food menu...');
          }
        },
      ),
    );
  }
}
