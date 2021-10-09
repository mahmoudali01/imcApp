import 'package:flutter/material.dart';
import 'package:imc/providers/doctor_provider.dart';
import 'package:provider/provider.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctorId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedDoctor = Provider.of<DoctorProvider>(
      context,
      listen: false,
    ).findById(doctorId);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          loadedDoctor.name ?? "",
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.asset(loadedDoctor.doctorImage ?? ""),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2,
                      children: [
                        TextSpan(
                          text: '7.5',
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            width: 10,
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.star,
                            color: Color(0xffFFB844),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.favorite),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: 8,
                            ),
                          ),
                          TextSpan(text: loadedDoctor.name),
                        ]),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 4,
              ),
            ]),
      ),
    );
  }
}
