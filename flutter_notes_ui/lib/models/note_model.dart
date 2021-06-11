class Note {
  String title;
  String content;
  DateTime date;
  Note({this.title, this.content, this.date});
}

final Map<String, int> categories = {
  'Notes': 112,
  'Work': 58,
  'Home': 23,
  'Complete': 31,
};

final List<Note> notes = [
  Note(
      title: "Buy Ticket",
      content: 'Buy Airplane ticket through Kayak for \$318.38',
      date: DateTime(219, 10, 10, 8, 30)),
  Note(
      title: "WalkWith Dog",
      content: 'Walk on street with my favorite dog.',
      date: DateTime(219, 10, 10, 7, 30)),
];
