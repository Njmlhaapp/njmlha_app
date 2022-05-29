import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productId;
  final String productName;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.productId,
    required this.productName, 
    required this.category, 
    required this.imageUrl, 
    required this.price, 
    required this.isRecommended, 
    required this.isPopular,
  });
/*
  Order copyWith({
    int? orderId,
    int? customerId,
    List<int>? productIds,
    double? deliveryFee,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDeliverd,
    bool? isCancelled,
    DateTime? createdAt,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      customerId: customerId ?? this.customerId, 
      productIds: productIds ?? this.productIds, 
      deliveryFee: deliveryFee ?? this.deliveryFee, 
      subtotal: subtotal ?? this.subtotal, 
      total: total ?? this.total, 
      isAccepted: isAccepted ?? this.isAccepted, 
      isDeliverd: isDeliverd ?? this.isDeliverd, 
      isCancelled: isCancelled ?? this.isCancelled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'customerId': customerId, 
      'productIds': productIds, 
      'deliveryFee': deliveryFee, 
      'subtotal': subtotal, 
      'total': total, 
      'isAccepted': isAccepted, 
      'isDeliverd': isDeliverd, 
      'isCancelled': isCancelled,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
  
  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      orderId: snap['orderId'], 
      customerId: snap['customerId'], 
      productIds: List<int>.from(snap['productIds']), 
      deliveryFee: snap['deliveryFee'], 
      subtotal: snap['subtotal'], 
      total: snap['total'], 
      isAccepted: snap['isAccepted'], 
      isDeliverd: snap['isDeliverd'], 
      isCancelled: snap['isCancelled'],
      createdAt: snap['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;
*/
  @override
  List<Object?> get props 
    => [
      productId,
      productName,
      category, 
      imageUrl,
      price, 
      isRecommended, 
      isPopular, 
    ];
  
/*
  static List<Order> orders = [
    Order(
      orderId: 1,
      customerId: 2345, 
      productIds: const [1,2],
      deliveryFee: 10, 
      subtotal: 20, 
      total: 30, 
      isAccepted: false, 
      isDeliverd: false, 
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
    Order(
      orderId: 2,
      customerId: 23, 
      productIds: const [1,2, 3],
      deliveryFee: 10, 
      subtotal: 20, 
      total: 30, 
      isAccepted: false, 
      isDeliverd: false, 
      isCancelled: false,
      createdAt: DateTime.now(),
    ),

  ];
  */
  static List<Product> products = [
    Product(
      productId: '1',
      productName: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://www.soulbowlsnj.com/uploads/1/3/1/2/131291570/s500013740848846364_p19_i5_w612.jpeg', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      productId: '2',
      productName: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://www.soulbowlsnj.com/uploads/1/3/1/2/131291570/s500013740848846364_p19_i5_w612.jpeg', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      productId: '3',
      productName: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      productId: '4',
      productName: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      productId: '5',
      productName: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      productId: '6',
      productName: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      productId: '7',
      productName: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      productId: '8',
      productName: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      productId: '9',
      productName: 'Smoothies #1',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80', //https://unsplash.com/photos/kcYXj4tBtes
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      productId: '10',
      productName: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
    Product(
      productId: '11',
      productName: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1598614187854-26a60e982dc4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/dO9A6mhSZZY
      price: 2.99,
      isRecommended: true,
      isPopular: false,
    ),
    Product(
      productId: '12',
      productName: 'Soft Drink #2',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1610873167013-2dd675d30ef4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=488&q=80', //https://unsplash.com/photos/Viy_8zHEznk
      price: 2.99,
      isRecommended: false,
      isPopular: true,
    ),
    Product(
      productId: '13',
      productName: 'Soft Drink #3',
      category: 'Soft Drinks',
      imageUrl:
          'https://images.unsplash.com/photo-1603833797131-3c0a18fcb6b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80', //https://unsplash.com/photos/5LIInaqRp5s
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    Product(
      productId: '14',
      productName: 'Smoothies #2',
      category: 'Smoothies',
      imageUrl:
          'https://images.unsplash.com/photo-1505252585461-04db1eb84625?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1552&q=80', //https://unsplash.com/photos/CrK843Pl9a4
      price: 2.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}

class ProductModel {
  String? productId;
  String? productName;
  String? category;
  String? imageUrl;
  double? price;
  bool? isRecommended;
  bool? isPopular;

  ProductModel({
    this.productId, 
    this.productName, 
    this.category, 
    this.imageUrl, 
    this.price,
    this.isRecommended,
    this.isPopular
  });

  // reciving data from the server 
  factory ProductModel.fromMap(map)
  {
    return ProductModel(
      productId: map['productId'],
      productName: map['productName'],
      category: map['category'],
      imageUrl: map['imageUrl'],
      price: map['price'],
      isRecommended: map['isRecommended'],
      isPopular: map['isPopular'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return{
      'productId': productId,
      'productName': productName,
      'category': category,
      'imageUrl': imageUrl,
      'price': price,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
    };
  }
}
