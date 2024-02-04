import 'package:discord_bot_manager/configs/theme.config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Discord Bot Manager'),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        child: const Text('Login'),
      ),
    );
  }
}
