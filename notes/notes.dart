import 'package:flutter/material.dart';
import 'package:flutter_try/tasks/notes/note_details.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NotePad',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                constraints: const BoxConstraints(maxHeight: 25),
                contentPadding: const EdgeInsets.only(top: 35),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                hintText: 'Search notes',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[400],
                  height: 0,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[400],
                  size: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            noteItem('Todays grocery list', DateTime.now().toIso8601String(),
                Colors.green[200], context),
            noteItem('Rich dad Poor dad quotes',
                DateTime.now().toIso8601String(), Colors.yellow[200], context)
          ],
        ),
      ),
    );
  }

  Widget noteItem(String title, String date, Color? color, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoteScreen(
                      noteTitle: title,
                      date: date,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0), color: color),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title),
              const SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 10),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
