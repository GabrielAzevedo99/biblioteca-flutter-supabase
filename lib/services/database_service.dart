import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseService {
  final _supabase = Supabase.instance.client;

  // Ler (Read) todos os livros
  Future<List> getItems() async {
    final data = await _supabase
        .from('livros')
        .select()
        .order('created_at', ascending: false);
    return data;
  }

  // Criar (Create) um novo livro
  Future<void> addItem(String titulo, String autor, int? ano) async {
    final userId = _supabase.auth.currentUser!.id;
    await _supabase.from('livros').insert({
      'titulo': titulo,
      'autor': autor,
      'ano': ano,
      'user_id': userId,
    });
  }

  // Atualizar (Update)
  Future<void> updateItem(int id, String titulo, String autor, int? ano) async {
    await _supabase.from('livros').update({
      'titulo': titulo,
      'autor': autor,
      'ano': ano,
    }).eq('id', id);
  }

  // Deletar (Delete)
  Future<void> deleteItem(int id) async {
    await _supabase.from('livros').delete().eq('id', id);
  }
}