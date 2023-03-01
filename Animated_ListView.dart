import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ListViewTask extends StatefulWidget {
  const ListViewTask({super.key});

  @override
  State<ListViewTask> createState() => _ListViewTaskState();
}

class _ListViewTaskState extends State<ListViewTask> {
  Color itemColor = Colors.yellow;
  int currentIndex = 0;

  List<String> items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: const Text(
          'Flutter Mapp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 100,
      ),
      backgroundColor: Colors.black38,
      body: Column(
        children: [
          Center(
            child: IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {
                setState(() {
                  insertItem();
                });
              },
            ),
          ),
          AnimatedList(
            shrinkWrap: true,
            key: _key,
            initialItemCount: items.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                  sizeFactor: animation, child: itembuilder(index, animation));
            },
          ),
        ],
      ),
    );
  }

  Widget itembuilder(int index, Animation<double> animation) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.yellow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                items[index],
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    setState(() {
                      deleteItem(index);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void deleteItem(int index) {
    _key.currentState?.removeItem(
      index,
      duration: const Duration(milliseconds: 500),
      (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: Container(
          color: Colors.red,
          child: const ListTile(
            title: Text(
              'Deleted',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    items.removeAt(index);
    currentIndex = index;
  }

  void insertItem() {
    items.insert(0, 'item${currentIndex + 1}');
    _key.currentState
        ?.insertItem(0, duration: const Duration(milliseconds: 700));
    currentIndex++;
  }
}
