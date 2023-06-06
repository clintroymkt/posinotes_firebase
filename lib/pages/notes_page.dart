import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:posinotes_sqlflite/db/notes_database.dart';
import 'package:posinotes_sqlflite/model/note.dart';
import 'package:posinotes_sqlflite/pages/edit_note_page.dart';
import 'package:posinotes_sqlflite/pages/note_detail_page.dart';
import 'package:posinotes_sqlflite/widget/note_card_widget.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late List<Note> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  // @override
  // void dispose() {
  //   NotesDatabase.instance.close();

  //   super.dispose();
  // }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      foregroundColor: Color(0XFF3BAAFF),
      automaticallyImplyLeading: false,
      title: Text(
        'Notes',
        style: TextStyle(fontSize: 24),
      ),
      actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading
          ? CircularProgressIndicator()
          : notes.isEmpty
          ? Text(
        'No Notes',
        style: TextStyle(color: Colors.black, fontSize: 24),
      )
          : buildNotes(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Color(0XFF3BAAFF),
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditNotePage()),
        );

        refreshNotes();

      },
    ),
  );

  Widget buildNotes() => MasonryGridView.count(
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemCount: notes.length,
    itemBuilder: (BuildContext context, int index) {
      var note = notes[index];
      return GestureDetector(
        onTap: () async{
          await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteDetailPage(noteId: note.id!)));
        },
          child: NoteCardWidget(note: note, index: index),
      );
      refreshNotes();
    },



    // padding: EdgeInsets.all(8),
    // itemCount: notes.length,
    // staggeredTileBuilder: (index) => StaggeredGridTile.fit(2, crossAxisCellCount: null,),
    // crossAxisCount: 4,
    // mainAxisSpacing: 4,
    // crossAxisSpacing: 4,
    // itemBuilder: (context, index) {
    //   final note = notes[index];
    //
    //   return GestureDetector(
    //     onTap: () async {
    //       await Navigator.of(context).push(MaterialPageRoute(
    //         builder: (context) => NoteDetailPage(noteId: note.id!),
    //       ));
    //
    //       refreshNotes();
    //     },
    //     child: NoteCardWidget(note: note, index: index),
    //   );
    // },

  );
}
