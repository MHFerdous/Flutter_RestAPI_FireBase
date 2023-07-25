import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_application/ui/widgets/user_profile_banner.dart';

class UpdateProfileScreen extends StatelessWidget {

  pickImage (){

    final ImagePicker picker = ImagePicker();

  }

  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileBanner(
                onTap: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Update Profile',
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        picker();
                      },
                      child: const Text('Photo'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Phone',
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const TextField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
