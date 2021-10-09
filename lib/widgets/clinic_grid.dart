import 'package:flutter/material.dart';
import '../providers/clinic_provider.dart';
import 'clinic_item.dart';
import 'package:provider/provider.dart';

class ClinicGrid extends StatefulWidget {
  @override
  _ClinicGridState createState() => _ClinicGridState();
}

class _ClinicGridState extends State<ClinicGrid> {
  @override
  Widget build(BuildContext context) {
    final clinic = Provider.of<ClinicProvider>(context).clinicItems;
    return GridView.builder(
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: clinic[i],
        child: ClinicItem(),
      ),
      itemCount: clinic.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2.2 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
