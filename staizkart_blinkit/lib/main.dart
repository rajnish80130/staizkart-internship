import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RoomListPage(),
    );
  }
}

/* ---------------- ROOM LIST PAGE ---------------- */

class RoomListPage extends StatelessWidget {
  const RoomListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Available Rooms")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75,
          children: [
            roomCard(
              context,
              name: "Single Room",
              price: "₹6,000 / month",
              location: "Near College Road",
              description: "Furnished room with WiFi & Power Backup",
            ),
            roomCard(
              context,
              name: "Double Sharing",
              price: "₹4,500 / month",
              location: "Hostel Area",
              description: "AC room with meals included",
            ),
          ],
        ),
      ),
    );
  }

  Widget roomCard(
    BuildContext context, {
    required String name,
    required String price,
    required String location,
    required String description,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: const Center(
              child: Icon(Icons.bed, size: 50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(price, style: const TextStyle(color: Colors.green)),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.add_circle, color: Colors.green),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomDetailPage(
                      name: name,
                      price: price,
                      location: location,
                      description: description,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

/* ---------------- ROOM DETAIL PAGE ---------------- */

class RoomDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String description;

  const RoomDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Room Details")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 4),
                Text(location),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Book Room"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
