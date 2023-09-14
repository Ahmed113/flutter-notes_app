import 'package:flutter/cupertino.dart';

@immutable
abstract class AddNotesState {}

class AddNoteInitial extends AddNotesState{}
class AddNoteLoading extends AddNotesState{}
class AddNoteSuccess extends AddNotesState{}
class AddNoteFailure extends AddNotesState{
  String? errorMsg;

  AddNoteFailure(this.errorMsg);
}