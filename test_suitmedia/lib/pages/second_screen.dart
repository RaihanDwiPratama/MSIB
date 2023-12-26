import 'package:flutter/material.dart';
import 'package:test_suitmedia/utils/styles.dart';
import 'package:test_suitmedia/pages/third_screen.dart';
import 'package:test_suitmedia/utils/colors.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  const SecondScreen({
    super.key,
    required this.name,
  });

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = 'Selected User Name'; // variabel selectedUserName

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            color: Color(0xff554AF0),
          ),
        ),
        title: Text(
          'Second Screen',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                widget.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 250),
              Center(
                child: Text(
                  selectedUserName, // Ganti teks dengan selectedUserName
                  style: Styles.selectUser,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 20.0,
        ),
        child: ElevatedButton(
          style: Styles.containerBtn,
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ThirdScreen(),
              ),
            );

            if (result != null && result is String) {
              setState(() {
                selectedUserName = result;
              });
            }
          },
          child: const Text('Choose a User'),
        ),
      ),
    );
  }
}
