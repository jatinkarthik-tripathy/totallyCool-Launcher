class Entry {
  final int id;
  final String title;
  final String todo;
  final bool isUrgent;
  final bool isImportant;
  final String date;
  final int category;

  Entry(this.title, this.todo, this.isUrgent, this.isImportant, this.category,
      [this.date, this.id]);

  Map<String, dynamic> toMap() {
    int val1 = isUrgent ? 1 : 0;
    int val2 = isImportant ? 1 : 0;
    return {
      'title': title,
      'todo': todo,
      'isUrgent': val1,
      'isImportant': val2,
      'category': category,
      'date': date,
    };
  }
}
