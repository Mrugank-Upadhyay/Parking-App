import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Models/destinationFieldModel.dart';
import 'destinationField.dart';
import 'dialogs.dart';

/*
*
*
*
* Check Google API requests limitations
* AFAIK its 100 elements per 10 seconds
*
*
*
*/

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(43.472353, -80.542062);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            //Unfocus from textfield
            onTap: (value) {
              FocusScope.of(context).unfocus();
            },
            compassEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
          ),

          // Make this sticky by changing top and left when
          // draggableSrollableSheet transforms
          Consumer<DestinationFieldModel>(
            builder: (context, model, child) => Positioned(
              top: 500,
              right: 5,
              bottom: 50,
              child: FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () async {
                  // Conditional
                  // If textfield is empty, open textfied, else, open dialog
                  if (model.destination == "") {
                    FocusScope.of(context).previousFocus();
                    FocusScope.of(context).previousFocus();
                    FocusScope.of(context).previousFocus();
                  } else {
                    final action = await Dialogs.timeDialog(
                        context,
                        "Walking Distance",
                        "How far are you willing to walk?",
                        "/ParkingPage");
                  }
                },
              ),
            ),
          ),

          // Unfocus from textfield
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SlidingUpPanel(
              backdropOpacity: 1.0,
              minHeight: 80,
              backdropEnabled: false,
              defaultPanelState: PanelState.CLOSED,
              collapsed: Container(
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: Text("Previous Destinations",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black)),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Colors.white,
                ),
              ),
              panel: Container(
                // margin: EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        title: Text("Item ${index + 1}"),
                      );
                    }),
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
          ),

          DestinationField(),
        ],
      ),
    );
  }
}
