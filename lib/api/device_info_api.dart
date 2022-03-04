import 'dart:io';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import 'platform_indentify.dart';

class DeviceInfoApi {
  static final _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String> getOperatingSystem() async => Platform.operatingSystem;

  static Future<String> getScreenResolution() async =>
      '${window.physicalSize.width} X ${window.physicalSize.height}';

  static Future<String> getDeviceInfo() async {
    if (PlatformIndentify.deviceType == DeviceType.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;

      return '${info.manufacturer} - ${info.model}';
    } else if (PlatformIndentify.deviceType == DeviceType.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;

      return '${info.name} ${info.model}';
    }  else if (PlatformIndentify.deviceType == DeviceType.isWeb) {
      final info = await _deviceInfoPlugin.webBrowserInfo;

      return '${info.browserName}';
    } else if (PlatformIndentify.deviceType == DeviceType.isWindows) {
      final info = await _deviceInfoPlugin.windowsInfo;

      return info.computerName;
    } else if (PlatformIndentify.deviceType == DeviceType.isMacOS) {
      final info = await _deviceInfoPlugin.macOsInfo;

      return '${info.computerName} - ${info.hostName}';
    } else if (PlatformIndentify.deviceType == DeviceType.isLinux) {
      final info = await _deviceInfoPlugin.linuxInfo;

      return '${info.name} - ${info.prettyName}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getDeviceVersion() async {
    if (PlatformIndentify.deviceType == DeviceType.isAndroid) {
      final info = await _deviceInfoPlugin.androidInfo;
      return info.version.sdkInt.toString();
    } else if (PlatformIndentify.deviceType == DeviceType.isIOS) {
      final info = await _deviceInfoPlugin.iosInfo;
      return info.systemVersion!;
    } else if (PlatformIndentify.deviceType == DeviceType.isWeb) {
      final info = await _deviceInfoPlugin.webBrowserInfo;
      return info.browserName.toString();
    } else if (PlatformIndentify.deviceType == DeviceType.isWindows) {
      final info = await _deviceInfoPlugin.windowsInfo;
      return info.numberOfCores.toString() + ' Cores';
    } else if (PlatformIndentify.deviceType == DeviceType.isMacOS) {
      final info = await _deviceInfoPlugin.macOsInfo;
      return info.kernelVersion;
    } else if (PlatformIndentify.deviceType == DeviceType.isLinux) {
      final info = await _deviceInfoPlugin.linuxInfo;
      return info.version!;
    } else {
      throw UnimplementedError();
    }
  }

  static Future<Map<String, dynamic>> getInfo() async {
    try {
      if (PlatformIndentify.deviceType == DeviceType.isAndroid) {
        final info = await _deviceInfoPlugin.androidInfo;
        return _readAndroidBuildData(info);
      } else if (PlatformIndentify.deviceType == DeviceType.isIOS) {
        final info = await _deviceInfoPlugin.iosInfo;
        return _readIosDeviceInfo(info);
      } else if (PlatformIndentify.deviceType == DeviceType.isWeb) {
        final info = await _deviceInfoPlugin.webBrowserInfo;
        return _readWebDeviceInfo(info);
      } else if (PlatformIndentify.deviceType == DeviceType.isWindows) {
        final info = await _deviceInfoPlugin.windowsInfo;
        return _readWindowsDeviceInfo(info);
      } else if (PlatformIndentify.deviceType == DeviceType.isMacOS) {
        final info = await _deviceInfoPlugin.macOsInfo;
        return _readMacOsDeviceInfo(info);
      } else if (PlatformIndentify.deviceType == DeviceType.isLinux) {
        final info = await _deviceInfoPlugin.linuxInfo;
        return _readLinuxDeviceInfo(info);
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      return <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo info) {
    return <String, dynamic>{
      'device': info.device,
      'brand': info.brand,
      'isPhysicalDevice': info.isPhysicalDevice,
      'version.sdkInt': info.version.sdkInt,
      'manufacturer': info.manufacturer,
      'model': info.model,
      '': '',
      ' ': '',
      'version.securityPatch': info.version.securityPatch,
      'version.release': info.version.release,
      'version.previewSdkInt': info.version.previewSdkInt,
      'version.incremental': info.version.incremental,
      'version.codename': info.version.codename,
      'version.baseOS': info.version.baseOS,
      'board': info.board,
      'bootloader': info.bootloader,
      'display': info.display,
      'fingerprint': info.fingerprint,
      'hardware': info.hardware,
      'host': info.host,
      'id': info.id,
      'product': info.product,
      'supported32BitAbis': info.supported32BitAbis,
      'supported64BitAbis': info.supported64BitAbis,
      'supportedAbis': info.supportedAbis,
      'tags': info.tags,
      'type': info.type,
      'androidId': info.androidId,
      'systemFeatures': info.systemFeatures,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo info) {
    return <String, dynamic>{
      'name': info.name,
      'systemName': info.systemName,
      'systemVersion': info.systemVersion,
      'model': info.model,
      'localizedModel': info.localizedModel,
      'identifierForVendor': info.identifierForVendor,
      'isPhysicalDevice': info.isPhysicalDevice,
      'utsname.sysname:': info.utsname.sysname,
      'utsname.nodename:': info.utsname.nodename,
      'utsname.release:': info.utsname.release,
      'utsname.version:': info.utsname.version,
      'utsname.machine:': info.utsname.machine,
    };
  }

  static Map<String, dynamic> _readWebDeviceInfo(WebBrowserInfo info) {
    return <String, dynamic>{
      'browserName': info.browserName,
      'deviceMemory': info.deviceMemory,
      'hardwareConcurrency': info.hardwareConcurrency,
      'language': info.language,
      'maxTouchPoints': info.maxTouchPoints,
      'platform': info.platform,
      'product': info.product,
      'productSub:': info.productSub,
      'userAgent:': info.userAgent,
      'vendor:': info.vendor,
      'vendorSub:': info.vendorSub,
    };
  }

  static Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo info) {
    return <String, dynamic>{
      'computerName': info.computerName,
      'numberOfCores': info.numberOfCores,
      'systemMemoryInMegabytes': info.systemMemoryInMegabytes,
    };
  }

  static Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo info) {
    return <String, dynamic>{
      'computerName': info.computerName,
      'numberOfCores': info.activeCPUs,
      'architecture': info.arch,
      'cpuFrequency': info.cpuFrequency,
      'hostName': info.hostName,
      'kernelVersion': info.kernelVersion,
      'memorySize': info.memorySize,
      'model': info.model,
      'osRelease': info.osRelease,
      'systemGUID': info.systemGUID,
    };
  }

  static Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo info) {
    return <String, dynamic>{
      'buildId': info.buildId,
      'id': info.id,
      'idLike': info.idLike,
      'machineId': info.machineId,
      'name': info.name,
      'prettyName': info.prettyName,
      'variant': info.variant,
      'variantId': info.variantId,
      'version': info.version,
      'versionCodename': info.versionCodename,
      'versionId': info.versionId,
    };
  }
}
