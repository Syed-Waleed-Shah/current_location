library current_location;

import 'dart:convert';

import 'package:http/http.dart' as http;

class CurrentLocation {
  static Future<CurrentLocationInfo> get() async {
    http.Response response =
        await http.get(Uri.parse('http://ip-api.com/json'));
    if (response.statusCode == 200) {
      return CurrentLocationInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
        'Unable to find CurrentLocationInfo because you might not be connected to internet or your firewall refused to access your IP',
      );
    }
  }
}

class CurrentLocationInfo {
  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String as;
  final String query;

  CurrentLocationInfo({
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as,
    required this.query,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "country": country,
      "countryCode": countryCode,
      "region": region,
      "regionName": regionName,
      "city": city,
      "zip": zip,
      "lat": lat,
      "lon": lon,
      "timezone": timezone,
      "isp": isp,
      "as": as,
      "query": query,
    };
  }

  static CurrentLocationInfo fromJson(Map<String, dynamic> json) {
    return CurrentLocationInfo(
      status: json['status'] ?? '',
      country: json['country'] ?? '',
      countryCode: json['countryCode'] ?? '',
      region: json['region'] ?? '',
      regionName: json['regionName'] ?? '',
      city: json['city'] ?? '',
      zip: json['zip'] ?? '',
      lat: json['lat'] ?? -1,
      lon: json['lon'] ?? -1,
      timezone: json['timezone'] ?? '',
      isp: json['isp'] ?? '',
      org: json['org'] ?? '',
      as: json['as'] ?? '',
      query: json['query'] ?? '',
    );
  }
}
