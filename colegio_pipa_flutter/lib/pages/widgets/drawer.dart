import 'package:flutter/material.dart';

class DrawerNavigation extends StatelessWidget {
  // final String userName;
  // final String userPhotoUrl;
  // final String childName;
  // final String childSchoolGrade;

  // DrawerNavigation({
  //   required this.userName,
  //   required this.userPhotoUrl,
  //   required this.childName,
  //   required this.childSchoolGrade,
  // });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Olá, Ana'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://img.freepik.com/vetores-gratis/perfil-de-cabeca-de-mulher_24908-81681.jpg?t=st=1718754107~exp=1718757707~hmac=13e28d970de4042033bcdd1ca12c17f1948b4175764b9ed2422456565b21d72b&w=740'),
              ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          // ListTile(
          //   title: const Text('Lucas da Silva Barros'), // $childName'),
          //   onTap: () {},
          // ),
          // ListTile(
          //   title: const Text('Sala: Maternal 2'), // $childSchoolGrade'),
          //   onTap: () {},
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // lógica de logout aqui
            },
          ),
        ],
      ),
    );
  }
}
