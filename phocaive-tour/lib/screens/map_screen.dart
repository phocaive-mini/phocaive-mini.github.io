import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';
import '../flutter_gen/gen_l10n/app_localizations.dart';
import '../services/admob_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Default location (Seoul, South Korea) - BTS related area
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.5665, 126.9780),
    zoom: 10.0,
  );
  
  // BTS related locations markers
  final Set<Marker> _markers = {};
  BannerAd? _bannerAd;
  bool _isBannerAdReady = false;
  
  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    _loadBannerAd();
  }
  
  void _initializeMarkers() {
    // Markers will be initialized with localized strings in didChangeDependencies
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateMarkersWithLocalization();
  }
  
  void _updateMarkersWithLocalization() {
    final l10n = AppLocalizations.of(context)!;
    
    // Clear and re-add markers with localized strings
    setState(() {
      _markers.clear();
      _markers.addAll([
        Marker(
          markerId: const MarkerId('hybe'),
          position: const LatLng(37.5345, 126.9767),
          infoWindow: InfoWindow(
            title: l10n.hybeBuilding,
            snippet: l10n.btsAgencyHeadquarters,
          ),
        ),
        Marker(
          markerId: const MarkerId('olympic_stadium'),
          position: const LatLng(37.5152, 127.0734),
          infoWindow: InfoWindow(
            title: l10n.olympicStadium,
            snippet: l10n.btsPerformanceVenue,
          ),
        ),
        Marker(
          markerId: const MarkerId('han_river'),
          position: const LatLng(37.5293, 126.9341),
          infoWindow: InfoWindow(
            title: l10n.hanRiverPark,
            snippet: l10n.popularBtsFilmingLocation,
          ),
        ),
        // Add more BTS locations as needed
      ]);
    });
  }
  
  void _loadBannerAd() {
    if (kIsWeb) return;
    
    _bannerAd = AdMobService.createBannerAd(AdType.mapBanner);
    _bannerAd?.load().then((_) {
      if (mounted) {
        setState(() {
          _isBannerAdReady = true;
        });
      }
    });
  }
  
  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mapMenu),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_new),
            onPressed: () => _launchGoogleMap(),
            tooltip: l10n.openInGoogleMaps,
          ),
        ],
      ),
      body: kIsWeb 
        ? _buildWebView(l10n)
        : Stack(
            children: [
              // Google Map
              Positioned.fill(
                bottom: _isBannerAdReady ? 60 : 0,
                child: _buildMobileMap(),
              ),
              
              // Banner Ad at bottom
              if (_isBannerAdReady && _bannerAd != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: _bannerAd!.size.width.toDouble(),
                    height: _bannerAd!.size.height.toDouble(),
                    child: AdWidget(ad: _bannerAd!),
                  ),
                ),
            ],
          ),
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
            'BTS Tour Map',
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
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildMobileMap() {
    return GoogleMap(
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController controller) {
        // Map controller is ready
      },
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: true,
      mapType: MapType.normal,
      compassEnabled: true,
    );
  }
  
  Future<void> _launchGoogleMap() async {
    // Comprehensive BTS tour map with multiple locations
    const url = 'https://www.google.com/maps/d/u/0/viewer?mid=1knazh0TzMvi_cR4kjZmfGwTXsK7-UbcE&hl=en_US&femb=1&ll=35.95447704760809%2C127.76692200000002&z=6';
    final uri = Uri.parse(url);
    
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        if (mounted) {
          final l10n = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.mapLinkCopied),
              action: SnackBarAction(
                label: l10n.viewLink,
                onPressed: () {
                  // Copy to clipboard or show the URL
                  if (kDebugMode) {
                    print('BTS Map URL: $url');
                  }
                },
              ),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Could not launch map: $e');
    }
  }
}