import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/clinic.dart';

class ClinicProvider with ChangeNotifier {
  List<Clinic> _clinicItems = [
    Clinic(
      id: 1,
      name: 'عيادة الاسنان',
      clinicIcon: Icon(
        Icons.favorite,
      ),
      specialists: "٧ متخصصين",
    ),
    Clinic(
      id: 2,
      name: 'عيادة الجلدية',
      clinicIcon: Icon(Icons.favorite),
      specialists: "٧ متخصصين",
    ),
    Clinic(
      id: 3,
      name: 'عيادة الباطنة',
      clinicIcon: Icon(Icons.bloodtype_rounded),
      specialists: "٧ متخصصين",
    ),
    Clinic(
      id: 4,
      name: 'عيادة فيزو',
      clinicIcon: Icon(Icons.favorite),
      specialists: "٧ متخصصين",
    ),
    Clinic(
      id: 5,
      name: 'عيادة موميا',
      clinicIcon: Icon(Icons.hearing_outlined),
      specialists: "٧ متخصصين",
    ),
    Clinic(
      id: 6,
      name: 'بين البحرين',
      clinicIcon: Icon(Icons.hearing_outlined),
      specialists: "٧ متخصصين",
    ),
  ];

  List<Clinic> get clinicItems {
    return [..._clinicItems];
  }

  Clinic findById(int id) {
    return _clinicItems.firstWhere((clinic) => clinic.id == id);
  }
}
