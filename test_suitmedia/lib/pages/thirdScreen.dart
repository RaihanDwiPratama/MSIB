import 'package:flutter/material.dart';
import 'package:test_suitmedia/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String username;
  final String email;
  final String urlAvatar;

  const User({
    required this.username,
    required this.email,
    required this.urlAvatar,
  });
}

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> users = [];
  bool isLoading = false;
  int page = 1;
  int perPage = 10;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
      );
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final userList = jsonData['data'] as List<dynamic>;

        final List<User> fetchedUsers = userList.map((userData) {
          return User(
            username: '${userData['first_name']} ${userData['last_name']}',
            email: userData['email'],
            urlAvatar: userData['avatar'],
          );
        }).toList();

        setState(() {
          users.addAll(fetchedUsers);
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

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
          'Third Screen',
          style: TextStyle(color: AppColors.black),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            page = 1;
            users.clear();
          });
          return fetchData();
        },
        child: ListView.builder(
          itemCount: users.length + 1,
          itemBuilder: (context, index) {
            if (index == users.length) {
              if (isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox.shrink();
              }
            }

            final user = users[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pop(context,
                      user.username); // Kirim username kembali ke SecondScreen
                },
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(user.urlAvatar),
                ),
                title: Text(user.username),
                subtitle: Text(user.email),
              ),
            );
          },
        ),
      ),
    );
  }
}
