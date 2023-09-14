import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_state.dart';
import 'package:notes_app/models/notes.dart';

class NotesCubit extends Cubit<NotesState>{
  NotesCubit() : super(NotesInitial());

  List<Notes>? notes;
  fetchAllNotes(){
      var notesBox = Hive.box<Notes>(kNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccess());
  }
}