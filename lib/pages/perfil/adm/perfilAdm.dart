import 'dart:convert';
import 'package:flutter/material.dart';

class MyProfilePageAdm extends StatefulWidget {
  final Map<String, dynamic> userData;

  const MyProfilePageAdm({super.key, required this.userData});

  @override
  _MyProfilePageAdmState createState() => _MyProfilePageAdmState();
}

class _MyProfilePageAdmState extends State<MyProfilePageAdm> {
  late Map<String, dynamic> userData;

  @override
  void initState() {
    super.initState();
    // Inicializa os dados do usuário
    userData = widget.userData;
  }

  @override
  Widget build(BuildContext context) {
    // Recupera a imagem base64 do banco de dados
    final String? imageBase64 = userData['user']['image_profile'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Foto de perfil
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: Container(
                    width: 200,
                    height: 180,
                    child: CircleAvatar(
                      backgroundImage: imageBase64 != null
                          ? MemoryImage(base64Decode(imageBase64))
                          : const AssetImage('assets/images/perfil-user.png')
                              as ImageProvider,
                    ),
                  ),
                ),
                const Divider(thickness: 2),
                // Nome
                Container(
                  width: 350,
                  height: 80,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          'Nome',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          userData['user']['nome'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                // E-mail
                Container(
                  width: 350,
                  height: 80,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          userData['user']['email'] ?? '',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                // Informações
                Container(
                  width: 350,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informações',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.fiber_manual_record, size: 8),
                                    const SizedBox(width: 1),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '${userData['user']['endereco']?['rua'] ?? ''} - '
                                        '${userData['user']['endereco']?['numero'] ?? ''} - '
                                        '${userData['user']['endereco']?['bairro'] ?? ''}',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.fiber_manual_record, size: 8),
                                    const SizedBox(width: 1),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Contato | WhatsApp: ${userData['user']['telefone'] ?? ''}',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
