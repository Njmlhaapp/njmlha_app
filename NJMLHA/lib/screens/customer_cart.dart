import 'package:NJMLHA/screens/Payment.dart';
import 'package:NJMLHA/screens/customer_setting.dart';
import 'package:flutter/material.dart';

class CustomerCart extends StatefulWidget {
  const CustomerCart({Key? key}) : super(key: key);
  @override
  _CustomerCartState createState() => _CustomerCartState();
} // class CustomerSetting

class _CustomerCartState extends State<CustomerCart> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //appBar: DefaultAppBar(title: "Cart"),
      appBar: AppBar( 
        title: Center( 
          child: Text("Cart", style: TextStyle(color: Colors.brown.shade200))
        ), 
          //title: Text("Cart", style: TextStyle(color: Colors.brown.shade200)), 
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, 
        elevation: 1, 
        leading: IconButton( 
          onPressed: () { 
            Navigator.of(context).pop(); 
          }, // onPressed 
          icon: Icon( 
            Icons.arrow_back, 
            color: Colors.brown.shade200, 
          ), 
        ), 
      ), 
      bottomNavigationBar: Material(
        elevation: 4.0,
        color: Color(0XFFFFFFFF),
        child: Row(
          children: [
            Expanded(
                child: Text("Total : \$62 RS", 
                textAlign: TextAlign.center, style: 
                TextStyle(fontSize: 18.0, color: Color(0xFF808080)))), 
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                color: Colors.brown.shade200,
                textColor: Color(0xFFFFFFFF),
                child: Text("Pay", style: TextStyle(fontSize: 18.0)),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Payment(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Color(0xFFF1F1F1)), color: Color(0XFFFFFFFF)),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage(cartItems[index].image),
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
                            Text(cartItems[index].title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16.0)),
                            SizedBox(height: 10),
                            Text("\$ ${cartItems[index].price.toString()}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (cartItems[index].quantity > 0) {
                                          cartItems[index].quantity--;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.brown.shade200,
                                    )),
                                Container(
                                    width: 44.0,
                                    height: 44.0,
                                    padding: EdgeInsets.only(top: 22.0),
                                    color: Color(0xFFF1F1F1),
                                    child: TextField(
                                      enabled: false,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: cartItems[index]
                                              .quantity
                                              .toString(),
                                          hintStyle:
                                              TextStyle(color: Color(0xFF303030))),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // Max 5
                                        if (cartItems[index].quantity <= 4) {
                                          cartItems[index].quantity++;
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.brown.shade200,
                                    )),
                              ],
                            ),
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
final cartItems = [
  CartModal(
      image: "assets/images/ca1.jpg",
      title: "Carrot Cake",
      price: 32.0,
      quantity: 1),
  CartModal(
      image: "assets/images/cof1.jpg",
      title: "Latta",
      price: 20.0,
      quantity: 1),
  CartModal(
      image: "assets/images/cof3.jpg",
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