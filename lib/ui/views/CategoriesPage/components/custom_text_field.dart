import 'package:flutter/material.dart';
import '../../../../core/utils/themes/custom_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required TextEditingController textEditingController,
    required ValueSetter<String> onChanged,
  })  : _textEditingController = textEditingController,
        _onChanged = onChanged,
        super(key: key);

  final TextEditingController _textEditingController;
  final ValueSetter<String> _onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      minLines: 6,
      maxLines: 6,
      maxLength: 200,
      cursorColor: secondaryColor,
      keyboardType: TextInputType.multiline,
      onChanged: (text) {
        _onChanged(text);
      },
      decoration: const InputDecoration(
        labelText: "Metin girin",
        labelStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, style: BorderStyle.solid, color: secondaryColor),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
              width: 2, style: BorderStyle.solid, color: primaryColor),
        ),
        filled: true,
        fillColor: mainAuxiliaryColor,
        hintText: 'Çevirmek istediğiniz metni girin',
        prefixIcon: Icon(
          Icons.hearing_outlined,
          color: primaryColor,
        ),
      ),
    );
  }
}
