import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/notes.dart';

import '../constants.dart';
import 'color_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';
import 'edit_notes_colorList.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({Key? key, required this.note}) : super(key: key);

  final Notes note;

  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {

  String? title;
  String? content;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          CustomAppBar(
            onPress: (){
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            noteAppbar:'Edit Notes',
            iconAppbar: Icons.check,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextField(
            onChange: (value){
              title = value;
            },
              hintText: widget.note.title,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextField(
            onChange: (value){
              content = value;
            },
            hintText: widget.note.content,
            maxLines: 5,
          ),
          const SizedBox(
            height: 25,
          ),
          EditNoteColorList(note: widget.note),
        ],
      ),
    );
  }
}

