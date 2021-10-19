import 'package:flutter/material.dart';
import 'package:imc/providers/doctor_provider.dart';
import 'package:imc/themes.dart';
import 'package:provider/provider.dart';

import 'booking_screen.dart';

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
                      'الاربعاء من 9 ص الي 5 م',
                      style: MyThemes.lightTheme.textTheme.bodyText1,
                    ),
                  ),
                ),
                // second tab bar viiew widget

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: ('درس في كلية طب القصر العيني'),
                              style: MyThemes.lightTheme.textTheme.bodyText1,
                            ),
                            WidgetSpan(
                                child: SizedBox(
                              width: 5.0,
                            )),
                            WidgetSpan(
                              child: Icon(
                                Icons.layers_sharp,
                                size: 25,
                                color: MyThemes.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /* Container(
                  child: ListTile(
                    trailing: Icon(Icons.layers_sharp),
                    title: Text('درس في كلية طب القصر العيني'),
                  ),
                ), */
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: MyThemes.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child:
                    Text(' حجز', style: Theme.of(context).textTheme.headline2),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookingScreen(
                            loadedDoctor.doctorImage,
                            loadedDoctor.name,
                          )),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
