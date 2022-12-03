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

class LocationsScreen extends StatefulWidget {
  final double? lat,lng;
  final String? type;
  const LocationsScreen({Key? key,this.lat,this.lng, this.type}) : super(key: key);

  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  GoogleMapController? googleMapController;
  
  var searchController = TextEditingController();
  Position? posision;
  LatLng _currentLocation =  LatLng(22.222233333333 , 22.33333345676);

  Set <Marker> mymarker = {
    const Marker(
      visible: true ,
      markerId: MarkerId("1"),
      position: LatLng(22.222233333333 , 22.33333345676)
    )
  };
String _address = ""; 
String _city = "";
double  latSelect = 0;
double  lngSelect = 0;
  final TextEditingController loginPhone = TextEditingController();

void _getPlace(LatLng latLng) async {
List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

  // this is all you need
  Placemark placeMark  = placemarks[0]; 
  String? name = placeMark.name;
  String? subLocality = placeMark.subLocality;
  String? locality = placeMark.locality;
  String? administrativeArea = placeMark.administrativeArea;
  // String? postalCode = placeMark.postalCode;
  String? country = placeMark.country;
  String?address = "${name}, ${subLocality}";
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
    // myLocation();
    _currentLocation =   LatLng(22.222233333333 , 22.33333345676);

  }

  @override
  Widget build(BuildContext context) {
    // final cubit = AdderssCubit.get(context);

    return Scaffold(
      appBar: customAppBar(title: CustomCard(
                                elevation: 0.0,
                                color: AppUI.backgroundColor.withOpacity(0.5),height: 58,
                                child: CustomInput(controller: searchController,onChange: (v) async {
                                  // List<Location> locations = await locationFromAddress(v,);
                                  // googleMapController!.animateCamera(
                                  //     CameraUpdate.newCameraPosition(
                                  //         CameraPosition(target: LatLng(locations[0].latitude, locations[0].longitude), zoom: 16)
                                  //     ));

                                },
                                //   onSubmit: (v) async {
                                //   List<Location> addresses = await locationFromAddress(v,);
                                //   // var addresses = await Geocoder.local.findAddressesFromQuery(v);
                                //   var first = addresses.first;
                                //   // print("${first.featureName} : ${first.coordinates}");
                                //     googleMapController!.animateCamera(
                                //       CameraUpdate.newCameraPosition(
                                //           CameraPosition(target: LatLng(first.latitude, first.longitude), zoom: 16)
                                //       ));
                                // },
                                  textInputType: TextInputType.text,prefixIcon: Icon(Icons.search,color: AppUI.iconColor,size: 30,),borderColor: Colors.transparent,fillColor: Colors.transparent,hint: "searchLocation".tr(),),),),
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: InkWell(
                                  onTap: () async {
                                    Position currentLocation = await AppUtil.determinePosition();
                                      googleMapController!.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude), zoom: 16)
                                          )
                                      );
                                  },
                                  child: Container(decoration: BoxDecoration(color: AppUI.whiteColor , shape: BoxShape.circle),height: 50 ,width: 50,child: Center(child: Icon(Icons.location_searching_rounded,color: AppUI.mainColor,size: 25,))),

                                      // const SizedBox(width: 7,),
                                      // CustomText(text: "determineMyLocation".tr(),fontWeight: FontWeight.bold,)
                                    // ],
                                  ),
      ),
       
                              
      body:
         Stack(
                  children: [
                    GoogleMap(
                    onMapCreated: (map){
                      googleMapController = map;
                    },
                      onCameraMove: (CameraPosition position) {
                        _currentLocation = position.target;
                      },
                    initialCameraPosition: CameraPosition(target: _currentLocation ,zoom: 8),
                    // myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    mapType:  MapType.hybrid,
                    onTap: (LatLng latLng) {
                      mymarker.remove(const Marker(markerId: MarkerId("1")));
                      mymarker.add(Marker(markerId: const MarkerId("1"),position: latLng));
                      setState(() {
                        
                      });
                   
                    final lat = latLng.latitude;
                    final long = latLng.longitude;
                    _getPlace(latLng);
                    //  getAddressFromLatLng(context,lat,long);
                    print(lat);
                    print(long);
                    },
                    markers: mymarker
                    // widget.lng!=null?{Marker(markerId: MarkerId(widget.lat.toString()),position: LatLng(widget.lat!, widget.lng!))}: {},
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(height: 80,child: Padding(
                        padding: const EdgeInsets.only(bottom: 30 , right: 30 , left: 30),
                        child: CustomButton(text: "save".tr(),),
                      )),)
                    
                    // if(widget.lat==null)
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 40,left: 7,right: 7),
                    //     child: CustomCard(
                    //       height: 130,
                    //       child: Column(
                    //         children: [
                    //           CustomCard(
                    //             elevation: 0.0,
                    //             color: AppUI.backgroundColor.withOpacity(0.5),height: 58,
                    //             child: CustomInput(controller: searchController,onChange: (v) async {
                    //               // List<Location> locations = await locationFromAddress(v,);
                    //               // googleMapController!.animateCamera(
                    //               //     CameraUpdate.newCameraPosition(
                    //               //         CameraPosition(target: LatLng(locations[0].latitude, locations[0].longitude), zoom: 16)
                    //               //     ));

                    //             },
                    //             //   onSubmit: (v) async {
                    //             //   List<Location> addresses = await locationFromAddress(v,);
                    //             //   // var addresses = await Geocoder.local.findAddressesFromQuery(v);
                    //             //   var first = addresses.first;
                    //             //   // print("${first.featureName} : ${first.coordinates}");
                    //             //     googleMapController!.animateCamera(
                    //             //       CameraUpdate.newCameraPosition(
                    //             //           CameraPosition(target: LatLng(first.latitude, first.longitude), zoom: 16)
                    //             //       ));
                    //             // },
                    //               textInputType: TextInputType.text,prefixIcon: Icon(Icons.search,color: AppUI.iconColor,size: 30,),borderColor: Colors.transparent,fillColor: Colors.transparent,hint: "searchLocation".tr(),),),
                    //           const SizedBox(height: 10,),
                    //           InkWell(
                    //             onTap: () async {
                    //               Position currentLocation = await AppUtil.determinePosition();
                    //                 googleMapController!.animateCamera(
                    //                     CameraUpdate.newCameraPosition(
                    //                         CameraPosition(target: LatLng(currentLocation.latitude, currentLocation.longitude), zoom: 16)
                    //                     )
                    //                 );
                    //             },
                    //             child: Row(
                    //               children: [
                    //                 Stack(
                    //                   alignment: Alignment.center,
                    //                   children: [
                    //                     Icon(Icons.location_searching_rounded,color: AppUI.mainColor,size: 18,),
                    //                     CircleAvatar(
                    //                       radius: 4,
                    //                       backgroundColor: AppUI.mainColor,
                    //                     )
                    //                   ],
                    //                 ),
                    //                 const SizedBox(width: 7,),
                    //                 CustomText(text: "determineMyLocation".tr(),fontWeight: FontWeight.bold,)
                    //               ],
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // if(widget.lat == null)
                    //   SizedBox.expand(
                    //   child: Center(
                    //       child: Icon(Icons.add_location,color: AppUI.mainColor,size: 40,)
                    //   ),
                    // ),
                //     Positioned(
                //       bottom: 0,right: 0,left: 0,
                //       child: Padding(
                //         padding: const EdgeInsets.only(bottom: 0),
                //         child: Container(
                //           height: 250,
                //            decoration: const BoxDecoration(
                //             borderRadius: const BorderRadius.only(topLeft: Radius.circular(10) , topRight: const Radius.circular(10)) ,
                //            color: Colors.white
                //            ),
                //          child: Container(
                //           padding: const EdgeInsets.only(left: 10 ,right: 10),
                //           child:   Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               const SizedBox(height: 10,),
                //               CustomText(text: "address".tr(),fontSize: 12,color: AppUI.greyColor,),
                //               const SizedBox(height: 10,),
                //               Row(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   // Image.asset("${AppUI.imgPath}pin-small.png",width: 20,  height: 20,),
                //                   const SizedBox(width: 10,),
                //                   Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                     CustomText(text: _city ,  color:AppUI.blackColor, fontSize: 13,),
                //                     const SizedBox(height: 5,),
                //                     CustomText(text: _address ,  color: AppUI.greyColor, fontSize: 13,)
                //                     ],
                //                   )
                //                 ],
                //               ),
                //               const SizedBox(height: 5,),
                //               const Divider(),
                //               const SizedBox(height: 5,),
                //               CustomText(text: "Site Description".tr() ,  color: AppUI.blackColor, fontSize: 13,),
                //               const SizedBox(height: 5,),
                //               CustomInput(controller:TextEditingController(),hint: "Site Description".tr(), textInputType: TextInputType.text ,fontSize: 13,),
                //               const SizedBox(height: 10,),
                              
                //               CustomButton(text: "save".tr(), onPressed: () async {
                //               //   if(widget.type ==null ) {
                //               //     if (latSelect == 0) {
                //               //       Navigator.pop(context, _currentLocation);
                //               //     } else {
                //               //       mymarker.remove(
                //               //           const Marker(markerId: MarkerId("1")));
                //               //       cubit.address = "${_address} , ${_city}";
                //               //       cubit.lat = latSelect;
                //               //       cubit.long = lngSelect;
                //               //       await cubit.addAddress(context);
                //               //       if (cubit.addAddresModel!.status == 200) {
                //               //         cubit.emit(AddAddressLoadedState());
                //               //         setState(() {
                //               //           cubit.getAddress();
                //               //           Navigator.pop(
                //               //               context, _currentLocation);
                //               //         });
                //               //       } else {
                //               //         AppUtil.errorToast(
                //               //             context, cubit.addAddresModel!.msg);
                //               //       }

                //               //       // AppUtil.openMap(double.parse(widget.lat.toString()), double.parse(widget.lng.toString()));
                //               //     }
                //               //   }else{
                //               //     Navigator.pop(context, _currentLocation);
                //               //   }
                //               }

                //               ,width: AppUtil.responsiveWidth(context)*0.9,)
                //             ],
                //           ),
                //          ),
                //         ),
                //       ),
                //     )
                  ],
                )
                // :const Center(child: CircularProgressIndicator());
          
      );
    
  }

  myLocation() async{
    if(widget.lat==null) {
      posision = await AppUtil.determinePosition();
      _currentLocation = LatLng(posision!.latitude, posision!.longitude);
    }else{
      _currentLocation = LatLng(widget.lat!, widget.lng!);
    }
    setState(() {});
  }
}
  