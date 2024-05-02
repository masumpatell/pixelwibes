import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pixelwibes/constants/appColor.dart';
import 'package:http/http.dart' as http;
import 'package:pixelwibes/screens/person_bar/search.dart';
import '../../database/database.dart';

class Person_bar extends StatefulWidget {
  const Person_bar({Key? key}) : super(key: key);

  @override
  State<Person_bar> createState() => _PersonBarState();
}

class _PersonBarState extends State<Person_bar> {
  TextEditingController searchController = TextEditingController();
  late Future<List<dynamic>> _futureData;
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    _futureData = getApiData();
    initDatabase();
  }

  Future<void> initDatabase() async {
    await _databaseHelper.init();
  }

  Future<List<dynamic>> getApiData() async {
    try {
      final response = await http
          .get(Uri.parse("https://randomuser.me/api/?page=1&results=10"));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['results'];
        return data;
      } else {
        throw Exception("Failed to load data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            SearchWidget(context, searchController),
            FutureBuilder(
              future: _futureData,
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var person = snapshot.data![index];
                        var firstName = person['name']['first'];
                        var lastName = person['name']['last'];
                        var email = person['email'];
                        var picture = person['picture']['large'];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(picture),
                          ),
                          title: Text('$firstName $lastName'),
                          subtitle: Text(email),
                          trailing: InkWell(
                            onTap: () {
                              _databaseHelper.insertPerson({
                                'FName': firstName,
                                'LName': lastName,
                                'email': email,
                                'picture': picture,
                              }).then((_) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Added to favorites'),
                                ));
                              }).catchError((error) {
                                print('Error: $error');
                              });
                            },
                            child: const Icon(Icons.favorite),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
