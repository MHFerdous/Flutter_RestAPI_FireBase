import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  ThemeData _currentTheme = ThemeData.light();

  void _changeTheme() {
    if (_currentTheme == ThemeData.light()) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
    setState(() {});
  }

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: const Text(
          'TODO App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            _changeTheme();
          },
          icon: const Icon(Icons.dark_mode),
        ),
        actions: [
          IconButton(
            color: Colors.blueGrey.shade900,
            onPressed: () {
              todos.clear();
              if (mounted) {
                setState(() {});
              }
            },
            icon: const Icon(Icons.remove_circle),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              todos[index].isDone = !todos[index].isDone;
              if (mounted) {
                setState(() {});
              }
            },
            leading: Visibility(
              visible: todos[index].isDone,
              replacement: const Icon(Icons.pending_actions_outlined),
              child: const Icon(Icons.done),
            ),
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: SingleChildScrollView(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      editTodoModelSheet();
                    },
                    icon: const Icon(Icons.change_circle),
                  ),
                  IconButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      todos.removeAt(index);
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
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
          showAddNewTodoModelSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showAddNewTodoModelSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Add new todo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(
                color: Colors.deepOrange,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    label: Text(
                      'Add title:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        //borderSide: BorderSide(color: Colors.black),
                        ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptionTEController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    label: Text(
                      'Add description:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_titleTEController.text.trim().isNotEmpty &&
                        _descriptionTEController.text.trim().isNotEmpty) {
                      todos.add(
                        Todo(_titleTEController.text.trim(),
                            _descriptionTEController.text.trim(), false),
                      );
                      if (mounted) {
                        setState(() {});
                      }
                      _titleTEController.clear();
                      _descriptionTEController.clear();
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void editTodoModelSheet() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Edit todo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Divider(
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    label: Text(
                      'Add title:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _descriptionTEController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    label: Text(
                      'Add description:',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_titleTEController.text.trim().isNotEmpty &&
                        _descriptionTEController.text.trim().isNotEmpty) {
                      todos.add(
                        Todo(_titleTEController.text.trim(),
                            _descriptionTEController.text.trim(), false),
                      );
                      if (mounted) {
                        setState(() {});
                      }
                      _titleTEController.clear();
                      _descriptionTEController.clear();
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}
