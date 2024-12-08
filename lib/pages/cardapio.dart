import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class CardapioListScreen extends StatefulWidget {
  @override
  _CardapioListScreenState createState() => _CardapioListScreenState();
}

class _CardapioListScreenState extends State<CardapioListScreen> {
  List<dynamic> _cardapios = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCardapios();
  }

  // Função para buscar os cardápios da tabela
  Future<void> _fetchCardapios() async {
    try {
      final response = await Supabase.instance.client
          .from('cardapios')
          .select()
          .order('data_cardapio', ascending: false);

      setState(() {
        _cardapios = response;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Erro ao buscar cardápios: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao carregar cardápios: $e')),
      );
    }
  }

  Future<void> _downloadFile(String filePath, String fileName) async {
    try {
      // Verificar permissões de armazenamento no dispositivo
      final status = await Permission.manageExternalStorage.request();
      if (status.isGranted) {
        final url = filePath; // URL pública do arquivo

        // Baixar o arquivo a partir da URL pública
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          // Obter o diretório Downloads
          final downloadsDirectory = Directory('/storage/emulated/0/Download');

          // Garantir que o diretório existe
          if (!downloadsDirectory.existsSync()) {
            downloadsDirectory.createSync(recursive: true);
          }

          // Substituir caracteres inválidos no nome do arquivo
          final sanitizedFileName = fileName.replaceAll('/', '_');

          // Caminho completo do arquivo
          final file = File('${downloadsDirectory.path}/$sanitizedFileName');

          // Salvar o arquivo
          await file.writeAsBytes(response.bodyBytes);

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Download concluído em: ${file.path}'),
          ));
        } else {
          throw 'Falha ao baixar o arquivo: ${response.statusCode}';
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Permissão de armazenamento negada.')),
        );
      }
    } catch (e) {
      debugPrint('Erro ao baixar arquivo: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao baixar arquivo: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Cardápios'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cardapios.length,
              itemBuilder: (context, index) {
                final cardapio = _cardapios[index];
                final data = cardapio['data_cardapio'];
                final filePath = cardapio['file_path'];

                return Card(
                  child: ListTile(
                    title: Text('Cardápio - $data'),
                    trailing: IconButton(
                      icon: const Icon(Icons.download),
                      onPressed: () async =>
                          _downloadFile(filePath, 'cardapio_$data.pdf'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
