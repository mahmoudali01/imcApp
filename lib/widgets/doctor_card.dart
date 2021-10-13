import 'package:flutter/material.dart';
import 'package:imc/models/doctor.dart';
import 'package:imc/screens/doctor_details_screen.dart';
import 'package:imc/themes.dart';
import 'package:provider/provider.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          DoctorDetialsScreen.routeName,
          arguments: doctor.id,
        );
      },
      child: Card(
        elevation: 6,
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
          margin: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      doctor.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: MyThemes.lightTheme.textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<Doctor>(
                        builder: (ctx, doc, _) => IconButton(
                          icon: Icon(
                            doc.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: MyThemes.primaryColor,
                          onPressed: () {
                            doctor.toggleFavoriteStatus();
                          },
                        ),
                      ),
                      Text(
                        /*  player.rate != null
                            ? double.parse(player.rate).toStringAsFixed(1)
                            : */
                        '7.5',
                        style: MyThemes.lightTheme.textTheme.bodyText2,
                      ),
                      // player.rate != null ?
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  Text(
                    '٣١ سنة',
                    style: MyThemes.lightTheme.textTheme.bodyText2,
                  ),
                ],
              ),
              SizedBox(
                width: 15.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.asset(
                  doctor.doctorImage ?? "",
                  height: 90,
                  width: 90,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
