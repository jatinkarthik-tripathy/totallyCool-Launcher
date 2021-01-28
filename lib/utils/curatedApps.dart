import 'package:device_apps/device_apps.dart';

Future<List<Application>> curatedApps() async {
  List<Application> apps = await DeviceApps.getInstalledApplications(
    includeAppIcons: false,
    includeSystemApps: true,
    onlyAppsWithLaunchIntent: true,
  );
  List<Application> curatedApps = [];
  List<String> curatedAppList = [
    "Docs",
    "Sheets",
    "Slides",
    "Drive",
    "Solid Explorer",
    "YouTube Music",
    "Clock",
    "Phone",
    "Gmail"
  ];
  curatedAppList.sort();
  curatedAppList.forEach((item) {
    for (int i = 0; i < apps.length; i++) {
      if (apps[i].appName == item) {
        curatedApps.add(apps[i]);
      }
    }
  });
  return curatedApps;
}
