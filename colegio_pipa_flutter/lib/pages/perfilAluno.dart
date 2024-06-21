import 'package:flutter/material.dart';

class KidProfile extends StatelessWidget {
  const KidProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do aluno'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       // Navegação para atualização de perfil (mantida como comentário para futuro uso)
        //       // Navigator.of(context).pushNamed('/updateProfile');
        //     },
        //     icon: const Icon(
        //       Icons.edit,
        //       color: Colors.white,
        //     ),
        //   ),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) {
            //return const Checkout();
         // }));
        },
        backgroundColor: Colors.orange,
        child: 
          const Icon(Icons.edit, color: Colors.white),
          
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
                    child: const CircleAvatar(  
                      
                        backgroundImage: NetworkImage('../../../assets/images/kid.png'),
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
                 
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
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
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          'Lucas Silva Barros',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
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
                  
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                         padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          'Turma',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                         padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
                        child: Text(
                          'Maternal 1',
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(thickness: 2),
                // Dias de trabalho
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
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.fiber_manual_record, size: 8),
                                    SizedBox(width: 1),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Data de nascimento: 02/03/2021'
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.fiber_manual_record, size: 8),
                                    SizedBox(width: 1),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Idade: 3 anos'
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.fiber_manual_record, size: 8),
                                    SizedBox(width: 1),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Nome do mãe: Flávio Romeiro Silva'
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.fiber_manual_record, size: 8),
                                    SizedBox(width: 1),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Nome do pai: José Roberto Barros'
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.fiber_manual_record, size: 8),
                                    SizedBox(width: 1),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Irmão: sem informações'
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.fiber_manual_record, size: 8),
                                    SizedBox(width: 1),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Saúde: sem informações'
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
