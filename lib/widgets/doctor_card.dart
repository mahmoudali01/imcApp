import 'package:flutter/material.dart';
import 'package:imc/models/doctor.dart';
import 'package:provider/provider.dart';

class DoctorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    return GestureDetector(
      onTap: () {
        /* Navigator.of(context).pushNamed(
          PlayerStats.routeName,
          arguments: player.playerId,
        ); */
      },
      child: Card(
        elevation: 6,
        // color: Color(0xffDCEAEB),
        color: Color(0xff1C1C1E),
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
                    child: Wrap(children: [
                      Text(
                        doctor.name ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
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
                          color: Theme.of(context).accentColor,
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
                        style: TextStyle(
                          fontSize: 17.0,
                          //  color: Color(0xff254029),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // player.rate != null ?
                      Icon(
                        Icons.star,
                        color: Color(0xffFFB844),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '٣١ سنة',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff90A49B),
                    ),
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
