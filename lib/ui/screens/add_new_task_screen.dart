import 'package:flutter/material.dart';
import 'package:mobile_application/data/models/network_response.dart';
import 'package:mobile_application/data/services/network_caller.dart';
import 'package:mobile_application/data/utils/urls.dart';
import 'package:mobile_application/ui/screens/update_profile_screen.dart';
import 'package:mobile_application/ui/widgets/user_profile_banner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  bool _addNewTaskInProgress = false;

  Future<void> addNewTask() async {
    _addNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "title": _titleTEController.text.trim(),
      "description": _descriptionTEController.text.trim(),
      "status": "New"
    };

    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, requestBody);

    _addNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _titleTEController.clear();
      _descriptionTEController.clear();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task added successfully'),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task adding failed'),
          ),
        );
      }
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserProfileBanner(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UpdateProfileScreen(),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Text('Add New Task',
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _titleTEController,
                        decoration: const InputDecoration(hintText: 'Title'),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _descriptionTEController,
                        maxLines: 4,
                        decoration:
                            const InputDecoration(hintText: 'Description'),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Please enter description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _addNewTaskInProgress == false,
                          replacement:
                              const Center(child: CircularProgressIndicator()),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!_formKey.currentState!.validate()) {
                                return;
                              }
                              addNewTask();
                            },
                            child: const Icon(Icons.arrow_forward_ios_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
