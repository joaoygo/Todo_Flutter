import 'package:flutter/material.dart';
import 'package:prova_flutter/features/list_tasks/list_tasks_page.dart';
import 'package:prova_flutter/features/login/components/input_widget.dart';
import 'package:prova_flutter/shared/widgets/privacy_policy_widget.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  final LinearGradient colorGradiente = const LinearGradient(
      colors: [Color(0xff224E61), Color(0xff27978E)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: colorGradiente),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: MediaQuery.of(context).size.width * 0.1),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: InputWidget(
                        validator: (value) {
                          return value == null ||
                                  value.isEmpty ||
                                  value.endsWith(' ')
                              ? 'não valido'
                              : null;
                        },
                        title: 'Usuario',
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: InputWidget(
                      validator: (value) {
                        return value == null ||
                                value.isEmpty ||
                                value.endsWith(' ') ||
                                value.length < 2
                            ? 'não valido'
                            : null;
                      },
                      title: "Senha",
                      isPassword: true,
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListTasksPage()),
                        );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (Set<MaterialState> states) =>
                                const Color(0xff44BD6E))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
