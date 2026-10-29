
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> items = [
    {'name': 'Book', 'location': 'Library', 'status': 'Found'},
    {'name': 'Bag', 'location': 'Classroom', 'status': 'Lost'},
    {'name': 'Mobile', 'location': 'Cafeteria', 'status': 'Lost'},
    {'name': 'Wallet', 'location': 'Parking Area', 'status': 'Found'},
    {'name': 'Keys', 'location': 'Lab', 'status': 'Lost'},
    {'name': 'Bottle', 'location': 'Playground', 'status': 'Found'},
    {'name': 'Watch', 'location': 'Lecture Hall', 'status': 'Lost'},
    {'name': 'ID Card', 'location': 'Office', 'status': 'Found'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Lost & Found'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(items[index]['name']!),
              subtitle: Text(
                'Location: ${items[index]['location']}\n'
                    'Status: ${items[index]['status']}',
              ),
              trailing: ElevatedButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        item: items[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final Map<String, String> item;

  DetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${item['name']}',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              'Location: ${item['location']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Status: ${item['status']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
