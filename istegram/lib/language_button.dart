// LanguageButton sınıfı
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Language"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: const Text("English"),
                  onTap: () {
                    _changeLanguage(context, 'en');
                  },
                ),
                ListTile(
                  title: const Text("Türkçe"),
                  onTap: () {
                    _changeLanguage(context, 'tr');
                  },
                ),
                ListTile(
                  title: const Text("Español"),
                  onTap: () {
                    _changeLanguage(context, 'es');
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _changeLanguage(BuildContext context, String languageCode) {
    // Dil değiştirme işlemi yapılabilir
    print("Dil değiştirildi: $languageCode");
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _showLanguageDialog(context);
      },
      child: Center(
          child: const Text(
        "Change Language",
        style: TextStyle(
          color: Colors.white,
        ),
      )),
    );
  }
}
