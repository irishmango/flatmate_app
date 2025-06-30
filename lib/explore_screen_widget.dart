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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Where do you wanna live?',
                    prefixIcon: const Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Post Room"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Neighborhoods in your city",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 650,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    LocationCard('Kreuzberg', 'assets/cities/neighbourhoods/kreuzberg.jpg'),
                    LocationCard('Mitte', 'assets/cities/neighbourhoods/mitte.jpg'),
                    LocationCard('Neukölln', 'assets/cities/neighbourhoods/neukoelln.jpg'),
                    LocationCard('Schöneberg', 'assets/cities/neighbourhoods/schoeneberg.avif'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Popular cities in Germany",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3 / 2,
                children: [
                  LocationCard('Frankfurt', 'assets/cities/frankfurt.jpg'),
                  LocationCard('Hamburg', 'assets/cities/hamburg.jpg'),
                  LocationCard('Munich', 'assets/cities/munich.jpg'),
                  LocationCard('Köln', 'assets/cities/cologne.jpg'),
                  LocationCard('Leipzig', 'assets/cities/leipzig.jpg'),
                  LocationCard('Hannover', 'assets/cities/hannover.jpg'),
                ],
              ),
            ],
          ),
    );
  }

}

class LocationCard extends StatelessWidget {
  final String title;
  final String assetPath;

  const LocationCard(this.title, this.assetPath, {super.key});

  @override
  Widget build(BuildContext context) {
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