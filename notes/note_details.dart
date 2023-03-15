import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteScreen extends StatelessWidget {
  String? noteTitle;
  String? date;
  // ignore: use_key_in_widget_constructors
  NoteScreen({this.noteTitle, this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Note',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.yellow,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.filter_list,
                color: Colors.yellow,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            date!,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Title',
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(noteTitle!)
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.all(10),
          height: 60,
          child: Row(
            children: [
              bottomItem('Album', Icons.photo_album),
              bottomItem('To_do_list', Icons.sim_card_alert_rounded),
              bottomItem('Reminder', Icons.notifications),
            ],
          )),
    );
  }

  Widget bottomItem(String title, IconData icon) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Icon(
              icon,
              size: 15,
              color: Colors.grey,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
