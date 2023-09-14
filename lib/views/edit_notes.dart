import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/models/notes.dart';
import 'package:notes_app/wedgits/edit_notes_body.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({Key? key, required this.note}) : super(key: key);

  final Notes note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:EditNotesBody(note:note,),
    );
  }
}
