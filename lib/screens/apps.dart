import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:launcher/utils/curatedApps.dart';

class Apps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
        title: Text("Apps"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: Theme.of(context).backgroundColor,
          ),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Application>>(
          future: curatedApps(),
          builder: (context, AsyncSnapshot<List<Application>> snapshot) {
            if (snapshot.hasData) {
              List<Application> apps = snapshot.data;
              return Container(
                width: size.width * 0.9,
                height: size.height * 0.8,
                child: Center(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(apps.length, (idx) {
                      Application app = apps[idx];
                      return Center(
                        child: GestureDetector(
                          onTap: () => DeviceApps.openApp(app.packageName),
                          child: Container(
                            width: size.width * 0.25,
                            height: size.height * 0.1,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.circular(size.height * 0.03),
                              border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 3,
                              ),
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                app.appName == "YouTube Music"
                                    ? "YT Music"
                                    : '${app.appName}',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
