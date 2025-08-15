import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller; // Used in mobile map implementation
  
  // Default location (Seoul, South Korea)
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.5665, 126.9780),
    zoom: 6.0,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mapMenu),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: kIsWeb 
        ? _buildWebView(l10n)
        : _buildMobileMap(),
    );
  }
  
  Widget _buildWebView(AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.map,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'Google Maps',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.checkBtsPlaces,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _launchGoogleMap(),
            icon: const Icon(Icons.open_in_new),
            label: Text(l10n.openInGoogleMaps),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMobileMap() {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {
        setState(() {
          _controller = controller;
        });
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
    );
  }
  
  void _launchGoogleMap() {
    // 실제 BTS 관련 장소들이 표시된 Google Maps 링크
    const url = 'https://www.google.com/maps/d/u/0/viewer?mid=1knazh0TzMvi_cR4kjZmfGwTXsK7-UbcE&hl=en_US&femb=1&ll=35.95447704760809%2C127.76692200000002&z=6';
    
    // Web에서는 window.open을 사용해야 하지만, 지금은 간단히 메시지 표시
    final l10n = AppLocalizations.of(context)!;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.mapLinkCopied),
        action: SnackBarAction(
          label: l10n.viewLink,
          onPressed: () {
            // URL을 콘솔에 출력 (웹 개발자 도구에서 확인 가능)
            if (kDebugMode) {
              print('BTS Map URL: $url');
            }
          },
        ),
      ),
    );
  }
}