import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final String? avatarUrl;
  final String sex;

  const CustomAvatar({super.key, this.avatarUrl, required this.sex});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // If avatarURL is null or empty, display a default image
      backgroundImage: avatarUrl != null && avatarUrl!.isNotEmpty
          ? NetworkImage(avatarUrl!)
          : sex == "homme"
              ? const AssetImage('assets/avatar_man.png') as ImageProvider
              : const AssetImage('assets/avatar_women.png') as ImageProvider,
      radius: 25,
    );
  }
}

class ProfileDoctorImage extends StatelessWidget {
  final String? avatarUrl;
  final String sex;

  const ProfileDoctorImage({super.key, this.avatarUrl, required this.sex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? Image.network(
                alignment: Alignment.topCenter,
                avatarUrl!,
                fit: BoxFit.cover,
              )
            : sex == "homme"
                ? Image.asset(
                    alignment: Alignment.topCenter,
                    'assets/avatar_man.png',
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    alignment: Alignment.topCenter,
                    'assets/avatar_women.png',
                    fit: BoxFit.cover,
                  ));
  }
}
