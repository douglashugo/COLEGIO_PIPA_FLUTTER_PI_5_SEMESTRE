import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_providers.g.dart';

final titleProvider = Provider((ref) => 'Riverpod 2 Play');

final counterProvider = StateProvider<int>((ref) => 0);

final themeSwitchProvider = StateProvider((ref) {
  return true;
});

final dioProvider = Provider(
  (ref) => Dio(
    BaseOptions(baseUrl: 'https://dummyjson.com/quotes'),
  ),
);

@Riverpod(keepAlive: true)
SupabaseClient supabaseClient(SupabaseClientRef ref) {
  return Supabase.instance.client;
}
