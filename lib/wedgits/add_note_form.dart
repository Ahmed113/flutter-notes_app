import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_state.dart';
import 'package:intl/intl.dart';
import '../models/notes.dart';
import 'color_list_view.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title;
  String? subTitle;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CustomTextField(hintText:'title',
              onSaved: (value){
                title = value;
              },),
          ),
          CustomTextField(hintText: 'Content',
            maxLines: 5,
            onSaved: (value){
              subTitle = value;
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ColorListView(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: BlocBuilder<AddNotesCubit, AddNotesState>(
              builder: (BuildContext context, state) {
                state is AddNoteLoading? isLoading = true : false;
                return ElevatedButton(
                  onPressed: () {
                    var currentDate = DateTime.now();
                    var formatedDate = DateFormat.yMd().format(currentDate);
                    if(formKey.currentState!.validate()){
                      formKey.currentState!.save();
                      var note = Notes(title: title!, content: subTitle!, date: formatedDate, color: Colors.deepOrangeAccent.value);
                      BlocProvider.of<AddNotesCubit>(context).addNote(note);
                    }else{
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {

                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 40),
                    backgroundColor: Colors.cyanAccent.withOpacity(.8),
                  ),
                  child: isLoading? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ) :const Text('Add'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



