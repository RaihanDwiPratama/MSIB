import 'package:flutter/material.dart';
import 'package:test_suitmedia/pages/styles.dart';
import 'package:test_suitmedia/pages/secondScreen.dart';

class FirstScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _polindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 205, horizontal: 30),
          decoration: Styles.background,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                child: Icon(
                  Icons.person_add,
                  color: Colors.white,
                  size: 30,
                ),
                decoration: Styles.addPerson,
              ),
              SizedBox(height: 60),
              TextField(
                controller: _nameController,
                decoration: Styles.inputName,
                style: Styles.textInput,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _polindromeController,
                decoration: Styles.inputPolindrome,
                style: Styles.textInput,
              ),
              SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: Styles.containerBtn,
                      onPressed: () {
                        String input = _polindromeController.text.toLowerCase();
                        String processedInput = input.replaceAll(
                            ' ', ''); // Menghapus spasi dari input
                        String reversedInput = String.fromCharCodes(
                            processedInput.runes.toList().reversed);
                        bool isPalindrome = processedInput == reversedInput;

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Palindrome Checker'),
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
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Check'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
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
                      child: Text('Next'),
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
