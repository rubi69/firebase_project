// To parse this JSON data, do
//
//     final noteModel = noteModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<NoteModel> noteModelFromJson(String str) => List<NoteModel>.from(json.decode(str).map((x) => NoteModel.fromJson(x)));

String noteModelToJson(List<NoteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoteModel {
    final String userId;
    final String note;
    final String noteId;

    NoteModel({
        required this.userId,
        required this.note,
        required this.noteId,
    });

    NoteModel copyWith({
        String? userId,
        String? note,
        String? noteId,
    }) => 
        NoteModel(
            userId: userId ?? this.userId,
            note: note ?? this.note,
            noteId: noteId ?? this.noteId,
        );

    factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        userId: json["userId"],
        note: json["note"],
        noteId: json["noteID"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "note": note,
        "noteID": noteId,
    };
}
