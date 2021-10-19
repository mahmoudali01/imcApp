import 'package:flutter/material.dart';
import '../themes.dart';

class appointmentWidget extends StatefulWidget {
  final String? appointement;
  appointmentWidget({
    @required this.appointement,
  });

  @override
  _appointmentWidgetState createState() => _appointmentWidgetState();
}

class _appointmentWidgetState extends State<appointmentWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isPressed ? MyThemes.primaryColor : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(),
        ),
        child: Text(
          widget.appointement ?? '',
          style: MyThemes.lightTheme.textTheme.bodyText1,
        ),
      ),
    );
  }
}
