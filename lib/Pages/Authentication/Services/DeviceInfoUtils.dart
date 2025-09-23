// lib/Utils/device_info_utils.dart
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoUtils {
  static final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  // Get device information
  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      final packageInfo = await PackageInfo.fromPlatform();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return {
          'platform': 'Android',
          'device_model': androidInfo.model,
          'android_version': androidInfo.version.release,
          'sdk_version': androidInfo.version.sdkInt,
          'brand': androidInfo.brand,
          'device': androidInfo.device,
        };
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return {
          'platform': 'iOS',
          'device_model': iosInfo.model,
          'system_version': iosInfo.systemVersion,
          'device_name': iosInfo.name,
          'utsname': {
            'sysname': iosInfo.utsname.sysname,
            'nodename': iosInfo.utsname.nodename,
            'release': iosInfo.utsname.release,
            'version': iosInfo.utsname.version,
            'machine': iosInfo.utsname.machine,
          },
        };
      } else {
        return {'platform': 'Unknown'};
      }
    } catch (e) {
      return {'platform': 'Error getting device info: $e'};
    }
  }

  // Get app version info
  static Future<Map<String, dynamic>> getAppInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return {
        'app_name': packageInfo.appName,
        'package_name': packageInfo.packageName,
        'version': packageInfo.version,
        'build_number': packageInfo.buildNumber,
      };
    } catch (e) {
      return {'app_info': 'Error getting app info: $e'};
    }
  }
}