import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'home.dart';
import 'booking.dart';

class ShopMap extends StatefulWidget {
  const ShopMap({super.key});

  @override
  _ShopMapState  createState() => _ShopMapState();
}

class _ShopMapState extends State<ShopMap> {
  int _selectedIndex = 2; 

  final LatLng shopLocation = const LatLng(13.794185, 122.473262); // Replace with actual coordinates

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Booking()),
        );
        break;
      case 2: // Map tab (current screen)
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.directions),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Directions Button Pressed')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/map_placeholder.png', // Replace with your image path
          fit: BoxFit.cover,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
