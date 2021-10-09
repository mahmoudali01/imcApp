import 'package:flutter/material.dart';
import '../models/doctor.dart';

class DoctorProvider with ChangeNotifier {
  List<Doctor> _doctorItems = [
    Doctor(
      id: 1,
      name: ' محمود علي',
      doctorImage: "assets/dental.jpg",
    ),
    Doctor(
      id: 2,
      name: 'عبدالعزيز شعبان',
      doctorImage: "assets/dental.jpg",
    ),
    Doctor(
      id: 3,
      name: 'سيف أمير',
      doctorImage: "assets/dental.jpg",
    ),
    Doctor(
      id: 4,
      name: 'احمد حامد',
      doctorImage: "assets/dental.jpg",
    ),
    Doctor(
      id: 5,
      name: 'مو موميا',
      doctorImage: "assets/dental.jpg",
    ),
    Doctor(
      id: 6,
      name: 'محمد محمد',
      doctorImage: "assets/dental.jpg",
    ),
  ];

  List<Doctor> get doctorItems {
    return [..._doctorItems];
  }

  Doctor findById(int id) {
    return _doctorItems.firstWhere((clinic) => clinic.id == id);
  }
}
