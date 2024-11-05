import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Know Your Flower',
      home: FlowerListPage(),
    );
  }
}

class FlowerListPage extends StatelessWidget {
  const FlowerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> flowers = [
      {
        'name': 'Sunflower',
        'title': 'The Sun-Following Giant',
        'description': 'Bright yellow, sun-following plant.',
        'image': 'images/sunflower.jpg',
        'details':
            'Sunflowers (Helianthus annuus) are widely recognized for their large, bright yellow petals and their ability to follow the sun across the sky, a behavior known as heliotropism. They are native to North America and grow in a variety of sizes and shapes, but they are best known for their large yellow blooms and edible seeds. Sunflower seeds are rich in healthy fats, vitamins, and minerals.',
        'color': Colors.yellow[700],
      },
      {
        'name': 'Rose',
        'title': 'The Timeless Symbol of Love',
        'description': 'Symbol of love with fragrant petals.',
        'image': 'images/rose.jpeg',
        'details':
            'Roses are one of the most popular and beloved flowers worldwide, often symbolizing love and beauty. They come in a variety of colors, each carrying its own meaning. Red roses are typically associated with love, while white roses symbolize purity, and yellow roses signify friendship. Rose petals are also used in perfumes, cosmetics, and even some culinary dishes.',
        'color': Colors.red[600],
      },
      {
        'name': 'Tulip',
        'title': 'The Springtime Bloom',
        'description': 'Popular spring flower with various colors.',
        'image': 'images/tulip.jpeg',
        'details':
            'Tulips (Tulipa) are vibrant, cup-shaped flowers that bloom in early spring, bringing color to gardens and landscapes. Originally from Central Asia, tulips are now widely cultivated, with the Netherlands being famous for its tulip fields. Tulips come in a wide range of colors, including red, yellow, purple, and even multicolored varieties.',
        'color': Colors.pink[300],
      },
      {
        'name': 'Daisy',
        'title': 'The Cheerful Meadow Flower',
        'description': 'Small, cheerful flower with white petals.',
        'image': 'images/daisy.jpeg',
        'details':
            'Daisies (Bellis perennis) are simple yet beautiful flowers often associated with purity and innocence. With their white petals and yellow centers, they are easy to recognize. Daisies are often used in flower arrangements and are popular for their bright and cheerful appearance.',
        'color': Colors.white,
      },
      {
        'name': 'Orchid',
        'title': 'The Exotic Wonder',
        'description': 'Exotic and intricate bloom.',
        'image': 'images/orchid.jpeg',
        'details':
            'Orchids are a diverse family of flowers known for their exotic beauty and intricate blooms. There are over 25,000 species of orchids, making them one of the largest plant families. Orchids come in a variety of colors, shapes, and sizes, and they are often prized by collectors and gardeners for their unique appearance.',
        'color': Colors.purple[400],
      },
      {
        'name': 'Lily',
        'title': 'The Graceful Blossom',
        'description': 'Elegant and fragrant with trumpet shape.',
        'image': 'images/lily.jpeg',
        'details':
            'Lilies (Lilium) are elegant, trumpet-shaped flowers known for their beauty and fragrance. They are often used in weddings and religious ceremonies. Lilies come in a variety of colors, including white, pink, orange, and yellow. They are also known for their symbolism, with white lilies often representing purity and innocence.',
        'color': Colors.orange[300],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Know Your Flower'),
      ),
      body: Container(
        color: Colors.lightGreen[100], // Background color for the main page
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: flowers.length,
          itemBuilder: (context, index) {
            return FlowerCard(
              name: flowers[index]['name']!,
              title: flowers[index]['title']!,
              description: flowers[index]['description']!,
              image: flowers[index]['image']!,
              details: flowers[index]['details']!,
              color: flowers[index]['color']!,
            );
          },
        ),
      ),
    );
  }
}

class FlowerCard extends StatelessWidget {
  const FlowerCard({
    super.key,
    required this.name,
    required this.title,
    required this.description,
    required this.image,
    required this.details,
    required this.color,
  });

  final String name;
  final String title;
  final String description;
  final String image;
  final String details;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color, // Set the background color of the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlowerDetailPage(
                name: name,
                title: title,
                image: image,
                details: details,
                color: color,
              ),
            ),
          );
        },
      ),
    );
  }
}

class FlowerDetailPage extends StatelessWidget {
  const FlowerDetailPage({
    super.key,
    required this.name,
    required this.title,
    required this.image,
    required this.details,
    required this.color,
  });

  final String name;
  final String title;
  final String image;
  final String details;
  final Color color;

  Color getContrastingTextColor(Color color) {
    final brightness = color.computeLuminance();
    return brightness > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final footerTextColor = getContrastingTextColor(color);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: color,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            image,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              details,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Container(
            color: color,
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                'UITM PERLIS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: footerTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
