import 'package:flutter/material.dart';
import 'package:mobile_application/data/models/auth_utility.dart';

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
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        tileColor: Colors.green,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            AuthUtility.userInfo.data?.photo ?? '',
          ),
          onBackgroundImageError: (_, __) {
            const Icon(Icons.image);
          },
          radius: 18,
        ),
        title: Text(
          '${AuthUtility.userInfo.data?.firstName ?? ''} ${AuthUtility.userInfo.data?.lastName ?? ''}',
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          AuthUtility.userInfo.data?.email ?? 'hala',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
