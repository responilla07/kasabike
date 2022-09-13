import 'dart:developer';

import 'package:flutter/material.dart';

import 'sub_pages/achievements.dart';
import 'sub_pages/friends.dart';
import 'sub_pages/home.dart';
import 'sub_pages/profile.dart';
import 'widgets/app_bar_item.dart';
import 'widgets/index_floating_button.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  GlobalKey<FABBottomAppBarState> _bottomAppBarKey = GlobalKey();
  var _actionBtnLocation = FloatingActionButtonLocation.centerDocked;
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: _actionBtnLocation,
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: FABBottomAppBar(
        key: _bottomAppBarKey,
        color: Colors.grey,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: (int index) => _onTabSelected(index),
        items: [
          FABBottomAppBarItem(
            iconData: Icons.house_siding_sharp,
          ),
          FABBottomAppBarItem(iconData: Icons.people_alt_outlined),
          FABBottomAppBarItem(
            // TODO change icon
            iconData: Icons.accessible_forward,
          ),
          FABBottomAppBarItem(
            iconData: Icons.person_outline,
          )
        ],
      ),
      body: _displayPage(_currIndex),
    );
  }

  _onTabSelected(int index) {
    setState(() => _currIndex = index);
  }

  Widget _displayPage(_currIndex) {
    if (_currIndex == 0) {
      return Home();
    }
    if (_currIndex == 1) {
      return Friends();
    }
    if (_currIndex == 2) {
      return Achivements();
    }
    if (_currIndex == 3) {
      return Profile();
    }

    return Container(
      child: Text('Loading data...'),
    );
  }
}
