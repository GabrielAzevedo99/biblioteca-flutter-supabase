import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final _supabase = Supabase.instance.client;

  // Buscar itens/livros
  Future<List> getItems() async {
    final response =
        await _supabase.from('livros').select().order('id', ascending: false);
    return List.from(response);
  }

  // Adicionar item/livro com o código
  Future<void> addItem(
    String titulo,
    String autor,
    int? ano,
    String codigo,
  ) async {
    await _supabase.from('livros').insert({
      'titulo': titulo,
      'autor': autor,
      'ano': ano,
      'codigo': codigo,
    });
  }

  // Atualizar item/livro
  Future<void> updateItem(
    int id,
    String titulo,
    String autor,
    int? ano,
    String codigo,
  ) async {
    await _supabase.from('livros').update({
      'titulo': titulo,
      'autor': autor,
      'ano': ano,
      'codigo': codigo,
    }).eq('id', id);
  }

  // Deletar item/livro
  Future<void> deleteItem(int id) async {
    await _supabase.from('livros').delete().eq('id', id);
  }
}
