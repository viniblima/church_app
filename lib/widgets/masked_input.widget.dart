import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskedInput extends StatelessWidget {
  final TextEditingController textController;
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String>? validator;
  final TextInputType textInputType;
  final String label;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocus;

  const MaskedInput({
    Key? key,
    required this.formatter,
    required this.textController,
    this.validator,
    required this.textInputType,
    this.onChanged,
    this.onFocus,
    required this.label,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label),
        const SizedBox(
          height: 16,
        ),
        Focus(
          onFocusChange: onFocus,
          child: TextFormField(
            controller: textController,
            inputFormatters: [const UpperCaseTextFormatter(), formatter],
            autocorrect: false,
            keyboardType: textInputType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.black26,
                ),
              ),
              hintStyle: const TextStyle(
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UpperCaseTextFormatter implements TextInputFormatter {
  const UpperCaseTextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}
