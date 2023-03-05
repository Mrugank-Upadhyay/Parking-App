import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parking_app/dialogs.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ParkingPage extends StatefulWidget {
  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  GoogleMapController mapController;

  // Should be centered around destination LatLng (thus need to make a request first before we load everything)
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
          Positioned(
            top: 500,
            right: 5,
            bottom: 50,
            child: FloatingActionButton(
              child: Icon(Icons.access_time),
              onPressed: () async {
                final action = await Dialogs.timeDialog(context,
                    "Walking Distance", "How far are you willing to walk?", "");
              },
            ),
          ),

          Positioned(
            top: 500,
            left: 5,
            bottom: 50,
            child: ButtonTheme(
              minWidth: 30,
              child: RaisedButton(
                shape: CircleBorder(side: BorderSide.none),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          // Visit https://flutter.dev/docs/get-started/flutter-for/android-devs#what-is-the-equivalent-of-runonuithread-in-flutter
          // for content on how to make the list view asynchronously while fetching data for Parking locations
          // Likely will have to wrap a consumer which models the list of Parking Widgets (which are buttons)
          // DraggableScrollableSheet(builder: (context, controller) {
          //   return Container(
          //     child: ListView.builder(itemBuilder: null),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 5,
          //           blurRadius: 5,
          //           offset: Offset(0, 0),
          //         ),
          //       ],
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(10),
          //           topRight: Radius.circular(10)),
          //     ),
          //   );
          // }),

          // SlidingUpPanel(
          //   backdropOpacity: 1.0,
          //   minHeight: 80,
          //   backdropEnabled: false,
          //   defaultPanelState: PanelState.CLOSED,
          //   collapsed: Container(
          //     child: SizedBox(
          //       width: double.infinity,
          //       height: 200,
          //       child: Center(
          //         child: Text("Previous Destinations",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 20,
          //                 color: Colors.black)),
          //       ),
          //     ),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(10),
          //           topRight: Radius.circular(10)),
          //       color: Colors.white,
          //     ),
          //   ),
          //   panel: Container(
          //   ),
          // ),
        ],
      ),
    );
  }
}
