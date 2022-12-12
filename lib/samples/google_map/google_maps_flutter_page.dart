import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// https://pub.dev/packages/google_maps_flutter
class GoogleMapsFlutterPage extends StatefulWidget {
  const GoogleMapsFlutterPage({super.key});

  @override
  _GoogleMapsFlutterPage createState() => _GoogleMapsFlutterPage();
}

class _GoogleMapsFlutterPage extends State<GoogleMapsFlutterPage> {
  Position? currentPosition;
  final Completer<GoogleMapController> _controller = Completer();
  late StreamSubscription<Position> positionStream;
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );
  final CameraPosition initPosition = const CameraPosition(
    target: LatLng(35.689, 139.692),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    //位置情報が許可されていない時に許可をリクエストする
    Future(() async {
      final permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
    });

    //現在位置を更新し続ける
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      currentPosition = position;
      print(
        position == null
            ? 'Unknown'
            : '${position.latitude.toString()}, ${position.longitude.toString()}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('google_maps_flutter_page'),
      ),
      body: GoogleMap(
        compassEnabled: false,
        onMapCreated: _controller.complete,
        myLocationEnabled: true,
        initialCameraPosition: initPosition,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.search),
      ),
    );
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
