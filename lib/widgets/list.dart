import 'package:flutter/material.dart';
import 'package:launcher/models/entry.dart';
import 'package:launcher/screens/displayPage.dart';
import 'package:launcher/utils/dbUtilsClass.dart';

Widget styledQueriedList({
  String whereString,
  List<String> whereArgsStringList,
  Color mainStylingColor,
  double textFontSize,
  bool isLeadingNeeded,
}) {
  return FutureBuilder<List<Entry>>(
    future: DBUtilsClass.getEntry(
      whereString,
      whereArgsStringList,
    ),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Entry> entries = snapshot.data;
        return ListView.separated(
          itemCount: entries.length,
          itemBuilder: (context, idx) {
            Entry entry = entries[idx];
            return ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DisplayPage(
                      entry: entry,
                    ),
                  ),
                );
              },
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              visualDensity: VisualDensity(horizontal: -4, vertical: -2),
              leading: isLeadingNeeded
                  ? CircleAvatar(
                      backgroundColor: entry.category == 1
                          ? Colors.amber.withOpacity(0.75)
                          : Colors.purple[400],
                      maxRadius: 10,
                    )
                  : entry.category == 1
                      ? Icon(
                          Icons.work_outlined,
                          color: mainStylingColor,
                        )
                      : Icon(
                          Icons.assignment,
                          color: mainStylingColor,
                        ),
              title: Text(
                entry.title,
                style: TextStyle(
                  fontSize: textFontSize,
                  color: mainStylingColor,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              trailing: isLeadingNeeded
                  ? SizedBox(
                      width: 0,
                    )
                  : Icon(
                      Icons.info_outline,
                      color: mainStylingColor,
                      size: textFontSize,
                    ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: mainStylingColor,
            );
          },
        );
      }
      return Center(
        child: Theme(
            data: Theme.of(context).copyWith(accentColor: mainStylingColor),
            child: CircularProgressIndicator()),
      );
    },
  );
}
