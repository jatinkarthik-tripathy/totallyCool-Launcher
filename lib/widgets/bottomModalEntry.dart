import 'package:flutter/material.dart';

class BottomModalEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FloatingActionButton(
      onPressed: () {
        showBottomSheet(
          context: context,
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).accentColor, width: 5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          builder: (context) => Container(
            height: size.height * 0.75,
          ),
        );
      },
      child: Icon(
        Icons.add,
        color: Theme.of(context).backgroundColor,
      ),
    );
  }
}
