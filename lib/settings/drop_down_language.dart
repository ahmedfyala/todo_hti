import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../provider/app_provider.dart';

class DropDownLang extends StatefulWidget {
  const DropDownLang({super.key});

  @override
  State<DropDownLang> createState() => _DropDownLangState();
}

String selectedValue = 'en';

class _DropDownLangState extends State<DropDownLang> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
        value: 'en',
        child: Text("English"),
      ),
      const DropdownMenuItem(value: 'ar', child: Text("اللغه العربيه")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return DropdownButtonFormField(
        value: provider.AppLanguage,
        onChanged: (String? newValue) {
          provider.changeLanguage(
              newValue!); // Call the provider method to change language
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 4),
            borderRadius: BorderRadius.circular(16),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(16),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        dropdownColor: tdBlue,
        items: dropdownItems);
  }
}
