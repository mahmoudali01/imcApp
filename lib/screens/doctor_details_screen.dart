import 'package:flutter/material.dart';
import 'package:imc/providers/doctor_provider.dart';
import 'package:imc/themes.dart';
import 'package:provider/provider.dart';

class DoctorDetialsScreen extends StatelessWidget {
  static const routeName = '/doctorscreen';

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedDoctor = Provider.of<DoctorProvider>(
      context,
      listen: false,
    ).findById(doctorId);
    final _kTabs = <Tab>[
      const Tab(
        child: Text(
          'التقييمات ',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        icon: Icon(
          Icons.rate_review,
          color: Colors.white,
          size: 18,
        ),
      ),
      const Tab(
        child: Text(
          'المواعيد ',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        icon: Icon(
          Icons.access_alarm_rounded,
          color: Colors.white,
          size: 18,
        ),
      ),
      const Tab(
        child: Text(
          'نبذة عنه',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        icon: Icon(
          Icons.work,
          color: Colors.white,
          size: 18,
        ),
      ),
    ];

    return DefaultTabController(
      initialIndex: 1,
      length: _kTabs.length,
      child: Scaffold(
        backgroundColor: MyThemes.lightTheme.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'الملف الشخصي للطبيب',
            textAlign: TextAlign.end,
            style: MyThemes.lightTheme.textTheme.headline1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(children: [
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset(
                      loadedDoctor.doctorImage ?? "",
                      height: 90,
                      width: 90,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText2,
                    children: [
                      TextSpan(
                        text: '7.5',
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.star,
                          color: Color(0xffFFB844),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.favorite),
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 8,
                          ),
                        ),
                        TextSpan(text: loadedDoctor.name),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 75,
            child: AppBar(
              bottom: TabBar(
                tabs: _kTabs,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                // first tab bar view widget
                Container(
                  child: Center(
                    child: Text(
                      'CV',
                    ),
                  ),
                ),

                // second tab bar viiew widget
                Container(
                  child: Center(
                    child: Text(
                      'Appointements',
                    ),
                  ),
                ),
                // Third tab bar viiew widget

                Container(
                  child: Center(
                    child: Text(
                      'Reviews',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
