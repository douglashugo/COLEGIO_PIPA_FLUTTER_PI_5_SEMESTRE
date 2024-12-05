import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_playground/pages/infoEscola.dart';
import 'package:riverpod_playground/pages/login.dart';
import 'package:riverpod_playground/pages/perfil/adm/perfilAdm.dart';

class DrawerNavigationAdm extends StatelessWidget {
  final Map<String, dynamic> userData;

  const DrawerNavigationAdm({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: userData['user']['image_profile'] != null
                  ? MemoryImage(
                      base64Decode(userData['user']['image_profile']),
                    )
                  : const AssetImage('assets/images/perfil-user.png') as ImageProvider,
            ),
            decoration: const BoxDecoration(color: Colors.deepOrange),
            accountName: Text(userData['user']['nome'] ?? 'Usuário'),
            accountEmail: Text(userData['user']['email'] ?? 'Email não disponível'),
          ),
          ListTile(
            leading: const Icon(
              Icons.account_circle,
              color: Colors.orange,
            ),
            title: const Text("Informações pessoais"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyProfilePageAdm(userData: userData),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.school,
              color: Colors.orange,
            ),
            title: const Text("Informações do Colégio"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InfoEscola(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.fiber_manual_record,
              color: Colors.orange,
            ),
            title: const Text("Alterar senha"),
            onTap: () async {
              await Navigator.of(context).pushNamed('/updatePassword');
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                    size: 32,
                  ),
                  title: const Text("Sair"),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
