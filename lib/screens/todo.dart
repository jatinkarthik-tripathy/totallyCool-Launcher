import 'package:flutter/material.dart';
import 'package:launcher/models/entry.dart';
import 'package:launcher/utils/dbUtilsClass.dart';
import 'package:launcher/widgets/bottomModalEntry.dart';

class ToDo extends StatefulWidget {
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool _toggle1 = false;
  bool _toggle2 = false;
  bool _toggle3 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.02,
                  vertical: size.height * 0.015,
                ),
                width: size.width * 0.9,
                height: _toggle1 ? size.height * 0.6 : size.height * 0.1,
                color: Colors.amber.withOpacity(0.75),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: size.height * 0.015),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "WorkStuff",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Theme.of(context).backgroundColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: size.height * 0.05,
                              color: Theme.of(context).backgroundColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _toggle1 = !_toggle1;
                                _toggle2 = _toggle2 ? !_toggle2 : _toggle2;
                                _toggle3 = _toggle3 ? !_toggle3 : _toggle3;
                                print(_toggle1);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    _toggle1
                        ? Divider(
                            color: Theme.of(context).backgroundColor,
                            thickness: 5,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    _toggle1
                        ? Container(
                            height: size.height * 0.49,
                            child: FutureBuilder<List<Entry>>(
                                future: DBUtilsClass.getEntry(
                                  'category = ?',
                                  "1",
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Entry> entries = snapshot.data;
                                    return ListView.separated(
                                      itemCount: entries.length,
                                      itemBuilder: (context, idx) {
                                        Entry entry = entries[idx];
                                        return ListTile(
                                          title: Text(
                                            entry.title,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          color:
                                              Theme.of(context).backgroundColor,
                                        );
                                      },
                                    );
                                  }
                                  return Center(
                                    child: Theme(
                                        data: Theme.of(context).copyWith(
                                            accentColor: Theme.of(context)
                                                .backgroundColor),
                                        child: CircularProgressIndicator()),
                                  );
                                }),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.02,
                  vertical: size.height * 0.015,
                ),
                width: size.width * 0.9,
                height: _toggle2 ? size.height * 0.6 : size.height * 0.1,
                color: Colors.purple[400],
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: size.height * 0.015),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "PersonalProjects",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Theme.of(context).backgroundColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Theme.of(context).backgroundColor,
                              size: size.height * 0.05,
                            ),
                            onPressed: () {
                              setState(() {
                                _toggle2 = !_toggle2;
                                _toggle1 = _toggle1 ? !_toggle1 : _toggle1;
                                _toggle3 = _toggle3 ? !_toggle3 : _toggle3;
                                print(_toggle1);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    _toggle2
                        ? Divider(
                            color: Theme.of(context).backgroundColor,
                            thickness: 5,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    _toggle2
                        ? Container(
                            height: size.height * 0.49,
                            child: FutureBuilder<List<Entry>>(
                                future: DBUtilsClass.getEntry(
                                  'category = ?',
                                  "2",
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Entry> entries = snapshot.data;
                                    return ListView.separated(
                                      itemCount: entries.length,
                                      itemBuilder: (context, idx) {
                                        Entry entry = entries[idx];
                                        return ListTile(
                                          title: Text(
                                            entry.title,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          color:
                                              Theme.of(context).backgroundColor,
                                        );
                                      },
                                    );
                                  }
                                  return Center(
                                    child: Theme(
                                        data: Theme.of(context).copyWith(
                                            accentColor: Theme.of(context)
                                                .backgroundColor),
                                        child: CircularProgressIndicator()),
                                  );
                                }),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.02,
                  vertical: size.height * 0.015,
                ),
                width: size.width * 0.9,
                height: _toggle3 ? size.height * 0.6 : size.height * 0.1,
                color: Colors.blueGrey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: size.height * 0.015),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "DeadLines",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Theme.of(context).backgroundColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: size.height * 0.05,
                              color: Theme.of(context).backgroundColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _toggle3 = !_toggle3;
                                _toggle1 = _toggle1 ? !_toggle1 : _toggle1;
                                _toggle2 = _toggle2 ? !_toggle2 : _toggle2;
                                print(_toggle1);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    _toggle3
                        ? Divider(
                            color: Theme.of(context).backgroundColor,
                            thickness: 5,
                          )
                        : SizedBox(
                            height: 0,
                          ),
                    _toggle3
                        ? Container(
                            height: size.height * 0.49,
                            child: FutureBuilder<List<Entry>>(
                                future: DBUtilsClass.getEntry(
                                  'isUrgent = ?',
                                  "1",
                                ),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<Entry> entries = snapshot.data;
                                    return ListView.separated(
                                      itemCount: entries.length,
                                      itemBuilder: (context, idx) {
                                        Entry entry = entries[idx];
                                        return ListTile(
                                          title: Text(
                                            entry.title,
                                            style: TextStyle(
                                              fontSize: 24,
                                              color: Theme.of(context)
                                                  .backgroundColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return Divider(
                                          color:
                                              Theme.of(context).backgroundColor,
                                        );
                                      },
                                    );
                                  }
                                  return Center(
                                    child: Theme(
                                        data: Theme.of(context).copyWith(
                                            accentColor: Theme.of(context)
                                                .backgroundColor),
                                        child: CircularProgressIndicator()),
                                  );
                                }),
                          )
                        : SizedBox(
                            height: 0,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: BottomModalEntry(),
    );
  }
}
