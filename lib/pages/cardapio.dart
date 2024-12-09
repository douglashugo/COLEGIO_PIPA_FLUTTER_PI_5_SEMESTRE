import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show File, Directory, Platform;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

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
      final url = filePath; // URL pública do arquivo
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Identificar a plataforma
        if (kIsWeb) {
          // Lógica para Web
          final blob = html.Blob([response.bodyBytes]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.AnchorElement(href: url)
            ..target = 'blank'
            ..download = fileName
            ..click();
          html.Url.revokeObjectUrl(url);
        } else {
          // Lógica para Mobile/Outras Plataformas
          final status = await Permission.storage.request();
          if (status.isGranted) {
            Directory? downloadsDirectory;

            if (Platform.isAndroid) {
              downloadsDirectory = Directory('/storage/emulated/0/Download');
            } else if (Platform.isIOS) {
              downloadsDirectory = await getApplicationDocumentsDirectory();
            }

            if (downloadsDirectory != null && !downloadsDirectory.existsSync()) {
              downloadsDirectory.createSync(recursive: true);
            }

            // Substituir caracteres inválidos no nome do arquivo
            final sanitizedFileName = fileName.replaceAll('/', '_');
            final file = File('${downloadsDirectory!.path}/$sanitizedFileName');

            // Salvar o arquivo
            await file.writeAsBytes(response.bodyBytes);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Download concluído em: ${file.path}'),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Permissão de armazenamento negada.')),
            );
          }
        }
      } else {
        throw 'Falha ao baixar o arquivo: ${response.statusCode}';
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
