import 'package:flutter/material.dart';
import 'package:imc/providers/clinic_provider.dart';
import 'package:imc/providers/doctor_provider.dart';
import 'package:imc/widgets/doctor_card.dart';
import 'package:provider/provider.dart';

import '../themes.dart';

class ClinicDoctors extends StatefulWidget {
  static const routeName = '/clinic-screen';

  @override
  _ClinicDoctorsState createState() => _ClinicDoctorsState();
}

class _ClinicDoctorsState extends State<ClinicDoctors> {
  /* var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration.zero, () {
      setState(() {
        clinicId = ModalRoute.of(context)!.settings.arguments as int;
      });

      Provider.of<DoctorProvider>(context, listen: false).fetchTeams(clinicId).then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    });
    super.initState();
  }
 */
  @override
  Widget build(BuildContext context) {
    final clinicId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedClinic = Provider.of<ClinicProvider>(
      context,
      listen: false,
    ).findById(clinicId);
    final doctors = Provider.of<DoctorProvider>(context).doctorItems;

    return Scaffold(
      backgroundColor: MyThemes.lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          loadedClinic.name ?? "",
          textAlign: TextAlign.end,
          style: MyThemes.lightTheme.textTheme.headline1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: doctors.length,
            itemBuilder: (context, i) => ChangeNotifierProvider.value(
              value: doctors[i],
              child: DoctorCard(),
            ),
          ),
        ),
      ),
    );
  }
}
