import 'package:flutter/material.dart';
import 'package:launcher/widgets/list.dart';

class EisenhowerMatrix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
          title: Text("Eisenhower Matrix"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: Theme.of(context).backgroundColor,
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: RichText(
                      text: TextSpan(
                        text: 'Important',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: -1,
                    child: RichText(
                      text: TextSpan(
                        text: 'Not Important',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Urgent",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                      ),
                      Text(
                        "Not Urgent",
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.85,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: size.width / size.height,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: styledQueriedList(
                            whereString: 'isUrgent = ? AND isImportant = ?',
                            whereArgsStringList: ['1', '1'],
                            mainStylingColor: Theme.of(context).primaryColor,
                            textFontSize: 18,
                            isLeadingNeeded: true,
                            isSortingNeeded: false,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                              bottom: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: styledQueriedList(
                            whereString: 'isUrgent = ? AND isImportant = ?',
                            whereArgsStringList: ['0', '1'],
                            mainStylingColor: Theme.of(context).primaryColor,
                            textFontSize: 18,
                            isLeadingNeeded: true,
                            isSortingNeeded: false,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                              right: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: styledQueriedList(
                            whereString: 'isUrgent = ? AND isImportant = ?',
                            whereArgsStringList: ['1', '0'],
                            mainStylingColor: Theme.of(context).primaryColor,
                            textFontSize: 18,
                            isLeadingNeeded: true,
                            isSortingNeeded: false,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                              left: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: styledQueriedList(
                            whereString: 'isUrgent = ? AND isImportant = ?',
                            whereArgsStringList: ['0', '0'],
                            mainStylingColor: Theme.of(context).primaryColor,
                            textFontSize: 18,
                            isLeadingNeeded: true,
                            isSortingNeeded: false,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
