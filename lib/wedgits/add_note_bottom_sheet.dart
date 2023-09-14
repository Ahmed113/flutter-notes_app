import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AddNotesCubit();
      },
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom
                ),
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 8),
                    child: SingleChildScrollView(child: AddNoteForm())),
              ),
            );
          },
          listener: (context, Object? state) {
            if(state is AddNoteFailure){
              print('Failed ${state.errorMsg}');
            }

            if(state is AddNoteSuccess){
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
      ),
    );
  }
}

