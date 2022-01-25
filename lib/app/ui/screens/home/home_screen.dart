import 'package:flutter/material.dart';

import '../index.dart';
import '../../components/components.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final List<Widget> _screens = [ParkingSpaceScreen(), HistoricScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DefaultBottomBar(
        index: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        bottomBarItens: const [
          BottomNavigationBarItem(icon: Icon(Icons.drive_eta), label: "Vagas"),
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted), label: "Histórico")
        ],
      ),
      body: _screens[_index],
    );
  }
}
