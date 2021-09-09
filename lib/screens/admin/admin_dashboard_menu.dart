import 'package:doaku/screens/admin/beranda/admin_beranda_screen.dart';
import 'package:doaku/screens/admin/renungan/admin_renungan_screen.dart';
import 'package:doaku/utils/color.dart';
import 'package:flutter/material.dart';

import 'more/admin_more_screen.dart';


class AdminDashboardMenu extends StatefulWidget {
  @override
  _AdminDashboardMenuState createState() => _AdminDashboardMenuState();
}

class _AdminDashboardMenuState extends State<AdminDashboardMenu> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    AdminBerandaScreen(),
    AdminRenunganScreen(),
    AdminMoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedLabelStyle: TextStyle(fontSize: 13),
        unselectedLabelStyle:
        TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor:
              (_selectedIndex == 0) ? AppColor.kCream2 : Colors.transparent,
              child: Icon(
                Icons.pan_tool_outlined,
                color: AppColor.kBlack,
              ),
            ),
            label: 'Doa',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor:
              (_selectedIndex == 1) ? AppColor.kCream2 : Colors.transparent,
              child: Icon(
                Icons.pan_tool_outlined,
                color: AppColor.kBlack,
              ),
            ),
            label: 'Renungan',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor:
              (_selectedIndex == 2) ? AppColor.kCream2 : Colors.transparent,
              child: Icon(
                Icons.account_circle_sharp,
                color: AppColor.kBlack,
              ),
            ),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.kBlack,
        onTap: (int i) => _onItemTapped(i),
      ),
    );
  }
}
