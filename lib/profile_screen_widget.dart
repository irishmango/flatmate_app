import 'package:flutter/material.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/people/man_profile.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 12,
                child: TextButton(onPressed: () {},
                  child: Text('Edit', style: TextStyle(color: Colors.white, fontSize: 18)))
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello!', style: TextStyle(color: Colors.white, fontSize: 18)),
                    Text("I'm John, 28",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                    Text('Project Manager\nNear Berlin Center',
                        style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                _chip('The Doer'),
                _chip('Active'),
                _chip('Friendly'),
                _chip('Vegan'),
                _chip('Traveler'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              'Planning to move to Berlin earlier next year from Munich! I usually every weekend in the city visiting my sister.\n\nI love cooking, hiking, reading and doing some craftwork during my free time, currently looking for a home with some cool people :D',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1),
          ),
          _sectionTitle('Personality & Interests', Icons.person_3_outlined),
          _subSectionTitle('The Doer'),
          _subSectionBody(
              'Their primary mode of living is focused externally, where they take things in via their five senses in a literal, concrete fashion...'),
          _subSectionTitle('Interests'),
          _subSectionBody(
              'Arts & Culture • Body building • Cooking • Music • Meditation • Independent Films • Robotics • Yoga • Technology • Hiking • Equality for all • Politics'),
          _subSectionTitle('Lifestyle'),
          _subSectionBody(
              'Active • Adventurer • Movie lover • Foodie • Vegan • Family person • Nature lover • Party animal'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1),
          ),
          _sectionTitle('Looking for', Icons.remove_red_eye),
          _subSectionBody('Room in flat • Entire place • Flatmates • Friends'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Divider(thickness: 1),
          ),
          _sectionTitle('Flatmate preferences', Icons.apartment_outlined),
          _flatmatePrefs(),
          SizedBox(height: 24),
        ],
    );
  }


  

  Widget _chip(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600)),
    );
  }

  Widget _sectionTitle(String title, IconData icon) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 18),
            SizedBox(width: 8),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      );

  Widget _subSectionTitle(String title) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color.fromARGB(255, 10, 134, 43), fontSize: 15)),
      );

  Widget _subSectionBody(String text) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(text, style: TextStyle(fontSize: 13, height: 1.5)),
      );

  Widget _flatmatePrefs() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _rowText('Gender:', 'Any gender'),
            _rowText('Sexuality:', 'Any sexuality'),
            _rowText('Age group:', '21 to 40 year\'s old'),
            _rowText('Smoking:', 'Non smokers'),
            _rowText('Pet Friendly:', 'Yes'),
          ],
        ),
      );

  Widget _rowText(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(label, style: TextStyle(fontWeight: FontWeight.w600))),
            Expanded(flex: 5, child: Text(value)),
          ],
        ),
      );
}