import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/features/list_tasks/components/card_widget.dart';

import 'package:prova_flutter/features/list_tasks/stores/list.dart';
import 'package:prova_flutter/shared/widgets/privacy_policy_widget.dart';

final listTasks = List();

class ListTasksPage extends StatefulWidget {
  const ListTasksPage({super.key});

  @override
  State<ListTasksPage> createState() => _ListTasksPageState();
}

class _ListTasksPageState extends State<ListTasksPage> {
  final LinearGradient colorGradiente = const LinearGradient(
      colors: [Color(0xff224E61), Color(0xff27978E)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  final _textEditingController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: colorGradiente),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Observer(
                    builder: (_) => Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.1,
                          bottom: 50),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          itemCount: listTasks.listCard.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              CardWidget(
                                  text: listTasks.listCard[index],
                                  onTapDelete: () =>
                                      listTasks.removerCard(index),
                                  onTapEdit: () {
                                    _textEditingController.text =
                                        listTasks.listCard[index];
                                    listTasks.removerCard(index);
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                child: Divider(
                                  height: 0.1,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Form(
                    onWillPop: () async {
                      _focusNode.unfocus();
                      return true;
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        decoration: const InputDecoration(
                          hintText: 'Digite seu texto',
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                        onFieldSubmitted: (_) {
                          // Chamado quando o campo de texto é submetido
                          if (_textEditingController.text.isNotEmpty) {
                            listTasks.addCard(_textEditingController.text);
                            _textEditingController.text = '';
                          }
                        },
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xff27978E)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrivacyPolicyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
