
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common/custom_button.dart';
import '../note_service/note_service.dart';
import '../ulist/utils.dart';

class NoteEditScreen extends StatefulWidget {
  static const String routeName = "/edit-note-screen";
  final String noteDescription;
  final String noteId;
  const NoteEditScreen(
      {super.key, required this.noteDescription, required this.noteId});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final TextEditingController noteController = TextEditingController();
  final NoteService _noteService = NoteService();
  @override
  void initState() {
    super.initState();
    noteController.text = widget.noteDescription;
  }

  void updateNote() {
     _noteService.updateNote(
    
      userID: FirebaseAuth.instance.currentUser!.uid,
         context: context,
         updatedNote: noteController.text,
         noteId: widget.noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: noteController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: "Write here",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                onTap: () {
                  if (noteController.text.isNotEmpty) {
                    updateNote();
                  } else {
                    showSnackBar(context, "please enter the description");
                  }
                },
                text: "Submit Text")
          ],
        ),
      ),
    );
  }
}