import 'package:flutter/material.dart';
import 'package:launcher/models/entry.dart';
import 'package:launcher/utils/dbUtilsClass.dart';

enum SingingCharacter { work, personal }

class DisplayPage extends StatefulWidget {
  final Entry entry;
  DisplayPage({this.entry});

  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  bool _isUrgent = false;

  bool _isImportant = false;

  SingingCharacter _character = SingingCharacter.work;

  TextEditingController _titleController = TextEditingController();

  TextEditingController _todoController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, StateSetter setState) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.entry.title;
    _todoController.text = widget.entry.todo;
    _isUrgent = widget.entry.isUrgent;
    _isImportant = widget.entry.isImportant;
    _selectedDate = DateTime.parse(widget.entry.date);
    if (widget.entry.category == 1) {
      _character = SingingCharacter.work;
    } else {
      _character = SingingCharacter.personal;
    }
  }

  bool isIgnoring = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 32,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_rounded,
              color: Colors.red,
              size: 32,
            ),
            onPressed: () {
              _titleController.clear();
              _todoController.clear();
              _isUrgent = false;
              _isImportant = false;
              DBUtilsClass.deleteEntry(widget.entry.id);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.9,
          width: size.width,
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: IgnorePointer(
                  ignoring: isIgnoring,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          Expanded(
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
                      Container(
                        width: size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "ToDo:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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
                            disabledBorder: OutlineInputBorder(
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
                          maxLines: 5,
                          textAlign: TextAlign.left,
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
                                  setState(() {
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
                                  setState(() {
                                    _isImportant = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      _isUrgent
                          ? Column(
                              children: [
                                Text(
                                  "DeadLine : ${_selectedDate.day}-${_selectedDate.month}-${_selectedDate.year}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.8,
                                  child: Center(
                                    child: FlatButton(
                                      child: Text(
                                        'Select Date',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          _selectDate(context, setState),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
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
                                    setState(() {
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
                                    setState(() {
                                      _character = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: size.height * 0.25,
                child: Center(
                  child: FlatButton(
                    child: Text(
                      isIgnoring ? 'Completed' : 'Update Item',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: isIgnoring
                            ? Colors.green
                            : Theme.of(context).accentColor,
                      ),
                    ),
                    onPressed: () {
                      if (isIgnoring) {
                        _titleController.clear();
                        _todoController.clear();
                        _isUrgent = false;
                        _isImportant = false;
                        DBUtilsClass.deleteEntry(widget.entry.id);
                        Navigator.of(context).pop();
                      } else {
                        Entry entry = Entry(
                            _titleController.text,
                            _todoController.text,
                            _isUrgent,
                            _isImportant,
                            _character == SingingCharacter.work ? 1 : 2,
                            _selectedDate.toString(),
                            widget.entry.id);

                        DBUtilsClass.updateEntry(entry);
                        _titleController.clear();
                        _todoController.clear();
                        _isUrgent = false;
                        _isImportant = false;
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          isIgnoring ? Icons.edit_off : Icons.edit,
          color: Theme.of(context).backgroundColor,
        ),
        onPressed: () {
          setState(() {
            isIgnoring = !isIgnoring;
          });
        },
      ),
    );
  }
}
