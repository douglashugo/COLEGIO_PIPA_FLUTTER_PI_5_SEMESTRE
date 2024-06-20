import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_playground/providers/dio_provider.dart';

import '../domain/quote_domain.dart';

part 'quotes_provider.g.dart';

@Riverpod(keepAlive: true)
class Quotes extends _$Quotes {
  @override
  List<QuoteDomain> build() {
    return [];
  }

  void add() async {
    var response = await ref.read(dioProvider).get('/random');
    if (response.statusCode != 200) {
      return;
    }
    var quote = QuoteDomain.fromMap(response.data);

    if (!state.contains(quote)) {
      state = [...state, quote];
    }
  }

  // Future<List<QuoteDomain>> fetch() async {
  //   var response = await ref.watch(dioProvider).get('/random');
  //   if (response.statusCode == 200) {
  //     return [for (final q in response.data) QuoteDomain.fromMap(q)];
  //   }
  //
  //   return [];
  // }
}
