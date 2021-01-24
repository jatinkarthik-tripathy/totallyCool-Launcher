import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class Apps extends StatefulWidget {
  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: FutureBuilder<List<Application>>(
          future: DeviceApps.getInstalledApplications(
              includeAppIcons: true,
              includeSystemApps: false,
              onlyAppsWithLaunchIntent: true),
          builder: (context, AsyncSnapshot<List<Application>> snapshot) {
            if (snapshot.hasData) {
              List<Application> apps = snapshot.data;
              print(apps);
              return Scrollbar(
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int position) {
                      Application app = apps[position];
                      return Column(
                        children: <Widget>[
                          ListTile(
                            leading: app is ApplicationWithIcon
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(app.icon),
                                    backgroundColor: Colors.white,
                                  )
                                : null,
                            onTap: () => DeviceApps.openApp(app.packageName),
                            title: Text(
                              '${app.appName} (${app.packageName})',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            subtitle: Text(
                              'Version: ${app.versionName}\n'
                              'System app: ${app.systemApp}\n'
                              'APK file path: ${app.apkFilePath}\n'
                              'Data dir: ${app.dataDir}\n'
                              'Installed: ${DateTime.fromMillisecondsSinceEpoch(app.installTimeMillis).toString()}\n'
                              'Updated: ${DateTime.fromMillisecondsSinceEpoch(app.updateTimeMillis).toString()}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Divider(
                            height: 1.0,
                          )
                        ],
                      );
                    },
                    itemCount: apps.length),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
