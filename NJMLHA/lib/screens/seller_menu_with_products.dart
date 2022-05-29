import 'package:flutter/material.dart';

class SellerFullMenu extends StatefulWidget {
  const SellerFullMenu({Key? key}) : super(key: key);
  @override
  _SellerFullMenuState createState() => _SellerFullMenuState();
} // class CustomerSetting

class _SellerFullMenuState extends State<SellerFullMenu> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFFF1F1F1)), color: Color(0XFFFFFFFF)),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(menuItems[index].image),
                      height: 80.0,
                      width: 80.0,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 20.0,
                                  width: 20.0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                          
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.brown.shade200,
                                      size: 20.0
                                    )
                                  ),
                                ),
                              ]
                            ),
                            Text(menuItems[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16.0)),
                            SizedBox(height: 10),
                            Text("\$ ${menuItems[index].price.toString()}"),
                            
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
final menuItems = [
  CartModal(
      image: "assets/images/ca1.png",
      title: "Carrot Cake",
      price: 32.0,
      quantity: 1),
  CartModal(
      image: "assets/images/cof1.png",
      title: "Latta",
      price: 20.0,
      quantity: 1),
  CartModal(
      image: "assets/images/cof3.png",
      title: "Black Coffee",
      price: 10.0,
      quantity: 1),
];
class CartModal {
  String image;
  String title;
  double price;
  int quantity;

  CartModal({required this.image, required this.title, required this.price, required this.quantity});

  factory CartModal.fromMap(map) {
    return CartModal (
    image: map['image'],
    title: map['title'],
    price: map['price'],
    quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}