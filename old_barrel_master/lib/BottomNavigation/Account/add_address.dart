import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:old_barrel/Components/custom_button.dart';
import 'package:old_barrel/Components/entry_field.dart';
import 'package:old_barrel/Locale/locale.dart';
import 'package:old_barrel/OrderMapBloc/order_map_bloc.dart';
import 'package:old_barrel/OrderMapBloc/order_map_state.dart';
import 'package:old_barrel/map_utils.dart';

class AddAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: AddAddressBody(),
    );
  }
}

class AddAddressBody extends StatefulWidget {
  @override
  _AddAddressBodyState createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });
    super.initState();
  }

  int? _currentValue = -1;
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.8,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      BlocBuilder<OrderMapBloc, OrderMapState>(
                          builder: (context, state) {
                        print('polyyyy' + state.polylines.toString());
                        return GoogleMap(
                          zoomControlsEnabled: false,
                          // polylines: state.polylines,
                          mapType: MapType.normal,
                          initialCameraPosition: kGooglePlex,
                          markers: _markers,
                          onMapCreated: (GoogleMapController controller) async {
                            _mapController.complete(controller);
                            mapStyleController = controller;
                            mapStyleController!.setMapStyle(mapStyle);
                            setState(() {
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('mark1'),
                                  position: LatLng(
                                      37.42796133580664, -122.085749655962),
                                  icon: markerss.first,
                                ),
                              );
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('mark2'),
                                  position: LatLng(
                                      37.42496133180663, -122.081743655960),
                                  icon: markerss[0],
                                ),
                              );
                              _markers.add(
                                Marker(
                                  markerId: MarkerId('mark3'),
                                  position: LatLng(
                                      37.42196183580660, -122.089743655967),
                                  icon: markerss[0],
                                ),
                              );
                            });
                          },
                        );
                      }),
                      PositionedDirectional(
                        top: 130,
                        start: 20,
                        end: 20,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                filled: true,
                                hintText: locale.searchService,
                                fillColor: theme.secondaryHeaderColor,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: theme.primaryColor,
                                ),
                                suffixIcon: Icon(
                                  Icons.my_location_sharp,
                                  color: theme.primaryColor,
                                )),
                          ),
                        ),
                      ),
                      AppBar(),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 12),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              child: Row(
                                children: [
                                  Theme(
                                    data: ThemeData.dark(),
                                    child: Radio(
                                      value: 1,
                                      groupValue: _currentValue,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentValue = value;
                                        });
                                      },
                                      focusColor:
                                          Theme.of(context).backgroundColor,
                                      activeColor:
                                          Theme.of(context).backgroundColor,
                                    ),
                                  ),
                                  Text(
                                    locale.home!,
                                    style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                  ),
                                  Spacer(),
                                  VerticalDivider(
                                    thickness: 0.5,
                                    color: Theme.of(context).backgroundColor,
                                    indent: 30,
                                    endIndent: 30,
                                  ),
                                  Spacer(),
                                  Theme(
                                    data: ThemeData.dark(),
                                    child: Radio(
                                      value: 2,
                                      focusColor:
                                          Theme.of(context).backgroundColor,
                                      activeColor:
                                          Theme.of(context).backgroundColor,
                                      groupValue: _currentValue,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    locale.office!,
                                    style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                  ),
                                  Spacer(),
                                  VerticalDivider(
                                    thickness: 0.5,
                                    color: Theme.of(context).backgroundColor,
                                    indent: 30,
                                    endIndent: 30,
                                  ),
                                  Spacer(),
                                  Theme(
                                    data: ThemeData.dark(),
                                    child: Radio(
                                      value: 3,
                                      hoverColor:
                                          Theme.of(context).backgroundColor,
                                      focusColor:
                                          Theme.of(context).backgroundColor,
                                      activeColor:
                                          Theme.of(context).backgroundColor,
                                      groupValue: _currentValue,
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _currentValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    locale.other!,
                                    style: TextStyle(
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.location_on,
                                        color: theme.primaryColor,
                                      ),
                                      title: Text(
                                        'B121 - Galaxy Residency, Hemiltone Tower,' +
                                            '\n' +
                                            'New York, USA.',
                                        style: theme.textTheme.caption!
                                            .copyWith(
                                                fontSize: 13, height: 1.3),
                                      ),
                                    ),
                                    Spacer(),
                                    EntryField(
                                      label: locale.addLandmark,
                                      hint: locale.writeAddressLandmark,
                                    ),
                                    Spacer(),
                                    CustomButton(
                                      text: locale.saveAddress!.toUpperCase(),
                                      onTap: () {
                                        // Navigator.pushNamed(
                                        //     context, PageRoutes.manageAddress);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
