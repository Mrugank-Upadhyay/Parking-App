import 'package:flutter/material.dart';
import 'package:parking_app/Models/destinationFieldModel.dart';
import 'package:provider/provider.dart';

import 'dialogs.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// Take this to another file
class DestinationField extends StatefulWidget {
  @override
  DestinationFieldState createState() => DestinationFieldState();
}

class DestinationFieldState extends State<DestinationField> {
  // Create text controller. Later used to retrieve the
  // current value of the TextField
  final textController = TextEditingController();
  DestinationFieldModel model = DestinationFieldModel();

  _saveTextValue() {
    model.destination = textController.text;
  }

  @override
  void initState() {
    super.initState();
    textController.addListener(_saveTextValue);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
      child: Consumer<DestinationFieldModel>(builder: (context, model, child) {
        return Material(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 10.0,
          shadowColor: Colors.grey.shade400,
          child: TextField(
            textInputAction: TextInputAction.go,
            onSubmitted: (value) async {
              model.destination = textController.text;
              final action = await Dialogs.timeDialog(
                  context,
                  "Walking Distance",
                  "How far are you willing to walk?",
                  "/ParkingPage");
            },
            controller: textController,
            decoration: InputDecoration(
              hintText: "Enter Destination",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              fillColor: Color.fromRGBO(255, 255, 255, 1),
              filled: true,
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
        );
      }),
    );
  }
}
