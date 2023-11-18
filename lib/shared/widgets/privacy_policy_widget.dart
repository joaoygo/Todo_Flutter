import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  final Uri _url = Uri.parse('https://www.google.com');

  PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(),
      child: const Text(
        'Política de privacidade',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _launchURL() async {
    try {
      await launchUrl(_url);
    } catch (e) {
      throw "$e $_url";
    }
    if (await launchUrl(_url)) {
    } else {
      throw 'Não foi possível abrir $_url';
    }
  }
}
