// import 'package:flutter/material.dart';
// import 'package:gag_cars_frontend/core/services/location_service.dart';
// import 'package:google_places_flutter/google_places_flutter.dart';
// import 'package:google_places_flutter/model/prediction.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:http/http.dart' as dotenv;

// class LocationPickerScreen extends StatefulWidget {
//   final Function(Prediction, LatLng?) onPlaceSelected;
  
//   const LocationPickerScreen({super.key, required this.onPlaceSelected});

//   @override
//   State<LocationPickerScreen> createState() => _LocationPickerScreenState();
// }

// class _LocationPickerScreenState extends State<LocationPickerScreen> {
//   final LocationService _locationService = LocationService();
//   String _status = 'Select a location';
//   bool _isLoading = false;

//   Future<void> _handleSearch() async {
//   try {
//     // Correct way to use google_places_flutter's autocomplete
//     final prediction = await PlacesAutocomplete.show(
//       context: context,
//       apiKey: dotenv.get('GOOGLE_API_KEY'),
//       mode: Mode.overlay, // or Mode.fullscreen
//       language: "en",
//       components: [Component(country: "us")], // Correct Component usage
//     );

//     if (prediction != null) {
//       // Get place details using google_maps_webservice
//       final places = GoogleMapsPlaces(apiKey: dotenv.get('GOOGLE_API_KEY'));
//       final details = await places.getDetailsByPlaceId(
//         prediction.placeId!,
//         fields: "geometry,name,formatted_address",
//       );

//       widget.onPlaceSelected(
//         prediction,
//         details.result.geometry?.location != null
//             ? LatLng(
//                 details.result.geometry!.location.lat,
//                 details.result.geometry!.location.lng,
//               )
//             : null,
//       );
//     }
//   } catch (e) {
//     setState(() => _status = 'Search error: ${e.toString()}');
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Location')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_isLoading) const CircularProgressIndicator(),
//             Text(_status, style: const TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _isLoading ? null : _handleCurrentLocation,
//                   child: const Text('Current Location'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _isLoading ? null : _handleSearch,
//                   child: const Text('Search Location'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
