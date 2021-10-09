import 'package:flutter/material.dart';
import 'package:imc/screens/clinic_doctor_screen.dart';
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
              clinic.clinicIcon ?? Icon(Icons.favorite),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    clinic.name ?? "",
                    style: TextStyle(
                      color: Color(0xff35433E),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    clinic.specialists ?? "",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
/* 
GridTile(
        child: GestureDetector(
          onTap: () {
            /*  Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            ); */
          },
          child: clinic.clinicIcon,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            clinic.name ?? "",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
*/