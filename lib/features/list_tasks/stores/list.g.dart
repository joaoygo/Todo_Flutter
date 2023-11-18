// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$List on _List, Store {
  late final _$listCardAtom = Atom(name: '_List.listCard', context: context);

  @override
  ObservableList<String> get listCard {
    _$listCardAtom.reportRead();
    return super.listCard;
  }

  @override
  set listCard(ObservableList<String> value) {
    _$listCardAtom.reportWrite(value, super.listCard, () {
      super.listCard = value;
    });
  }

  late final _$_ListActionController =
      ActionController(name: '_List', context: context);

  @override
  void addCard(String txt) {
    final _$actionInfo =
        _$_ListActionController.startAction(name: '_List.addCard');
    try {
      return super.addCard(txt);
    } finally {
      _$_ListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listCard: ${listCard}
    ''';
  }
}
