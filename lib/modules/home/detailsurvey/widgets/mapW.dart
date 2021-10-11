import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:smart_survey1/data/models/survey/formencode/idatumM.dart';
import 'package:smart_survey1/modules/home/detailsurvey/detailsurveyC.dart';

// ignore: must_be_immutable
class MapWidget extends StatelessWidget {
  Idatum idatum;

  LatLng _initialcameraposition = LatLng(0, 0);
  late GoogleMapController _controller;
  Location _location = Location();

  DetailSurveyC dsc;

  int index;

  MapWidget({
    required Key? key,
    required this.idatum,
    required this.dsc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: new Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              '${idatum.parentlabel}',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialcameraposition, zoom: 23),
                  mapType: MapType.normal,
                  onMapCreated: onMapCreated,
                  myLocationEnabled: true,
                  compassEnabled: true,
                ),
                Container(
                    child: Text(
                  '${idatum.value}',
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    dsc.isMaptrue.value = true;

    dsc.getPositionSubscription = _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 18),
        ),
      );

      idatum.value = l.longitude.toString() + "," + l.latitude.toString();

      dsc.temp_fix_array.refresh();
      dsc.getPositionSubscription.pause();
    });
  }
}
