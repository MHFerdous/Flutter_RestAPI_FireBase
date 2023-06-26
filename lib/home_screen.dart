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
  final TextEditingController _dateTEController = TextEditingController();

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            onLongPress: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                context: context,
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Task Details',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      ListTile(
                        title: Text('Title: ${tasks[index].title}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description: ${tasks[index].description}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text(
                              'Date: ${tasks[index].date}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                tasks.removeAt(index);
                                Navigator.pop(context);
                                if (mounted) {
                                  setState(() {});
                                }
                              },
                              child: const Text('Delete'),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            },
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add Task'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleTEController,
                      decoration: const InputDecoration(
                        label: Text('title:'),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _descriptionTEController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        label: Text('Description:'),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _dateTEController,
                      decoration: const InputDecoration(
                        label: Text('Days required:'),
                        focusedBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      tasks.add(
                        Task(
                            _titleTEController.text.trim(),
                            _descriptionTEController.text.trim(),
                            _dateTEController.text.trim()),
                      );
                      if (mounted) {
                        setState(() {});
                      }
                      _titleTEController.clear();
                      _descriptionTEController.clear();
                      _dateTEController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  )
                ],
                contentPadding: const EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Task {
  String title, description;
  String date;
  Task(this.title, this.description, this.date);
}
