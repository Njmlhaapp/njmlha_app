import 'package:NJMLHA/model/order_card_model.dart';
import 'package:NJMLHA/model/product_model.dart';
import 'package:NJMLHA/widgets/seller_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({Key? key}) : super(key: key);
  @override
  _SellerHomeState createState() => _SellerHomeState();
} // class CustomerSetting

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
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

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Order.orders.length,
              itemBuilder: (BuildContext context, int index) {
                return  OrderCard(order: Order.orders[index]);
              }
            ),
          ),
        ],
      ),
      //bottomNavigationBar: SellerNavigationBar(1),
      
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  const OrderCard({
    Key? key, 
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = Product.products.where((product) => order.productIds.contains(product.productId)).toList();
    
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10,),
      child: Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order ID: ${order.orderId}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(
                    DateFormat('dd-MM-yy').format(order.createdAt),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        SizedBox(height: 50, width: 50, child: Image.network(products[index].imageUrl, fit: BoxFit.cover,)),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              products[index].productName,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            /*const SizedBox(width: 10),
                            SizedBox(
                              width: 276,
                              child: Text(
                                products[index].description,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  );
                }
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Column(
                  children: [
                    const Text(
                    "products Total",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "${order.productsTotal}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],),
                Column(
                  children: [
                  const Text(
                    "Price Total",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "${order.priceTotal}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],)
              ],),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 64, 147, 67),
                    minimumSize: const Size(150, 40)
                    ),
                  child: const Text(
                  "Accept",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),),
                ElevatedButton(
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 218, 60, 48),
                    minimumSize: const Size(150, 40)
                    ),
                  child: const Text(
                  "ٌٌReject",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),),
              ],)
            ],
          ),
        ),
      ),
    );
  } 
}