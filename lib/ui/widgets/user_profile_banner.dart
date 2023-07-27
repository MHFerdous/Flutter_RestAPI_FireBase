import 'package:flutter/material.dart';

class UserProfileBanner extends StatefulWidget {
  final VoidCallback onTap;

  const UserProfileBanner({
    super.key,
    required this.onTap,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: const ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        tileColor: Colors.green,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://media.licdn.com/dms/image/D5603AQHbatj4wyrslw/profile-displayphoto-shrink_400_400/0/1680845343540?e=1695859200&v=beta&t=fdwnYqh-ohhrB3jqr0_x2JQeZDEM6zDVU2d34lzSc-0'),
          radius: 18,
        ),
        title: Text(
          'User Name',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'User email',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
