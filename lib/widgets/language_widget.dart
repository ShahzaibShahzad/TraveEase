import 'package:flutter/material.dart';
import 'package:travel_book/extras/colors.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    required this.language,
    required this.selected,
    required this.onSelect,
    Key? key}) : super(key: key);

  final String language, selected;
  final Function(String) onSelect;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      onTap: (){
        onSelect(language);
      },
      leading: Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
          Border.all(width: 1, color: selected == language ? CColors.primary : CColors.grey2),
        ),
        child: Icon(  selected != language ? null: Icons.check,
          color: CColors.primary,size: 15,
        ),
      ),
      title: Text(language),
    );
  }
}
