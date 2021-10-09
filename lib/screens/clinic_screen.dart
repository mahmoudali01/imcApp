import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:imc/widgets/clinic_grid.dart';
//import '../themes.dart';

class ClinicScreen extends StatefulWidget {
  static const routeName = '/clinics';

  @override
  _ClinicScreenState createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final _kTabs = <Tab>[
      const Tab(text: 'الدكاترة'),
      const Tab(text: 'العيادات'),
    ];
    return DefaultTabController(
      initialIndex: 1,
      length: _kTabs.length,
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            bottom: TabBar(tabs: _kTabs),
            centerTitle: true,
            title: Text(
              'المركز الطبى العالمى',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            leading: ThemeSwitcher(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.brightness_4_rounded,
                  //size: 30,
                ),
                onPressed: () {
                  /*   final theme =
                      isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
      
                  final switcher = ThemeSwitcher.of(context);
                  switcher!.changeTheme(theme: theme); */
                },
              ),
            ),
            actions: [
              new IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClinicGrid(),
          ),
        ),
      ),
    );
  }

  // Icon _searchIcon = new Icon(Icons.search);
  /* void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          textAlign: TextAlign.end,
          onEditingComplete: () {
            setState(() {
              //  getdata();
            });
          },
          onSubmitted: (v) {
            setState(() {
              // getdata();
            });
            print(v);
          },
          onChanged: (val) => initiateSearch(val),
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
              suffixIcon: new Icon(Icons.search), hintText: '....بحث   '),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text("المركز الطبى العالمى ");
      }
    });
  }

  String name = "";
  void initiateSearch(String val) {
    setState(() {
      name = val.toLowerCase().trim();
    });
  } */
}
