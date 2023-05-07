import 'package:flutter/material.dart';
import 'package:http_restfullapi/models/user_model.dart';
import 'package:http_restfullapi/services/user_service.dart';

class HomePageStateFull extends StatefulWidget {
  const HomePageStateFull({super.key});

  @override
  State<HomePageStateFull> createState() => _HomePageStateFullState();
}

class _HomePageStateFullState extends State<HomePageStateFull> {
  List<User> users = [];
  bool isLoading = true;

  // methode utk mengambil data restfullapi
  void fetcUser() async {
    isLoading = true;
    final result = await UserService.fetchUsers();
    users = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetcUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Api StateFull')),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email),
                  ),
                );
              },
            ),
    );
  }
}
