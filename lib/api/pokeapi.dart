import 'package:pokemon_quiz_flutter/models/pokemon.dart';
import 'package:pokemon_quiz_flutter/utils/constants.dart';
import 'package:pokemon_quiz_flutter/utils/http.dart';

class PokeApi {
  static Future<List<Pokemon>> getPokemonList({
    int? limit, int? offset
  }) async {
    limit ??= 500;
    offset ??= 0;

    final String url = "$pokeApiUrl?limit=$limit&offset=$offset";
    final Map<String, dynamic> jsonData = await Http.getData(url);

    final List<Pokemon> pokemonList = [];

    for (Map<String, dynamic> result in jsonData['results']) {
      final Pokemon pokemon = Pokemon.fromJson(result);

      pokemonList.add(pokemon);
    }

    return pokemonList;
  }
}