import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import '../../constants/constants.dart';
import '../../components/components.dart';
import '../../theme/theme.dart';
import 'package:latlong2/latlong.dart';

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
          title: Text(EvChargerMessage.evChargerMap),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 170,
                child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/background.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.maxFinite,
                    alignment: Alignment(0,0.25),
                  ),
                ),
              ),
              Expanded(
                // flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
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
              ),
              CustomButton(
                  colorButton: DesignSystem.c2,
                  sizeButtonHeight: 45,
                  sizeButtonWidth: double.infinity,
                  textButton: EvChargerMessage.destinationToCharger,
                  colorText: DesignSystem.c0,
                  textSize: 16,
                  textWeight: FontWeight.bold,)
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
