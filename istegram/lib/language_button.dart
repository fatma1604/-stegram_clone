import 'package:flutter/material.dart';
import 'package:istegram/core/constant/IconTheme.dart';
import 'package:istegram/core/constant/text.dart';
import 'package:istegram/core/constant/text_them.dart';
import 'package:istegram/core/themes/color.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({super.key});

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  // Seçilen dillerin durumunu takip eden harita
  final Map<String, bool> _languages = {
    'English': false,
    'Español (Spanish)': false,
    'Français (French)': false,
    'Deutsch (German)': false,
    '中文 (Chinese - Mandarin)': false,
    'हिंदी (Hindi)': false,
    'العربية (Arabic)': false,
    'Português (Portuguese)': false,
    'Русский (Russian)': false,
    '日本語 (Japanese)': false,
    '한국어 (Korean)': false,
    'Italiano (Italian)': false,
    'Türkçe (Turkish)': false,
    'አማርኛ (Amharic)': false,
    'বাংলা (Bengali)': false,
    'فارسی (Persian)': false,
    'Українська (Ukrainian)': false,
    'Polski (Polish)': false,
    'Tiếng Việt (Vietnamese)': false,
    'ไทย (Thai)': false,
  };

  void showBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.pastelLavantar.withOpacity(0.05),
                AppColor.middleGradientColor,
                AppColor.middleGradientColor,
                AppColor.middleGradientColor,
                AppColor.mistyGreen.withOpacity(0.02),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColor.lihatgrey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const SizedBox(width: 20),
                   AppIconTheme.closeButton(context),
                    const SizedBox(width: 10),
                    Text(
                      AppText.chooslang,
                      style: AppTextTheme.textsStyla(
                          context), 
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Divider(
                  thickness: .5,
                  color: Colors.grey,
                ),
              
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: _languages.length,
                    itemBuilder: (context, index) {
                      String language = _languages.keys.elementAt(index);
                      return CheckboxListTile(
                        value: _languages[language],
                        onChanged: (bool? value) {
                          setState(() {
                            _languages[language] = value ?? false;
                          });
                        },
                        title: Text(language),
                        activeColor: AppColor.actionColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _languages.entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .join(', ') // Seçilen diller gösteriliyor
                        .isNotEmpty
                    ? _languages.entries
                        .where((entry) => entry.value)
                        .map((entry) => entry.key)
                        .join(', ')
                    : 'Türkçe',
                 style: AppTextTheme.bodyText(
                          context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
