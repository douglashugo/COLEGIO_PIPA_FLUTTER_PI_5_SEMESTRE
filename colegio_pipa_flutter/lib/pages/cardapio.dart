import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_playground/pages/widgets/buttonNavigation.dart';
import 'package:riverpod_playground/pages/widgets/drawerUser.dart';
import 'package:intl/intl.dart';


class Cardapio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cardápios'),
      ),
      body: ListView.builder(
        itemCount: 10, // Número de itens na lista
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.restaurant_menu),
                iconColor: Colors.orange,
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Cardápio da semana',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: const Text(
                  'Data: 17/06/2024',
                  style: const TextStyle(fontSize: 12),
                ),
                onTap: () {
                  // Ação ao clicar no item (não implementada)
                },
              ),
            ),
          );
        },
      ),
      endDrawer: Drawer(),
      
    );
  }
}