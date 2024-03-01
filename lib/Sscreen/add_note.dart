
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../common/custom_button.dart';
import '../note_service/note_service.dart';
import '../ulist/utils.dart';



class AddNoteScreen extends StatefulWidget {
  static const String routeName = "/add-note-screen";
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController noteController = TextEditingController();
   final NoteService _noteService = NoteService();
   final noteId = const Uuid().v1();

  void addNote() {
     _noteService.addNotes(
      userID: FirebaseAuth.instance.currentUser!.uid,
      noteId: noteId,
       context: context,
        note: noteController.text,
        );
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Note Screen"),
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
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                onTap: () {
                  if (noteController.text.isNotEmpty) {
                    addNote();
                  } else {
                    showSnackBar(context, "ERTYUI");
                  }
                },
                text: "Submit Text")
          ],
        ),
      ),
    );
  }
}