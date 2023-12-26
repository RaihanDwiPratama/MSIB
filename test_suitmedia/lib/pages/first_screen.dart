import 'package:flutter/material.dart';
import 'package:test_suitmedia/utils/styles.dart';
import 'package:test_suitmedia/pages/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _nameController = TextEditingController();
  final _palindromeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 205,
            horizontal: 30,
          ),
          decoration: Styles.background,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: Styles.addPerson,
                child: const Icon(
                  Icons.person_add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: 60),
              TextField(
                controller: _nameController,
                decoration: Styles.inputName,
                style: Styles.textInput,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _palindromeController,
                decoration: Styles.inputPolindrome,
                style: Styles.textInput,
              ),
              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: Styles.containerBtn,
                      onPressed: () {
                        String input = _palindromeController.text.toLowerCase();

                        if (input.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please enter a word.'),
                            ),
                          );
                          return;
                        }

                        String processedInput = input.replaceAll(' ', '');
                        String reversedInput = String.fromCharCodes(
                            processedInput.runes.toList().reversed);
                        bool isPalindrome = processedInput == reversedInput;

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Palindrome Checker'),
                              content: Text(
                                isPalindrome
                                    ? 'Input is a palindrome.'
                                    : 'Input is not a palindrome.',
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Check'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: Styles.containerBtn,
                      onPressed: () {
                        String name = _nameController.text;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(name: name),
                          ),
                        );
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
