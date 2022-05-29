import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int orderId;
  final int customerId;
  final List<int> productIds;
  final int productsTotal;
  final double subtotal;
  final double priceTotal;
  final bool isAccepted;
  final bool isRejected;
  final bool isReceived;
  final DateTime createdAt;

  const Order({
    required this.orderId, 
    required this.customerId, 
    required this.productIds, 
    required this.productsTotal, 
    required this.subtotal, 
    required this.priceTotal, 
    required this.isAccepted, 
    required this.isRejected, 
    required this.isReceived,
    required this.createdAt
  });

  Order copyWith({
    int? orderId,
    int? customerId,
    List<int>? productIds,
    int? productsTotal,
    double? subtotal,
    double? priceTotal,
    bool? isAccepted,
    bool? isRejected,
    bool? isReceived,
    DateTime? createdAt,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      customerId: customerId ?? this.customerId, 
      productIds: productIds ?? this.productIds, 
      productsTotal: productsTotal ?? this.productsTotal, 
      subtotal: subtotal ?? this.subtotal, 
      priceTotal: priceTotal ?? this.priceTotal, 
      isAccepted: isAccepted ?? this.isAccepted, 
      isRejected: isRejected ?? this.isRejected, 
      isReceived: isReceived ?? this.isReceived,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'customerId': customerId, 
      'productIds': productIds, 
      'productsTotal': productsTotal, 
      'subtotal': subtotal, 
      'priceTotal': priceTotal, 
      'isAccepted': isAccepted, 
      'isRejected': isRejected, 
      'isReceived': isReceived,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
  
  factory Order.fromSnapshot(DocumentSnapshot snap) {
    return Order(
      orderId: snap['orderId'], 
      customerId: snap['customerId'], 
      productIds: List<int>.from(snap['productIds']), 
      productsTotal: snap['productsTotal'], 
      subtotal: snap['subtotal'], 
      priceTotal: snap['priceTotal'], 
      isAccepted: snap['isAccepted'], 
      isRejected: snap['isRejected'], 
      isReceived: snap['isReceived'],
      createdAt: snap['createdAt'].toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      orderId,
      customerId, 
      productIds,
      productsTotal, 
      subtotal, 
      priceTotal,
      isAccepted, 
      isRejected, 
      isReceived,
      createdAt
    ];
  }

  static List<Order> orders = [
    Order(
      orderId: 1,
      customerId: 2345, 
      productIds: const [1, 2],
      productsTotal: 4, 
      subtotal: 20, 
      priceTotal: 30, 
      isAccepted: false, 
      isRejected: false, 
      isReceived: false,
      createdAt: DateTime.now(),
    ),
    Order(
      orderId: 2,
      customerId: 23, 
      productIds: const [1, 2, 3],
      productsTotal: 5, 
      subtotal: 20, 
      priceTotal: 30, 
      isAccepted: false, 
      isRejected: false, 
      isReceived: false,
      createdAt: DateTime.now(),
    ),
    Order(
      orderId: 3,
      customerId: 678, 
      productIds: const [1, 2, 3, 4],
      productsTotal: 12, 
      subtotal: 50, 
      priceTotal: 60, 
      isAccepted: false, 
      isRejected: false, 
      isReceived: false,
      createdAt: DateTime.now(),
    ),

  ];
}