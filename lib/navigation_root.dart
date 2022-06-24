import 'package:flutter/material.dart';
import 'package:flutter_task/screens/dummy_screen.dart';
import 'package:flutter_task/screens/home_screen.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DummyScreen(text: 'Discussion',),
    DummyScreen(text: 'Chat',),
    DummyScreen(text: 'Search',),
    DummyScreen(text: 'More',),

  ];

  static const List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home,),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people_rounded),
      label: 'Discussion',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline_rounded),
      label: 'Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz_rounded),
      label: 'More',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: _items,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
