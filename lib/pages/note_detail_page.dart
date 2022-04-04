import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posinotes_sqlflite/db/notes_database.dart';
import 'package:posinotes_sqlflite/model/note.dart';
import 'package:posinotes_sqlflite/pages/edit_note_page.dart';

class NoteDetailPage extends StatefulWidget {
  final int noteId;

  const NoteDetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note note;
  bool isLoading = false;

  @override
  initState()  {
    super.initState();

    refreshNote();
  //  note = await NotesDatabase.instance.readNote(widget.noteId);
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    note = await NotesDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(

      actions: [editButton(), deleteButton()],
    ),
    body: isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            note.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            DateFormat.yMMMd().format(note.createdTime),
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 8),
          Text(
            note.description,
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
    ),
  );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      color: Colors.blue,
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditNotePage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
    icon: Icon(Icons.delete),
    color: Colors.blue,
    onPressed: () async {
      await NotesDatabase.instance.delete(widget.noteId);

      Navigator.of(context).pop();
    },
  );
}
