import 'package:flatmate_app/explore_screen_widget.dart';
import 'package:flatmate_app/for_you/presentation/for_you_screen_widget.dart';
import 'package:flatmate_app/main.dart';
import 'package:flatmate_app/swipe/presentation/filter_screen.dart';
import 'package:flatmate_app/swipe/presentation/match_screen_widget.dart';
import 'package:flatmate_app/messages/messages_screen_widget.dart';
import 'package:flatmate_app/profile_screen_widget.dart';
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
          SingleChildScrollView(child: ForYouScreenWidget()), 
          SingleChildScrollView(child: ExploreScreenWidget()), 
          MatchScreenWidget(), 
          SingleChildScrollView(child: MessagesScreenWidget()), 
          SingleChildScrollView(child: ProfileScreenWidget()), 
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 10, 134, 43),
        currentIndex: _selectedPage,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'For You'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Meet'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  AppBar? _buildAppBar() {
  switch (_selectedPage) {
    case 0:
      return AppBar(
        title: Text("Matches"), 
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        );
    case 1:
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        title: const Text(
          "Find your home",
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => FilterScreen()));
          },
        ),
        title: const Text(
          "Discover People",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      );
    case 3:
      return AppBar(title: Text("Messages"), backgroundColor: Colors.white,);
    case 4:
      return null;
    default:
      return AppBar(title: Text("App"), backgroundColor: Colors.white,);
  }
}
}
