/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tradebook/firebaseService.dart';
import 'package:tradebook/providerData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';

class UserLocation {
  FirebaseService _service = FirebaseService();

  sendLocationToDataBase(context) async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
    
    DocumentReference ref = _service.db
    .col
  }
} // UserLocation
*/