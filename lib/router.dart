
import 'package:firebase_project/Sscreen/add_note.dart';
import 'package:firebase_project/Sscreen/edit_note.dart';
import 'package:flutter/material.dart';

import 'auth/screen/login_screen.dart';

Route<dynamic> generateRoute (RouteSettings routeSettings){
  switch (routeSettings.name){
    case HomeScreen.routeName:
    return MaterialPageRoute(
  settings: routeSettings,builder: (_) => const HomeScreen());


  case AddNoteScreen.routeName:
    return MaterialPageRoute(
  settings: routeSettings,builder: (_) => const AddNoteScreen());

  

   


   




   // case SingleValueScreen.routeName:
     //  var text= routeSettings.arguments as String;
     // return MaterialPageRoute(
       //   settings: routeSettings,builder: (_) =>  SingleValueScreen(text: text,));


       case NoteEditScreen.routeName:
      final argument = routeSettings.arguments as Map<String, dynamic>;
      final noteDescription = argument["noteDescription"];
      final noteId = argument["noteId"];
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => NoteEditScreen(
                noteDescription: noteDescription,
                noteId: noteId,
              ));

    


    default:
      return MaterialPageRoute(
        settings: routeSettings,
      builder: (_)=>const Scaffold(
        body: Center(
          child: Text("Screen Doesn't exist"),
        ),
      )
    );

  }
}