import 'package:flutter/material.dart';
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
                        child: ElevatedButton(
                          onPressed: () {
                            /*if (!_formKey.currentState!.validate()) {
                              return;
                            }*/
                          },
                          child: const Icon(Icons.arrow_forward_ios_outlined),
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
