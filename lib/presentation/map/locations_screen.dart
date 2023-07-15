import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_geocoder/geocoder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../shared/components.dart';
import '../../../../utilities/app_ui.dart';

import '../../../utilities/app_util.dart';
import '../../bloc/addresses/addresses_cubit.dart';
import '../../bloc/auth/auth_cubit.dart';

class LocationsScreen extends StatefulWidget {
  final double? lat, lng;
  final String? type;
  final bool? update;
  const LocationsScreen({Key? key, this.lat, this.lng, this.type , this.update})
      : super(key: key);

  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  late final GoogleMapController googleMapController;

  var searchController = TextEditingController();
  Position? posision;
  late LatLng _currentLocation ;
  late LatLng? _selectLocation ;

  Set<Marker> mymarker = {
    const Marker(
        visible: true,
        markerId: MarkerId("1"),
        position: LatLng(22.222233333333, 22.33333345676))
  };
  String _address = "";
  String _city = "";
 late double? latSelect ;
 late double? lngSelect ;
  final TextEditingController loginPhone = TextEditingController();

  void _getPlace(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    // this is all you need
    Placemark placeMark = placemarks[0];
    String? name = placeMark.name;
    String? subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    String? country = placeMark.country;
    String? address = "${name}, ${subLocality}";
    String? city = "${locality}  ${country}";
    print(address);

    setState(() {
      _address = address;
      _city = city;
      latSelect = latLng.latitude;
      lngSelect = latLng.longitude;
      // update _address
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.update == true){
    mymarker.remove(const Marker(markerId: MarkerId("1")));
    mymarker.add( Marker(markerId: const MarkerId("1"), position: LatLng(widget.lat ?? 0.0, widget.lng ?? 0.0)));
    }
    // myLocation();
    // _currentLocation = LatLng(22.222233333333, 22.33333345676);
  }

  @override
  Widget build(BuildContext context) {
    // final cubit = AdderssCubit.get(context);
    final cubitAddresses = AddressesCubit.get(context);
    var cubit = AuthCubit.get(context);
    double? latitude ;
    double? longitude ;
    return Scaffold(
        appBar: customAppBar(
          title: CustomText(text: "Map".tr() , color:  AppUI.blackColor,),
          centerTitle: true
          // CustomCard(
          //   elevation: 0.0,
          //   color: AppUI.backgroundColor.withOpacity(0.5),
          //   height: 58,
          //   child: CustomInput(
          //     controller: searchController,
          //     onChange: (v) async {},
          //     textInputType: TextInputType.text,
          //     prefixIcon: Icon(
          //       Icons.search,
          //       color: AppUI.iconColor,
          //       size: 30,
          //     ),
          //     borderColor: Colors.transparent,
          //     fillColor: Colors.transparent,
          //     hint: "searchLocation".tr(),
          //   ),
          // ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: InkWell(
            onTap: () async {
              Position currentLocation = await AppUtil.determinePosition();
              googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(
                          currentLocation.latitude, currentLocation.longitude),
                      zoom: 16)));
            },
            child: Container(
                decoration: BoxDecoration(
                    color: AppUI.whiteColor, shape: BoxShape.circle),
                height: 50,
                width: 50,
                child: Center(
                    child: Icon(
                  Icons.location_searching_rounded,
                  color: AppUI.mainColor,
                  size: 25,
                ))),
          ),
        ),
        body: Stack(
          children: [
            // GoogleMap(
            //     onMapCreated: (map) {
            //       googleMapController = map;
            //     },
            //     onCameraMove: (CameraPosition position) {
            //       _currentLocation = position.target;
            //     },
            //     initialCameraPosition:
            //         CameraPosition(target: _currentLocation, zoom: 8),
            //     myLocationEnabled: true,
            //     myLocationButtonEnabled: false,
            //     mapType: MapType.hybrid,
            //     onTap: (LatLng latLng) {
            //       mymarker.remove(const Marker(markerId: MarkerId("1")));
            //       mymarker.add(
            //           Marker(markerId: const MarkerId("1"), position: latLng));
            //       setState(() {});

            //       final lat = latLng.latitude;
            //       final long = latLng.longitude;
            //       _getPlace(latLng);
            //       print(lat);
            //       print(long);
            //     },
            //     markers: mymarker),
                  GoogleMap(
                  initialCameraPosition: const CameraPosition(target: LatLng(30.45678,31.876543), zoom: 20),
                  onMapCreated: (map){
                    googleMapController = map;
                    getCurrentPosition();
                  },
                  // polylines: polyline==null?{}:{
                  //   Polyline(
                  //     polylineId: PolylineId('overview_polyline${widget.orderId}'),
                  //     color: Colors.red,
                  //     width: 2,
                  //     points: polyline
                  //         .map((e) => LatLng(e.latitude, e.longitude))
                  //         .toList(),
                  //   ),
                  // },
                   onTap: (LatLng latLng) {
                    _selectLocation = latLng;
                  mymarker.remove(const Marker(markerId: MarkerId("1")));
                  mymarker.add(
                      Marker(markerId: const MarkerId("1"), position: latLng));
                  final lat = latLng.latitude;
                  final long = latLng.longitude;
                  latSelect = latLng.latitude;
                  lngSelect = latLng.longitude;
                   _getPlace(latLng);
                  print(lat);
                  print(long);
                  setState(() {
                  });



                },
                markers: mymarker,
                  myLocationButtonEnabled: false,

                  myLocationEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    _currentLocation = position.target;
                  },
                ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 80,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, right: 30, left: 30),
                    child: CustomButton(
                      text: "save".tr(),
                      onPressed: () {
                        if(_selectLocation != null){
                        cubit.latitude =  _selectLocation != null ?  "${_selectLocation?.latitude}":null;
                        cubit.longitude =  _selectLocation!= null ?  "${_selectLocation?.longitude}":null;
                        if(widget.type == "address"){
                        cubitAddresses.latitude = _selectLocation != null ?  "${_selectLocation?.latitude}":null;
                        cubitAddresses.longitude = _selectLocation!= null ?  "${_selectLocation?.longitude}":null;
                        }
                        Navigator.of(context).pop();
                        }else{
                          AppUtil.errorToast(context, "Please choose a location on the map".tr()); 
                        }
                      },
                    ),
                  )),
            )
          ],
        ));
  }
  getCurrentPosition() async {
    Position position = await AppUtil.determinePosition();
    _currentLocation = LatLng(position.latitude, position.longitude);
    if(widget.update == true){
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(widget.lat ?? 0.0, widget.lng ?? 0.0), zoom: 9)));
    }else{
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _currentLocation, zoom: 9)));
    }
    setState(() {});
  }
  myLocation() async {
    if (widget.lat == null) {
      posision = await AppUtil.determinePosition();
      _currentLocation = LatLng(posision!.latitude, posision!.longitude);
    } else {
      _currentLocation = LatLng(widget.lat!, widget.lng!);
    }
    setState(() {});
  }
}
