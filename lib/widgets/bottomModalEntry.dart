import 'package:flutter/material.dart';

enum SingingCharacter { work, personal }

class BottomModalEntry extends StatefulWidget {
  @override
  _BottomModalEntryState createState() => _BottomModalEntryState();
}

class _BottomModalEntryState extends State<BottomModalEntry> {
  bool _isUrgent = false;

  bool _isImportant = false;

  SingingCharacter _character = SingingCharacter.work;

  TextEditingController _titleController = TextEditingController();

  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          barrierColor: Colors.black.withOpacity(0.5),
          backgroundColor: Theme.of(context).backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).accentColor, width: 5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          isDismissible: false,
          isScrollControlled: true,
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context, StateSetter state) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  padding: EdgeInsets.all(30),
                  child: Container(
                    height: size.height * 0.55,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Title:",
                              style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                            ),
                            Container(
                              width: size.width * 0.5,
                              child: TextField(
                                controller: _titleController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 3,
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context).accentColor,
                                      width: 3,
                                    ),
                                  ),
                                  hintText: 'Enter title',
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "ToDo:",
                          style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: size.width * 0.8,
                          child: TextField(
                            controller: _todoController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 3,
                                ),
                              ),
                              hintText: 'Enter ToDo',
                              hintStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: size.width * 0.4,
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor:
                                      Theme.of(context).primaryColor,
                                ),
                                child: CheckboxListTile(
                                  title: Text(
                                    "Urgent",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  activeColor: Theme.of(context).accentColor,
                                  value: _isUrgent,
                                  onChanged: (bool value) {
                                    state(() {
                                      _isUrgent = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.4,
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor:
                                      Theme.of(context).primaryColor,
                                ),
                                child: CheckboxListTile(
                                  title: Text(
                                    "Important",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  activeColor: Theme.of(context).accentColor,
                                  value: _isImportant,
                                  onChanged: (bool value) {
                                    state(() {
                                      _isImportant = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: size.width * 0.4,
                              child: ListTile(
                                title: Text(
                                  'Work',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                leading: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  child: Radio(
                                    value: SingingCharacter.work,
                                    groupValue: _character,
                                    activeColor: Theme.of(context).accentColor,
                                    onChanged: (SingingCharacter value) {
                                      state(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.4,
                              child: ListTile(
                                title: Text(
                                  'Personal',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                leading: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  child: Radio(
                                    value: SingingCharacter.personal,
                                    activeColor: Theme.of(context).accentColor,
                                    groupValue: _character,
                                    onChanged: (SingingCharacter value) {
                                      state(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.4,
                              child: Center(
                                child: FlatButton(
                                  child: Text(
                                    'Add Item',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.4,
                              child: Center(
                                child: FlatButton(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    _titleController.clear();
                                    _todoController.clear();
                                    _isUrgent = false;
                                    _isImportant = false;
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
