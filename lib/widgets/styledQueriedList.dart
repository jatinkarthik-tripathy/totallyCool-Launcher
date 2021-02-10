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
  bool isSortingNeeded,
}) {
  return FutureBuilder<List<Entry>>(
    future: DBUtilsClass.getEntry(
      whereString,
      whereArgsStringList,
    ),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        List<Entry> entries = snapshot.data;
        if (isSortingNeeded) {
          entries.sort((a, b) {
            String date1 = a.date;
            String date2 = b.date;
            return date1.compareTo(date2);
          });
        }
        return ListView.separated(
          itemCount: entries.length,
          itemBuilder: (context, idx) {
            Entry entry = entries[idx];
            return ListTile(
              onTap: () {
                Navigator.push(
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
                          ? Color(0xFF800020)
                          : Color(0xFF07575B),
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
              subtitle: entry.isUrgent
                  ? Text(
                      "${DateTime.parse(entry.date).day}-${DateTime.parse(entry.date).month}-${DateTime.parse(entry.date).year}",
                      style: TextStyle(
                        fontSize: 16,
                        color: mainStylingColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox(
                      height: 0,
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
