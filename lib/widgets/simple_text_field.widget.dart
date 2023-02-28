import 'package:flutter/material.dart';

import '../controllers/config.controller.dart';

class SimpleTextField extends StatefulWidget {
  final TextEditingController textController;
  final FormFieldValidator<String>? validator;
  final String label;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;

  const SimpleTextField({
    Key? key,
    required this.textController,
    this.validator,
    required this.textInputType,
    required this.label,
    this.suffixIcon,
    this.preffixIcon,
    this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1.0,
          color: Config.colors[ColorVariables.inputBackground]!,
        ),
        boxShadow: focused
            ? [
                BoxShadow(
                  color: Config.colors[ColorVariables.boxShadow]!,
                  spreadRadius: 0.2,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            : [],
        color: Config.colors[ColorVariables.white]!,
      ),
      duration: const Duration(
        milliseconds: 300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              widget.label,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
/*           const SizedBox(
            height: 4,
          ), */
          Focus(
            onFocusChange: (bool value) {
              setState(() {
                focused = value;
              });
            },
            child: TextFormField(
              obscureText: widget.obscureText,
              controller: widget.textController,
              //inputFormatters: [const UpperCaseTextFormatter(), formatter],
              autocorrect: false,
              keyboardType: widget.textInputType,
              //autovalidateMode: AutovalidateMode.disabled,
              validator: widget.validator,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  bottom: 0.0,
                  top: 0.0,
                  left: 15.0,
                ),
                prefix: const Padding(
                  padding: EdgeInsets.only(top: 0),
                ),
                prefixIcon: widget.preffixIcon,
                suffixIcon: widget.suffixIcon,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintStyle: const TextStyle(
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
