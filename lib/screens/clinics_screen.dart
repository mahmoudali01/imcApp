import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:imc/themes.dart';
import 'package:imc/widgets/clinic_grid.dart';
//import '../themes.dart';

class ClinicsScreen extends StatefulWidget {
  static const routeName = '/clinics';

  @override
  _ClinicsScreenState createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  @override
  Widget build(BuildContext context) {
    // final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'المركز الطبى العالمى',
          style: MyThemes.lightTheme.textTheme.headline1,
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ClinicGrid(),
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
