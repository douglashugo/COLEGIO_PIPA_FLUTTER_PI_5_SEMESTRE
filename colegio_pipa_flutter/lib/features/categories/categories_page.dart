import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 190,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
            color: Color.fromARGB(255, 21, 101, 192), // Cor azul
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 46.0, 0.0, 6.0),
            child: Text(
              'Olá, Ana!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white, // Definindo a cor do texto como branca
                  ),
            ),
          ),
        ),
        const SizedBox(height: 45),
        Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0.0),
          child: Text('Menu', style: Theme.of(context).textTheme.labelLarge),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'aviso.png', // substitua pelo caminho da sua imagem
                          fit: BoxFit
                              .cover, // ajusta a imagem para preencher o espaço disponível
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'Categoria $index',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
