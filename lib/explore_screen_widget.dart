import 'package:flutter/material.dart';

class ExploreScreenWidget extends StatelessWidget {
  const ExploreScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Where do you wanna live?',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(Icons.bookmark_border),
                          SizedBox(width: 8),
                          Text("Saved searches"),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Post room"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Neighborhoods for you",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 650,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _neighborhoodCard('Kreuzberg', 'assets/cities/neighbourhoods/kreuzberg.jpg'),
                    _neighborhoodCard('Neukölln', 'assets/cities/neighbourhoods/mitte.jpg'),
                    _neighborhoodCard('Mitte', 'assets/cities/neighbourhoods/neukoelln.jpg'),
                    _neighborhoodCard('Schöneberg', 'assets/cities/neighbourhoods/schoeneberg.avif'),
                  ],
                ),
              )
            ],
          ),
    );
  }

  Widget _neighborhoodCard(String title, String assetPath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withAlpha(76), BlendMode.darken),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}