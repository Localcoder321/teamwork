import 'dart:io';

void main() {
  NoteApp application = NoteApp();

  stdout.writeln("Welcome to our Note application!");
  while (true) {
    stdout.writeln("");
    stdout.writeln("Please choose option: ");
    stdout.writeln("1. Add new note");
    stdout.writeln("2. Show all notes");
    stdout.writeln("3. Delete note");
    stdout.writeln("0. Finish program");
    stdout.write(">>>");

    String choice = stdin.readLineSync()!;

    if (choice == "1") {
      application.addNote();
    } else if (choice == "2") {
      application.showNotes();
    } else if (choice == "3") {
      application.deleteNote();
    } else if (choice == "0") {
      stdout.writeln("Thank you for using our program!");
      break;
    } else {
      stdout.writeln("You chose invalid number");
    }
  }
}

class Note {
  String title;
  String body;

  Note({required this.title, required this.body});
}

class NoteApp {
  List<Note> collection = [];
  var time;

  void addNote() {
    stdout.write("Enter note's title >>>");
    String title = _readline();

    stdout.writeln("Enter the body of note:");
    String body = _readline();

    Note newNote = Note(title: title, body: body);
    collection.add(newNote);

    DateTime date = DateTime.now();
    time = date;
    stdout.writeln("The added data: $date");

    stdout.write("Your note successfully saved!\n");
  }

  void showNotes() {
    if (collection.isEmpty) {
      stdout.writeln("The database is empty, please add new note");
    }
    for (int i = 0; i < collection.length; i++) {
      stdout.writeln("Note ID: ${i + 1}");
      stdout.writeln("The title of note: ${collection[i].title}");
      stdout.writeln("The body of note: ${collection[i].body}");
      stdout.writeln("The time when added: $time");
    }
  }

  void deleteNote() {
    if (collection.isEmpty) {
      stdout.writeln('No notes found.');
    } else {
      stdout.write('Enter the index of the note to delete:');
      int id = int.parse(_readline()) - 1;

      if (id >= 0 && id < collection.length) {
        collection.removeAt(id);
        stdout.writeln('Note deleted successfully!');
      } else {
        stdout.writeln('Invalid note index.');
      }
    }
  }

  String _readline() {
    return stdin.readLineSync()!;
  }
}
