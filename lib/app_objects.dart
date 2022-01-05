import 'package:uuid/uuid.dart';

class AppObject {
  String? name;
  String? id;

  void setID() {
    var uuid = const Uuid();
    id = uuid.v4();
  }
}

class ListObject extends AppObject {
  late List<String> items;

  ListObject([String? name, List<String>? tasks]) {
    name = name ?? "";
    items = tasks ?? [];
    setID();
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "id": id,
    "items": items,
  };
}

class NoteObject extends AppObject{
  late List<String> content;

  NoteObject([String? name, String? content]) {
    name = name ?? "";
    content = content ?? "";
    setID();
  }
}