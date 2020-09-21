import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Models/firstDialogModel.dart';
import 'ParkingPage.dart';

enum DialogState { OPEN, CLOSED }

class Dialogs {
  static Future<DialogState> timeDialog(
      BuildContext context, String title, String body, String route) {
    List _choices = ["1 - 2 mins", "2 - 5 mins", "5 - 10 mins", "10+ mins"];
    int _selectedChoice = -1;

    final action = showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ConstrainedBox(
              // Constrain Dialog size
              constraints: BoxConstraints(
                minWidth: 480.0,
                minHeight: 100.0,
                maxHeight: 350.0,
                maxWidth: 482.0,
              ),
              child: Column(children: <Widget>[
                // Title text
                Container(
                  padding: EdgeInsets.only(top: 35, bottom: 15),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Body message text
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 25),
                  child: Text(
                    body,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 20,
                    ),
                  ),
                ),

                // Choice Chips in a 2x2 block
                Consumer<FirstDialogModel>(builder: (context, model, _) {
                  return Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: <Widget>[
                      ChoiceChip(
                        avatarBorder: null,
                        avatar: CircleAvatar(
                          child: Icon(Icons.access_time),
                          maxRadius: 12,
                          backgroundColor: model.distanceChipsBackground[
                              Distance.LESS_THAN_2_MINS],
                          foregroundColor: model
                              .distanceChipsText[Distance.LESS_THAN_2_MINS],
                          backgroundImage: null,
                        ),
                        label: Container(
                          height: 40,
                          width: 90,
                          child: Center(
                            child: Text(
                              _choices[0],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        selected: model.distance == Distance.LESS_THAN_2_MINS,
                        selectedColor: model
                            .distanceChipsBackground[Distance.LESS_THAN_2_MINS],
                        onSelected: (bool selected) {
                          model.distance = Distance.LESS_THAN_2_MINS;
                          model.chipBackgroundColor(
                              "LESS_THAN_2_MINS", Colors.blue);
                        },
                        backgroundColor: model
                            .distanceChipsBackground[Distance.LESS_THAN_2_MINS],
                        labelStyle: TextStyle(
                            color: model
                                .distanceChipsText[Distance.LESS_THAN_2_MINS]),
                      ),
                      ChoiceChip(
                        avatarBorder: null,
                        avatar: CircleAvatar(
                          child: Icon(Icons.access_time),
                          maxRadius: 12,
                          backgroundColor: model.distanceChipsBackground[
                              Distance.LESS_THAN_5_MINS],
                          foregroundColor: model
                              .distanceChipsText[Distance.LESS_THAN_5_MINS],
                          backgroundImage: null,
                        ),
                        label: Container(
                          height: 40,
                          width: 90,
                          child: Center(
                            child: Text(
                              _choices[1],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        selected: model.distance == Distance.LESS_THAN_5_MINS,
                        selectedColor: model
                            .distanceChipsBackground[Distance.LESS_THAN_5_MINS],
                        onSelected: (bool selected) {
                          model.distance = Distance.LESS_THAN_5_MINS;
                          model.chipBackgroundColor(
                              "LESS_THAN_5_MINS", Colors.blue);
                        },
                        backgroundColor: model
                            .distanceChipsBackground[Distance.LESS_THAN_5_MINS],
                        labelStyle: TextStyle(
                            color: model
                                .distanceChipsText[Distance.LESS_THAN_5_MINS]),
                      ),
                      ChoiceChip(
                        avatar: CircleAvatar(
                          child: Icon(Icons.access_time),
                          maxRadius: 12,
                          backgroundColor: model.distanceChipsBackground[
                              Distance.LESS_THAN_10_MINS],
                          foregroundColor: model
                              .distanceChipsText[Distance.LESS_THAN_10_MINS],
                          backgroundImage: null,
                        ),
                        label: Container(
                          height: 40,
                          width: 90,
                          child: Center(
                            child: Text(
                              _choices[2],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        selected: model.distance == Distance.LESS_THAN_10_MINS,
                        selectedColor: model.distanceChipsBackground[
                            Distance.LESS_THAN_10_MINS],
                        onSelected: (bool selected) {
                          model.distance = Distance.LESS_THAN_10_MINS;
                          model.chipBackgroundColor(
                              "LESS_THAN_10_MINS", Colors.blue);
                        },
                        backgroundColor: model.distanceChipsBackground[
                            Distance.LESS_THAN_10_MINS],
                        labelStyle: TextStyle(
                            color: model
                                .distanceChipsText[Distance.LESS_THAN_10_MINS]),
                      ),
                      ChoiceChip(
                        avatar: CircleAvatar(
                          child: Icon(Icons.access_time),
                          maxRadius: 12,
                          backgroundColor: model.distanceChipsBackground[
                              Distance.MORE_THAN_10_MINS],
                          foregroundColor: model
                              .distanceChipsText[Distance.MORE_THAN_10_MINS],
                          backgroundImage: null,
                        ),
                        label: Container(
                          height: 40,
                          width: 90,
                          child: Center(
                            child: Text(
                              _choices[3],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        selected: model.distance == Distance.MORE_THAN_10_MINS,
                        selectedColor: model.distanceChipsBackground[
                            Distance.MORE_THAN_10_MINS],
                        onSelected: (bool selected) {
                          model.distance = Distance.MORE_THAN_10_MINS;
                          model.chipBackgroundColor(
                              "MORE_THAN_10_MINS", Colors.blue);
                        },
                        backgroundColor: model.distanceChipsBackground[
                            Distance.MORE_THAN_10_MINS],
                        labelStyle: TextStyle(
                            color: model
                                .distanceChipsText[Distance.MORE_THAN_10_MINS]),
                      ),
                    ],
                  );
                }),

                SizedBox(height: 10, width: 300),

                Consumer<FirstDialogModel>(builder: (context, model, child) {
                  return RaisedButton(
                    disabledColor: Colors.grey.shade500,
                    disabledTextColor: Colors.white,
                    color: Colors.blue.shade500,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    onPressed: (model.distance != Distance.UNKNOWN)
                        ? () {
                            Navigator.of(context).pop(DialogState.CLOSED);
                            if (route != "") {
                              Navigator.of(context).pushNamed(route);
                            }
                          }
                        : null,
                    child: Text(
                      "Enter",
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ]),
            ),
          );
        });

    return (action != null) ? action : DialogState.CLOSED;
  }

  static Future<DialogState> locationDialog(
      BuildContext context, String title, String address) {
    final action = showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ConstrainedBox(
              // Constrain Dialog size
              constraints: BoxConstraints(
                minWidth: 480.0,
                minHeight: 100.0,
                maxHeight: 350.0,
                maxWidth: 482.0,
              ),
              child: Column(
                children: <Widget>[
                  // Title text
                  Container(
                    padding: EdgeInsets.only(top: 35, bottom: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Body message text
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 25),
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          address,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    return (action != null) ? action : DialogState.CLOSED;
  }
}
