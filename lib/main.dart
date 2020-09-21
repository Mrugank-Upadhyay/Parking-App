import 'package:flutter/material.dart';
import 'package:parking_app/HomePage.dart';
import 'package:parking_app/Models/destinationFieldModel.dart';
import 'package:parking_app/Models/firstDialogModel.dart';
import 'package:parking_app/ParkingPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirstDialogModel>(
          create: (_) => FirstDialogModel(),
        ),
        ChangeNotifierProvider<DestinationFieldModel>(
          create: (_) => DestinationFieldModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/" : (BuildContext context) => HomePage(),
          "/ParkingPage" : (BuildContext context) => ParkingPage(),
        },
      ),
    );
  }
}
