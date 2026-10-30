import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:depi_app_1/screens/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        foregroundColor: const Color(0xffff5e00),
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: Colors.orange.shade100,
            child: const Icon(Icons.person, size: 45, color: Color(0xffff5e00)),
          ),
          const SizedBox(height: 12),
          Text(
            user?.email ?? 'Store Customer',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          _ProfileTile(
            icon: Icons.person_outline,
            title: 'Edit Profile',
            onTap: () => _showMessage(context, 'Profile editing is ready soon'),
          ),
          _ProfileTile(
            icon: Icons.lock_outline,
            title: 'Change Password',
            onTap: () async {
              if (user?.email == null) return;
              await FirebaseAuth.instance.sendPasswordResetEmail(
                email: user!.email!,
              );
              if (context.mounted) {
                _showMessage(context, 'Password reset email sent');
              }
            },
          ),
          _ProfileTile(
            icon: Icons.credit_card,
            title: 'My Cards',
            onTap: () => _showMessage(context, 'No saved cards yet'),
          ),
          const SizedBox(height: 15),
          const Text(
            'App Settings',
            style: TextStyle(
              color: Color(0xffff5e00),
              fontWeight: FontWeight.bold,
            ),
          ),
          _ProfileTile(
            icon: Icons.notifications_none,
            title: 'Notifications',
            onTap: () => _showMessage(context, 'Notifications are on'),
          ),
          _ProfileTile(
            icon: Icons.language,
            title: 'Language',
            onTap: () => _showMessage(context, 'English is selected'),
          ),
          _ProfileTile(
            icon: Icons.logout,
            title: 'Logout',
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.brown.shade700),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
