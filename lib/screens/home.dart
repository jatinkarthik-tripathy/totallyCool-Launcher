import 'package:bordered_text/bordered_text.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Container(
            width: size.width,
            height: size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Container(
                      width: size.width * 0.8,
                      height: size.height * 0.06,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Google",
                              style: TextStyle(
                                fontSize: 32,
                                color: Theme.of(context).backgroundColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.mic,
                            size: 32,
                            color: Theme.of(context).backgroundColor,
                          )
                        ],
                      ),
                    ),
                    onPressed: () => DeviceApps.openApp(
                      "com.google.android.googlequicksearchbox",
                    ),
                    color: Theme.of(context).accentColor,
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.2,
                    child: StreamBuilder<DateTime>(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Container(
                                  width: size.width * 0.35,
                                  child: BorderedText(
                                    strokeColor: Theme.of(context).primaryColor,
                                    strokeWidth: 0.5,
                                    child: Text(
                                      DateFormat(
                                        'hh:mm  ',
                                      ).format(
                                        DateTime.now(),
                                      ),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 48,
                                        color: Theme.of(context).accentColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  DateFormat(
                                    'a',
                                  ).format(
                                    DateTime.now(),
                                  ),
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              DateFormat(
                                'EEEE',
                              ).format(
                                DateTime.now(),
                              ),
                              style: TextStyle(
                                fontSize: 42,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                            Text(
                              DateFormat(
                                'MM - dd - yyyy',
                              ).format(
                                DateTime.now(),
                              ),
                              style: TextStyle(
                                fontSize: 32,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          enableFeedback: true,
                          highlightColor: Theme.of(context).accentColor,
                          onTap: () => Navigator.pushNamed(context, '/todo'),
                          child: Icon(
                            Icons.today_rounded,
                            color: Theme.of(context).primaryColor,
                            size: size.height * 0.05,
                          ),
                        ),
                        InkWell(
                          enableFeedback: true,
                          highlightColor: Theme.of(context).accentColor,
                          onTap: () => Navigator.pushNamed(context, '/apps'),
                          child: Icon(
                            Icons.apps,
                            color: Theme.of(context).primaryColor,
                            size: size.height * 0.05,
                          ),
                        ),
                        InkWell(
                          enableFeedback: true,
                          highlightColor: Theme.of(context).accentColor,
                          onTap: () => Navigator.pushNamed(context, '/matrix'),
                          child: Icon(
                            Icons.filter_4,
                            color: Theme.of(context).primaryColor,
                            size: size.height * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
