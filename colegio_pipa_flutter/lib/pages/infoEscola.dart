import 'package:flutter/material.dart';

class InfoEscola extends StatelessWidget {
  const InfoEscola({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seu perfil'),
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
                      
                        backgroundImage: NetworkImage('../../../assets/images/logo-pipa.png'),
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
                          'Endereço',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 3),
                        child: Text(
                          'R. Maria Marta Nunes, 101 - Jardim Nossa Senhora de Fátima | Araras - SP ',
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 14,
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
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contatos',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
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
                                        'WhatsApp: (19) 97815-8099',
                                        style: TextStyle(fontSize: 18,)
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
                                        'Instagram: @colegiopipa',
                                        style: TextStyle(fontSize: 18,)
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
                                        'Youtube: @Colegiopipa',
                                        style: TextStyle(fontSize: 18,)
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
                // Dias de trabalho
                Container(
                  width: 350,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(10),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Informações do Corpo Docente',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
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
                                        'Diretoria: Jéssica Lopes',
                                        style: TextStyle(fontSize: 18,)
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
                                        'Vice: Helena Cardoso',
                                        style: TextStyle(fontSize: 18,)
                                        
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
                                        'Coordenação: Débora Ramires',
                                        style: TextStyle(fontSize: 18,)
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
