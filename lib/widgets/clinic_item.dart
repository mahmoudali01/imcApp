import 'package:flutter/material.dart';
import 'package:imc/screens/clinic_doctors_screen.dart';
import 'package:imc/themes.dart';
import '../models/clinic.dart';
import 'package:provider/provider.dart';

class ClinicItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clinic = Provider.of<Clinic>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white60,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ClinicDoctors.routeName,
              arguments: clinic.id,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              clinic.clinicIcon ??
                  Icon(
                    Icons.favorite,
                    color: MyThemes.primaryColor,
                  ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    clinic.name ?? "",
                    style: MyThemes.lightTheme.textTheme.bodyText1,
                  ),
                  Text(
                    clinic.specialists ?? "",
                    style: MyThemes.lightTheme.textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
