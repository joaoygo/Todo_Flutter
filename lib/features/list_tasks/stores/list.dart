import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'list.g.dart';

class List = _List with _$List;

abstract class _List with Store {
  late SharedPreferences _prefs;

  _List() {
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
    var cardSaveLocal = _prefs.getStringList('items');
    _prefs.getStringList('items') == null
        ? await _prefs.setStringList('items', <String>[])
        : cardSaveLocal?.forEach((element) {
            listCard.add(element);
          });
  }

  @observable
  ObservableList<String> listCard = ObservableList<String>();

  @action
  void addCard(String txt) async {
    listCard.add(txt);
    await _prefs.setStringList('items', listCard);
  }

  void removerCard(int index) async {
    listCard.remove(listCard[index]);
    await _prefs.setStringList('items', listCard);
  }
}
