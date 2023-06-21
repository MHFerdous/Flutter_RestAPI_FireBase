import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO App'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: todos[index].isDone
                ? const Icon(Icons.done)
                : const Icon(Icons.pending_actions_outlined),
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: IconButton(
              onPressed: () {
                todos.removeAt(index);
                if (mounted) {
                  setState(() {});
                }
              },
              icon: const Icon(Icons.delete),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 4,
            color: Colors.green,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todos.add(
            Todo('Title', 'Description', false),
          );
          if (mounted) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}
