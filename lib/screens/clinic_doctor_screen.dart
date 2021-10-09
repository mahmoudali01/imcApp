import 'package:flutter/material.dart';
import 'package:imc/providers/clinic_provider.dart';
import 'package:imc/providers/doctor_provider.dart';
import 'package:imc/widgets/doctor_card.dart';
import 'package:provider/provider.dart';

class ClinicDoctors extends StatefulWidget {
  static const routeName = '/doctor-screen';

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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          loadedClinic.name ?? "",
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
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
      backgroundColor: Colors.black,
    );
  }
}
