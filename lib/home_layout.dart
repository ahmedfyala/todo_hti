import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/settings/settings_screen.dart';
import 'package:todo/tasks/add_task_bottomsheet.dart';
import 'package:todo/tasks/tasks_screen.dart';

import 'constants/colors.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screenWidgets = [
    TasksListTab(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screenWidgets[selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: tdBGColor,
          onPressed: () {
            ShowAddTaskBottomSheet();
          },
          child: Container(
              margin: EdgeInsets.all(5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: tdBlue,
              ),
              child: Icon(
                Icons.add,
                color: tdBGColor,
                size: 30,
              )),
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_list.png',
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/icon_settings.png',
                    ),
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ));
  }

  void ShowAddTaskBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(18),
        topLeft: Radius.circular(18),
      )),
      context: context,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AddTaskBottomSheet(),
      ),
    );
  }
}
