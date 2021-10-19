import 'package:flutter/material.dart';
import 'package:imc/widgets/appointment_dart.dart';

import '../themes.dart';

class BookingScreen extends StatefulWidget {
  final String? docImage;
  final String? docName;

  BookingScreen(this.docImage, this.docName);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyThemes.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'حجز الميعاد',
          textAlign: TextAlign.end,
          style: MyThemes.lightTheme.textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.docName ?? "",
                          style: MyThemes.lightTheme.textTheme.bodyText1,
                        ),
                        Text(
                          'أسنان',
                          style: MyThemes.lightTheme.textTheme.bodyText2,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Image.asset(
                        widget.docImage ?? '',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  child: Text(
                    '.اختر الوقت  ',
                    style: MyThemes.lightTheme.textTheme.bodyText1,
                  ),
                ),
              ),
              Container(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    appointmentWidget(appointement: '10.45'),
                    appointmentWidget(appointement: '13.30'),
                    appointmentWidget(appointement: '15.45'),
                    appointmentWidget(appointement: '16.30'),
                    appointmentWidget(appointement: '17.45'),
                    appointmentWidget(appointement: '18.30'),
                    appointmentWidget(appointement: '19.45'),
                    appointmentWidget(appointement: '20.45'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'سبب الزيارة ',
                      labelStyle: MyThemes.lightTheme.textTheme.bodyText1),
                  //controller: _titleController,
                  //  onSubmitted: (_) => _submitData(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0, left: 10, right: 15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'رقم هاتفك',
                      labelStyle: MyThemes.lightTheme.textTheme.bodyText1),
                  //  controller: _amountController,
                  keyboardType: TextInputType.number,
                  // onSubmitted: (_) => _submitData(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: MyThemes.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 15),
                      child: Text(' حجز',
                          style: Theme.of(context).textTheme.headline2),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
