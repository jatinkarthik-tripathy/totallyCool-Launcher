import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          width: size.width,
          height: size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.15,
                  child: StreamBuilder<DateTime>(
                    stream: Stream.periodic(const Duration(minutes: 1)),
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Text(
                            DateFormat(
                              'hh:mm a',
                            ).format(
                              DateTime.now(),
                            ),
                            style: TextStyle(
                              fontSize: 48,
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w600,
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
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.03),
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 3,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    );
  }
}
