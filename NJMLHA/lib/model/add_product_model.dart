import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductName extends StatelessWidget {
  final String productId;

  GetProductName(this.productId);

  @override
  Widget build(BuildContext context) {
    CollectionReference products = FirebaseFirestore.instance.collection('products');

    return FutureBuilder<DocumentSnapshot>(
      //Fetching data from the documentId specified of the student
      future: products.doc(productId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        
        //Error Handling conditions
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        //Data is output to the user
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
CollectionReference products = FirebaseFirestore.instance.collection('products');

Future<void> addProduct(/*String productId,*/ String imageUrl, String productName, String category, String price) {
      // Calling the collection to add a new user
      return products
          //adding to firebase collection
          .add({
            //Data added in the form of a dictionary into the document.
            //'productId': productId,
            'imageUrl': imageUrl, 
            'productName': productName, 
            'category': category,
            'price': price,
          })
          .then((value) => print("Student data Added"))
          .catchError((error) => print("Student couldn't be added."));
}

//For setting a specific document ID use .set instead of .add
/*users.doc(productId).set({
            //Data added in the form of a dictionary into the document.
            'imageUrl': imageUrl, 
            'productName': productName, 
            'category': category,
            'price': price,
});*/

//For updating docs, you can use this function.
/*Future<void> updateUser() {
  return products
    //referring to document ID, this can be queried or named when added accordingly
    .doc(productId)
    //updating grade value of a specific student
    .update({'grade': newGrade})
    .then((value) => print("Student data Updated"))
    .catchError((error) => print("Failed to update data"));
}*/