import 'package:flutter/material.dart';
import 'package:task4/models/users.dart';
import 'package:task4/database/DatabaseHelper.dart';
import 'package:task4/screens/posts.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DatabaseHelper _dbHelper = DatabaseHelper();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching Users From Database'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: _dbHelper.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No saved users.'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Posts(
                          userId: user.id,
                          userName: user.name,
                        ),
                      ),
                    );
                  },
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  leading: CircleAvatar(
                    child: Text(user.name[0]),
                  ),
                  trailing: const Icon(Icons.save_outlined),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dbHelper.printUsersTable();
        },
        child: const Icon(Icons.print),
      ),
    );
  }
}
