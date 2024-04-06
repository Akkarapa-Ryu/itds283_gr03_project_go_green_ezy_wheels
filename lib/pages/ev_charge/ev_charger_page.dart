import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/src/rendering/box.dart';

class EvChargerPage extends StatefulWidget {
  const EvChargerPage({super.key});

  @override
  State<EvChargerPage> createState() => _EvChargerPageState();
}

class _EvChargerPageState extends State<EvChargerPage> {
  // https://codelabs.developers.google.com/codelabs/google-maps-in-flutter#3

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('EV Charger Map'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: DesignSystem.c2),
                height: 150,
              ),
              Expanded(
                // flex: 2,
                child: FlutterMap(
                    options: MapOptions(
                        initialCenter: LatLng(13.801773, 100.321121),
                        initialZoom: 11,
                        interactionOptions: InteractionOptions(
                            flags: ~InteractiveFlag.doubleTapZoom)),
                    children: [
                      openStreetMapTileLayer,
                      MarkerLayer(markers: [
                        Marker(
                            point: LatLng(13.801773, 100.321121),
                            width: 60,
                            height: 60,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to another screen
                              },
                              child: Icon(
                                Icons.location_pin,
                                size: 60,
                                color: DesignSystem.error,
                              ),
                            ))
                      ])
                    ]),
              ),
              CustomButton(
                  colorButton: DesignSystem.c2,
                  sizeButton: 45,
                  textButton: 'Destication to Charger',
                  colorText: DesignSystem.c0,
                  textSize: 16,
                  textWeight: FontWeight.bold)
            ],
          ),
        ));
  }
}

// https://www.youtube.com/watch?v=ZnZM8ot5lcc
TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    );
