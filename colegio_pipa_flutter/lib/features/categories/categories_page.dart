import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Olá, Ana!',
              style: Theme.of(context).textTheme.displayMedium),
        ),
        const SizedBox(height: 75),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Menu', style: Theme.of(context).textTheme.labelMedium),
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
              itemCount: 20,
              itemBuilder: (context, index) {
                return Card(
                  child: Text('Categoria $index'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
