import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_playground/pages/academico_page.dart';
import 'package:riverpod_playground/pages/widgets/loading_widget.dart';
import 'package:riverpod_playground/providers/category_provider.dart';

class CategoryHomePage extends ConsumerWidget {
  const CategoryHomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

var categories = ref.watch(categoriesProvider);

    return Center(child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(56),
                    bottomRight: Radius.circular(56),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 46.0, 0.0, 6.0),
                      child: Text(
                        'Olá, Ana!',
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 32, bottom: 16.0),
                  child: Text(
                    'Menu',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Flexible(
                child: categories.when(
                  data: (data) {
                    return GridView.builder(
                      itemCount: data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final category = data[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AcademicoPage(category: category),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 1,
                              child: Column(
                                children: [
                                  Expanded(
                                    // constraints: const BoxConstraints(maxHeight: 100, maxWidth: 10),
                                    child: Image.memory(
                                      base64Decode(category.image!),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      category.title!,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return Center(
                      child: Text(error.toString()),
                    );
                  },
                  loading: () => const LoadingWidget(),
                ),
              ),
            ],
          ),);
  }
}
