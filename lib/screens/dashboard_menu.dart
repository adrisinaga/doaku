import 'package:doaku/screens/more/setting_screen.dart';
import 'package:doaku/screens/renungan/renungan_screen.dart';
import 'package:doaku/utils/lib.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

import 'beranda/beranda_screen.dart';

class DashboardMenu extends StatefulWidget {
  @override
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    BerandaScreen(),
    RenunganScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80.0),
            child: Image.asset(
              'assets/images/appstore.png',
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'DoaKu',
                    style: styleAppbar1,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Doa adalah nafas hidup',
                    style: styleAppbar2,
                  ),
                ],
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColor.kBlack,
          ),
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pan_tool_outlined,
            ),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Renungan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.kBlack,
        onTap:(int i)=> _onItemTapped(i),
      ),
    );
  }
}
