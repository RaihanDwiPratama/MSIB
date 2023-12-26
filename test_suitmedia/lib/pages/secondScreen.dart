import 'package:flutter/material.dart';
import 'package:test_suitmedia/pages/styles.dart';
import 'package:test_suitmedia/pages/thirdScreen.dart';
import 'package:test_suitmedia/utils/colors.dart';

class SecondScreen extends StatefulWidget {
    const SecondScreen({required this.name}); //  parameter name

  final String name;
  @override
  _SecondScreenState createState() => _SecondScreenState();
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
          child: Icon(
            Icons.chevron_left,
            color: Colors.grey,
          ),
        ),
        title: Text(
          'Second Screen',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 14),
              ),
              Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 250),
              Center(
                child: Text(
                  selectedUserName, // Ganti teks dengan selectedUserName
                  style: Styles.selectUser,
                ),
              ),
              SizedBox(height: 250),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: Styles.containerBtn,
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdScreen(),
                          ),
                        );

                        if (result != null && result is String) {
                          setState(() {
                            selectedUserName = result;
                          });
                        }
                      },
                      child: Text('Choose a User'),
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
