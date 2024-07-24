class Note {
  String title;
  String body;

  Note({required this.title, required this.body});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      body: map['body'],
    );
  }
}
