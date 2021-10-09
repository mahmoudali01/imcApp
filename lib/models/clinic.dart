import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Clinic with ChangeNotifier {
  final Widget? clinicIcon;
  final int? id;
  final String? name;
  final String? specialists;

  Clinic({this.clinicIcon, this.id, this.name, this.specialists});
}
