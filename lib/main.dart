import 'package:flutter/material.dart';

void main() {
  runApp(const ShoeBoutiqueApp());
}

class ShoeBoutiqueApp extends StatelessWidget {
  const ShoeBoutiqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jane’s Shoe Boutique',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jane’s Shoe Boutique'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcome Section
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.pink[50],
              child: const Text(
                'Welcome to Jane’s Shoe Boutique!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Featured Shoe Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        'Featured Shoe Image\n(Replace with real image)',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Handmade Leather Loafers',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    '\$49.99',
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  ),
                ],
              ),
            ),
            // Navigate to Catalog Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CatalogPage()),
                  );
                },
                child: const Text('View All Shoes'),
              ),
            ),
            // Contact Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Contact Jane at: jane@shoeboutique.com')),
                  );
                },
                child: const Text('Contact Seller'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// New Catalog Page
class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  // Sample shoe data (replace with real data later)
  final List<Map<String, dynamic>> shoes = const [
    {'name': 'Leather Loafers', 'price': '\$49.99'},
    {'name': 'Suede Sneakers', 'price': '\$39.99'},
    {'name': 'Canvas Flats', 'price': '\$29.99'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoe Catalog'),
      ),
      body: ListView.builder(
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Container(
                width: 50,
                height: 50,
                color: Colors.grey[300],
                child: const Center(child: Text('Shoe Img')),
              ),
              title: Text(shoes[index]['name']),
              subtitle: Text(shoes[index]['price'], style: const TextStyle(color: Colors.green)),
            ),
          );
        },
      ),
    );
  }
}