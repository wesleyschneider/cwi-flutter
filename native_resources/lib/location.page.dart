import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationPage extends StatefulWidget {
  static String route = 'location_page';

  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Position? _currentPosition;

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition?.latitude ?? 0.0,
        _currentPosition?.longitude ?? 0.0,
      );

      Placemark place = placemarks.first;

      print('${place.locality} - ${place.postalCode} - ${place.country}');
    } catch (e) {
      print(e);
    }
  }

  _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _currentPosition = position;
    });

    await _getAddressFromLatLng();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Column(
        children: [
          _currentPosition == null
              ? const CircularProgressIndicator()
              : Text(
                  'latitude: ${_currentPosition?.latitude}  longitude: ${_currentPosition?.longitude}'),
          CupertinoButton(
              child: Text('Get location'),
              onPressed: () => _getCurrentLocation())
        ],
      ),
    );
  }
}
