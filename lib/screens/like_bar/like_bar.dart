import 'package:flutter/material.dart';
import 'package:pixelwibes/constants/appColor.dart';
import '../../database/database.dart';

class Like_bar extends StatefulWidget {
  const Like_bar({super.key});

  @override
  State<Like_bar> createState() => _Like_barState();
}

class _Like_barState extends State<Like_bar> with RouteAware{
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
    initDatabase();
  }

  Future<void> initDatabase() async {
    await _databaseHelper.init();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightBlue,
      body: FutureBuilder(
        future: _databaseHelper.getAllPersons(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data == null) {
            return const Text('No data available');
          } else {
            final persons = snapshot.data!;
            return ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                final person = persons[index];
                final firstName = person['FName'];
                final lastName = person['LName'];
                final email = person['email'];
                final picture = person['picture'];
                return ListTile(
                  title: Text('$firstName $lastName'),
                  subtitle: Text(email),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(picture),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
