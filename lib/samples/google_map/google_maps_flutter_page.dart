import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sandbox/samples/google_map/service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// https://pub.dev/packages/google_maps_flutter
class GoogleMapsFlutterPage extends StatefulWidget {
  @override
  State<GoogleMapsFlutterPage> createState() => GoogleMapsFlutterPageState();
}

class GoogleMapsFlutterPageState extends State<GoogleMapsFlutterPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580684, -122.085749655962),
    zoom: 14.4746,
  );
  Set<Polyline> _lines = {};
  Set<Marker> _markers = {};
  String _drawer_name = "";
  String _drawer_info = "";
  String _drawer_lat = "";
  String _drawer_lng = "";

  @override
  void initState() {
    super.initState();
    createPolylines();
    createMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FlutterLogo(),
          MapContainer(),
          FlutterLogo(),
        ],
      ),
    );
  }

  MapContainer() {
    return Expanded(
        child: Container(
      width: 1000,
      height: 900,
      child: Scaffold(
        key: _scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: MapDrawer(),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: _markers,
          polylines: _lines,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    ));
  }

  MapDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Text("name: ${_drawer_name}"),
          ),
          ListTile(
            title: Text("info: ${_drawer_info}"),
          ),
          ListTile(
            title: Text("latitude: ${_drawer_lat}"),
          ),
          ListTile(
            title: Text("longitude: ${_drawer_lng}"),
          ),
        ],
      ),
    );
  }

  marker_tapped(Place place) {
    setState(() {
      _drawer_name = place.name;
      _drawer_info = place.info;
      _drawer_lat = place.latlng.latitude.toString();
      _drawer_lng = place.latlng.longitude.toString();
    });
    _scaffoldKey.currentState?.openDrawer();
  }

  void createMarkers() async {
    Set<Marker> markers = await getMarkers(marker_tapped);
    setState(() {
      _markers = markers;
    });
  }

  void createPolylines() async {
    Set<Polyline> lines = await getLines();
    setState(() {
      _lines = lines;
    });
  }
}


// /// 検索ボタン押下時に表示されるページ
// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   late Prediction? prediction;
//   List<Prediction> predictions = [];
//   final homeScaffoldKey = GlobalKey<ScaffoldState>();
//   final searchScaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     prediction = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: googleMapsAPIKey,
//       mode: Mode.overlay, // Mode.fullscreen
//       language: 'fr',
//       components: [Component(Component.country, 'fr')],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: homeScaffoldKey,
//       body: SafeArea(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.black12,
//                             blurRadius: 10,
//                             spreadRadius: 1,
//                             offset: Offset(10, 10),
//                           )
//                         ],
//                       ),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.8,
//                         alignment: Alignment.centerLeft,
//                         child: TextFormField(
//                           onChanged: _textChanged,
//                           decoration: InputDecoration(
//                             prefixIcon: IconButton(
//                               color: Colors.grey[500],
//                               icon: const Icon(Icons.arrow_back_ios_new),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                             hintText: '場所を検索',
//                             hintStyle: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Flexible(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: 0,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: ListTile(
//                         title: const Text(''),
//                         onTap: () async {},
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// 検索テキストボックス文字列変更イベントハンドラ
//   Future<void> _textChanged(String changedText) async {
//     // final result = await prediction.
//     // if (result != null && result.predictions != null && mounted) {
//     //   setState(() {
//     //     predictions = result.predictions!;
//     //   });
//     // }
//     if (prediction == null) {
//       return;
//     }

//     final places = GoogleMapsPlaces(
//       apiKey: googleMapsAPIKey,
//     );

//     final detail = await places.getDetailsByPlaceId(prediction!.placeId!);
//     final lat = detail.result.geometry!.location.lat;
//     final lng = detail.result.geometry!.location.lng;

//     homeScaffoldKey.currentState!.showBottomSheet<void>(
//       (context) =>
//           SnackBar(content: Text('${prediction!.description} - $lat/$lng')),
//     );
//   }
// }
