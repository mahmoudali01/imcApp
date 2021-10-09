import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Doctor with ChangeNotifier {
  final String? doctorImage;
  final int? id;
  final String? name;
  bool isFavorite;

  Doctor({
    this.doctorImage,
    this.id,
    this.name,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
