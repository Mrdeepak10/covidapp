import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    const MarkerId('Singapore'): Marker(
      markerId: const MarkerId('Singapore'),
      position: const LatLng(22.800, 75.908),
      infoWindow: const InfoWindow(title: 'Singapore', snippet: 'Township'),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    )
  };

  Completer<GoogleMapController> _contraoller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.800639, 75.908108),
    zoom: 15.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(22.754661, 75.895191),
      zoom: 14.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            compassEnabled: true,
            markers: Set<Marker>.of(markers.values),
            mapType: MapType.hybrid,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _contraoller.complete(controller);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: Container(
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  labelText: "Search",
                ),
              ),
            ),
          ),
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: 150,
                            child: Center(
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Icon(Icons.place_outlined),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: const [
                                      Text("13 New Cases"),
                                      Text("Near Me"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: 50,
                            width: 150,
                            child: Center(
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Icon(Icons.local_hospital_rounded),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: const [
                                      Text("3 Hospitals"),
                                      Text("Near Me"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
