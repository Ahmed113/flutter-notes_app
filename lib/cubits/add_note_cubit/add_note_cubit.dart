import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';

import '../../constants.dart';
import '../../models/notes.dart';

class AddNotesCubit extends Cubit<AddNotesState>{
  AddNotesCubit(): super(AddNoteInitial());
  Color color = Color(0xff36213E);
  addNote(Notes note) async{
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<Notes>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
       emit(AddNoteFailure(e.toString()));
    }
  }
}