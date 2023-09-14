import '../../models/notes.dart';

abstract class NotesState{}

class NotesInitial extends NotesState{}
// class NotesLoading extends NotesState{}
class NotesSuccess extends NotesState{
//   final List<Notes> notes;
//   NotesSuccess(this.notes);
}
// class NotesFailure extends NotesState{
//   final String errMsg;
//   NotesFailure(this.errMsg);
// }