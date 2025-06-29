// lib/match_screen_widget.dart
import 'package:flutter/material.dart';

class MatchScreenWidget extends StatefulWidget {
  const MatchScreenWidget({super.key});
  @override
  State<MatchScreenWidget> createState() => _MatchScreenWidgetState();
}

class _MatchScreenWidgetState extends State<MatchScreenWidget> {
  final List<Map<String, dynamic>> _cards = [
    {
      'imageUrl': 'assets/people/woman_1.avif',
      'name': 'Amanda',
      'age': 25,
      'profession': 'Professional Dancer',
      'tagline': 'The Inspirer',
    },
    {
      'imageUrl': 'assets/people/woman_2.jpeg',
      'name': 'Sophie',
      'age': 27,
      'profession': 'Artist',
      'tagline': 'Color your world',
    },
    {
      'imageUrl': 'assets/people/man_1.webp',
      'name': 'Leo',
      'age': 30,
      'profession': 'Chef',
      'tagline': 'Cooking Passion',
    },
    // Add more...
  ];

  void _handleSwipe(int index, DismissDirection direction) {
    final card = _cards[index];
    if (direction == DismissDirection.startToEnd) {
      print('Matched with ${card['name']}!');
      // TODO: trigger match logic
    } else if (direction == DismissDirection.endToStart) {
      print('Rejected ${card['name']}');
      // TODO: trigger reject logic
    }
    setState(() {
      // Remove the card so next card shows
      _cards.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cards.isEmpty) {
      return Center(child: Text('No more matches'));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final item = _cards[index];
          return Dismissible(
            key: ValueKey(item['name'] + index.toString()),
            direction: DismissDirection.horizontal,
            onDismissed: (dir) => _handleSwipe(index, dir),
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green.withAlpha(35),
              padding: EdgeInsets.only(left: 20),
              child: Center(child: Icon(Icons.favorite, color: Colors.white, size: 36)),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red.withAlpha(35),
              padding: EdgeInsets.only(right: 20),
              child: Center(child: Icon(Icons.close, color: Colors.white, size: 36)),
            ),
            child: _buildMatchCard(
              imageUrl: item['imageUrl'],
              name: item['name'],
              age: item['age'],
              profession: item['profession'],
              tagline: item['tagline'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMatchCard({
  required String imageUrl,
  required String name,
  required int age,
  required String profession,
  required String tagline,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name, $age',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              profession,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            Text(
              tagline,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}