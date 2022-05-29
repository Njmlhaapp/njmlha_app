import 'package:flutter/material.dart';
import 'package:NJMLHA/model/add_product_model.dart';
import 'package:NJMLHA/widgets/original_button.dart';
import 'package:NJMLHA/screens/seller_menu.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class SellerAddProductForm extends StatefulWidget {
  const SellerAddProductForm({Key? key}) : super(key: key);
  @override
  _SellerAddProductFormState createState() => _SellerAddProductFormState();
} // class SellerAddProductForm

class _SellerAddProductFormState extends State<SellerAddProductForm> {
  //final _auth = FirebaseAuth.instance;
  String? errorMessage; // string for displaying the error Message
  // our form key
  final _formKey = GlobalKey<FormState>();
  final productIdEditingController = new TextEditingController();
  final productNameEditingController = new TextEditingController();
  final categoryEditingController = new TextEditingController();
  final imageUrlEditingController = new TextEditingController();
  final priceEditingController = new TextEditingController();

  List<String> _category = ['A', 'B', 'C', 'D']; 
  String? _selectedcategory;
  void _changeSelecor (newValue) {
    setState(() {
      _selectedcategory = newValue;
    });
  }

  File? _image;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      ImagePicker picker = ImagePicker();
      final image = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(image!.path);
          print('Image Path $_image');
      });
    }
    
    uploadImagetFirebase(String imagePath) async {
      await FirebaseStorage.instance
      .ref(imagePath)
      .putFile(File(imagePath))
      .then((taskSnapshot) {
        print("task done");
        // download url when it is uploaded
        if (taskSnapshot.state == TaskState.success) {
          FirebaseStorage.instance
          .ref(imagePath)
          .getDownloadURL()
          .then((url) {
            print("Here is the URL of Image $url");
            priceEditingController.text = url;
            return url;
          }).catchError((onError) {
            print("Got Error $onError");
          });
        }
      });
    }

    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.grey.shade300,
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image!=null)?Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          ):Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/njmlha-project.appspot.com/o/default%20_prodact_bic.png?alt=media&token=023a6a37-7957-45b1-a4db-615ef5e57774",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                    FlatButton(
                      onPressed: () {
                        getImage();
                      }, // onPressed
                      child: Text('Choose a photo'),
                      ),
                ],
              ),
                SizedBox(height: 40),
                TextFormField(  // Store Name field
                  autofocus: false,
                  controller: productNameEditingController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = new RegExp(r'^.{3,}$');
                    if (value!.isEmpty) {
                      return ("Product Name cannot be Empty");
                    }
                    if (!regex.hasMatch(value)) {
                      return ("Enter Valid Name (Min. 3 Character)");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    productNameEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Product Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
                SizedBox(height: 40),
                TextFormField( // Phone Number field
                  autofocus: false,
                  controller: priceEditingController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ("price cannot be Empty");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    priceEditingController.text = value!;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'price',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
                SizedBox(height: 40),
                DropdownButton(
                  hint: Text('Please choose category'), 
                  value: _selectedcategory,
                  onChanged: (newValue) {
                    _changeSelecor (newValue);
                  },
                  items: _category.map((category) {
                    return DropdownMenuItem(
                      child: new Text(category),
                      value: category,
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(15),
                  focusColor: Colors.blue,
                  isExpanded: true,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 70),
        OriginalButton(
          text: 'Add to Menu',
          textColor: Colors.black,
          bgColor: Colors.brown.shade200,
          onPressed: () {
            addProduct(imageUrlEditingController.text, productNameEditingController.text, _selectedcategory.toString(), priceEditingController.text);
          },
        ),
        SizedBox(height: 5),
      ],
    );
  } // Widget build
} // class _SellerAddProductFormState