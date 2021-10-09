import 'package:flutter/material.dart';
import 'package:imc/screens/clinic_screen.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const Center(
          child: Icon(Icons.receipt_long, size: 64.0, color: Colors.cyan)),
      ClinicScreen(),

      const Center(child: Icon(Icons.favorite, size: 64.0, color: Colors.blue)),
      // const Center(
      //     child: Icon(Icons.apps_rounded, size: 64.0, color: Colors.cyan)),
      // const Center(child: Icon(Icons.home, size: 64.0, color: Colors.blue)),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      // const BottomNavigationBarItem(
      //     icon: Icon(Icons.receipt_long), label: 'الطلبات'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.feed), label: 'اخر الاخبار'),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
      // const BottomNavigationBarItem(
      //     icon: Icon(Icons.apps_rounded), label: 'الخدمات'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: 'الملف الشخصى '),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: BottomNavigationBar(
              items: _kBottmonNavBarItems,
              currentIndex: _currentTabIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
            )));
    ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
