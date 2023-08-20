import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/colors.dart';
import '../provider/app_provider.dart';

class DropDownTheme extends StatefulWidget {
  const DropDownTheme({super.key});

  @override
  State<DropDownTheme> createState() => _DropDownThemeState();
}

String selectedValue = 'en';

class _DropDownThemeState extends State<DropDownTheme> {
  List<DropdownMenuItem<ThemeMode>> get dropdownItems {
    List<DropdownMenuItem<ThemeMode>> menuItems = [
      DropdownMenuItem(
          value: ThemeMode.light,
          child: Text(AppLocalizations.of(context)!.light)),
      DropdownMenuItem(
          value: ThemeMode.dark,
          child: Text(AppLocalizations.of(context)!.dark)),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return DropdownButtonFormField(
        value: provider.themeMode,
        onChanged: (ThemeMode? newValue) {
          provider.changeTheme(
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
