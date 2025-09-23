import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationSearchPage extends StatefulWidget {
  final Function(Map<String, dynamic>)? onLocationSelected;
  const LocationSearchPage({super.key, this.onLocationSelected});

  @override
  State<LocationSearchPage> createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late GoogleMapsPlaces _placesClient;
  List<Prediction> _searchResults = [];
  bool _isLoading = false;
  bool _locationPermissionDenied = false;
  bool _locationServiceEnabled = true;
  Position? _currentPosition;
  String? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _placesClient = GoogleMapsPlaces(apiKey: dotenv.get('GOOGLE_API_KEY'));
    _searchController.addListener(_debounceSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _placesClient.dispose();
    super.dispose();
  }

  void _debounceSearch() {
    if (_searchController.text.length > 2) {
      _searchLocations(_searchController.text);
    } else {
      setState(() => _searchResults = []);
    }
  }

  Future<void> _searchLocations(String query) async {
    if (!mounted) return;
    
    setState(() => _isLoading = true);
    try {
      final response = await _placesClient.autocomplete(
        query,
        types: ['(cities)'],
        region: 'gh', // Focus on Ghana
        language: 'en',
      );
      
      if (!mounted) return;
      setState(() => _searchResults = response.predictions);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error searching locations'),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: () => _searchLocations(_searchController.text),
          ),
        ),
      );
      debugPrint('Search error: $e');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
      _locationPermissionDenied = false;
      _locationServiceEnabled = true;
    });

    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _locationServiceEnabled = false);
        _showLocationServiceDialog();
        return;
      }

      // Check and request permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _locationPermissionDenied = true);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => _locationPermissionDenied = true);
        _showLocationPermissionDialog();
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      // Get address from coordinates
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String locationName = _formatLocationName(place);
        
        setState(() {
          _currentPosition = position;
          _selectedLocation = locationName;
          _searchController.text = locationName;
        });

        if (widget.onLocationSelected != null) {
          widget.onLocationSelected!({
            'locationName': locationName,
            'position': position,
            'coordinates': '${position.latitude},${position.longitude}',
          });
        }
      }
    } catch (e) {
      debugPrint('Location error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Error getting current location'),
          action: SnackBarAction(
            label: 'Retry',
            onPressed: _getCurrentLocation,
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String _formatLocationName(Placemark place) {
    String locality = place.locality ?? '';
    String country = place.country ?? '';
    String administrativeArea = place.administrativeArea ?? '';
    
    if (locality.isNotEmpty && country.isNotEmpty) {
      return '$locality, $country';
    } else if (locality.isNotEmpty) {
      return '$locality, $administrativeArea';
    } else if (country.isNotEmpty) {
      return country;
    }
    return '${place.name}, ${place.administrativeArea}';
  }

  void _showLocationServiceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text('Please enable location services to use this feature.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openLocationSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _showLocationPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Required'),
        content: const Text('This app needs location permission to determine your current location.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Geolocator.openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _handleLocationSelection(Prediction prediction) async {
    setState(() {
      _selectedLocation = prediction.description;
      _searchController.text = prediction.description ?? '';
    });

    try {
      // Get details for the selected place to get coordinates
      final details = await _placesClient.getDetailsByPlaceId(prediction.placeId!);
      if (details.result.geometry?.location != null) {
        final location = details.result.geometry!.location;
        _currentPosition = Position(
          latitude: location.lat,
          longitude: location.lng,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0, 
          altitudeAccuracy: 0, 
          headingAccuracy: 0,
        );
      }
    } catch (e) {
      debugPrint('Error getting place details: $e');
    }

    if (widget.onLocationSelected != null) {
      widget.onLocationSelected!({
        'locationName': prediction.description,
        'position': _currentPosition,
        'coordinates': _currentPosition != null 
          ? '${_currentPosition!.latitude},${_currentPosition!.longitude}'
          : null,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        centerTitle: true,
        actions: [
          if (_selectedLocation != null)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.pop(context, {
                  'locationName': _selectedLocation,
                  'position': _currentPosition,
                  'coordinates': _currentPosition != null 
                    ? '${_currentPosition!.latitude},${_currentPosition!.longitude}'
                    : null,
                });
              },
              tooltip: 'Confirm selection',
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 8),
            if (_locationPermissionDenied) _buildPermissionWarning(),
            if (!_locationServiceEnabled) _buildLocationServiceWarning(),
            const SizedBox(height: 16),
            Expanded(child: _buildLocationList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            decoration: InputDecoration(
              hintText: 'Search for a location...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _searchFocusNode.requestFocus();
                        setState(() => _searchResults = []);
                      },
                    )
                  : null,
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: _getCurrentLocation,
          tooltip: 'Use current location',
        ),
      ],
    );
  }

  Widget _buildPermissionWarning() {
    return InkWell(
      onTap: _showLocationPermissionDialog,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.warning, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Location permission denied. Tap to enable.',
                style: TextStyle(color: Colors.red[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationServiceWarning() {
    return InkWell(
      onTap: _showLocationServiceDialog,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_off, color: Colors.orange),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Location services disabled. Tap to enable.',
                style: TextStyle(color: Colors.orange[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationList() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              _searchController.text.isEmpty
                  ? 'Search for a location or use your current position'
                  : 'No locations found. Try a different search.',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final prediction = _searchResults[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(prediction.description ?? ''),
            onTap: () => _handleLocationSelection(prediction),
          ),
        );
      },
    );
  }
}
