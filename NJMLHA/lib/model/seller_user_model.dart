class SellerUserModel {
  String? uid;
  String? storeName;
  String? phoneNumber;
  String? email;
  String? cummericalRecordNumber;

  SellerUserModel({
    this.uid, 
    this.storeName, 
    this.phoneNumber, 
    this.email, 
    this.cummericalRecordNumber
  });

  // reciving data from the server 
  factory SellerUserModel.fromMap(map)
  {
    return SellerUserModel(
      uid: map['uid'],
      storeName: map['storeName'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      cummericalRecordNumber: map['cummericalRecordNumber'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return{
      'uid': uid,
      'storeName': storeName,
      'phoneNumber': phoneNumber,
      'email': email,
      'cummericalRecordNumber': cummericalRecordNumber,
    };
  }
}