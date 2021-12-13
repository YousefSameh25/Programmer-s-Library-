import 'package:programer_library/UI/search.dart';
import 'package:programer_library/classes/pro_lan.dart';
import 'package:programer_library/data/prog_lang.dart';

// ignore: non_constant_identifier_names
List<pro_lan> searched_language = [];
// ignore: non_constant_identifier_names
void find_language() {
  searched_language.clear();
  for (int i = 0; i < languages_list.length; i++) {
    if (search_word.text.toLowerCase() ==
        languages_list[i].name.toLowerCase()) {
      searched_language.add(languages_list[i]);
      break;
    }
  }
}
