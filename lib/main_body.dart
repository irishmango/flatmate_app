import 'package:flatmate_app/explore_screen_widget.dart';
import 'package:flatmate_app/main.dart';
import 'package:flatmate_app/match_screen_widget.dart';
import 'package:flutter/material.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {

  int _selectedPage = 1; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: IndexedStack(
        index: _selectedPage,
        children: [
          SingleChildScrollView(child: Container()), 
          SingleChildScrollView(child: ExploreScreenWidget()), 
          MatchScreenWidget(), 
          SingleChildScrollView(child: Container()), 
          SingleChildScrollView(child: Container()), 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Matches'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Meet'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
  switch (_selectedPage) {
    case 0:
      return AppBar(title: Text("Matches"));
    case 1:
      return AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "The world is waiting",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      );
    case 2:
      return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // TODO: Implement filter functionality
          },
        ),
        title: const Text(
          "Discover People",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      );
    case 3:
      return AppBar(title: Text("Messages"));
    case 4:
      return AppBar(title: Text("Profile"));
    default:
      return AppBar(title: Text("App"));
  }
}
}

