import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompTextFormField extends StatelessWidget
{
  // Atributos:
  TextInputType inputType;
  Color inputColor;
  double inputSize;
  bool inputObscure;
  int inputMaxLength;
  TextEditingController inputController;
  FormFieldValidator<String>? inputValidator;
  TextInputAction inputAction;
  FocusNode? inputActionNext;
  FocusNode? inputFocusNode;
  Function()? inputActionSubmit;
  List<TextInputFormatter>? inputListFormatter;

  String labelText;
  Color labelColor;
  double labelSize;

  String hintText;
  Color hintColor;
  double hintSize;

  /*
    Construtor:
    argum. obrigatório: na chamada, não preciso informar nome do argumento
    argum. opcional:
           * ficam entre chaves { ... }
           * na chamada, preciso informar o nome do argumento
  */
  CompTextFormField(
      this.labelText,
      this.hintText,
      this.inputController,
      {
        this.labelColor=Colors.grey,
        this.labelSize=22,

        this.inputType=TextInputType.text,
        this.inputColor=Colors.black87,
        this.inputSize=20,
        this.inputMaxLength=50,
        this.inputObscure=false,
        this.inputValidator,
        this.inputAction=TextInputAction.next,
        this.inputActionNext,
        this.inputActionSubmit,
        this.inputFocusNode,
        this.inputListFormatter,

        this.hintColor=Colors.black54,
        this.hintSize=18
      }
  );


  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      maxLength: inputMaxLength,
      controller: inputController,
      validator: inputValidator,
      obscureText: inputObscure,
      keyboardType: inputType,
      textInputAction: inputAction,
      focusNode: inputFocusNode,

      inputFormatters: inputListFormatter,

      // OBS: permite definir diferentes regras para cada tipo de action
      onFieldSubmitted: (String text) {
        if (inputActionNext != null) {
          FocusScope.of(context).requestFocus(inputFocusNode);
        }
        else if(inputActionSubmit != null) {
          // Atenção: precisa estar neste padrão!
          inputActionSubmit!();
        }
      },

      style: TextStyle(
        color: inputColor,
        fontSize: inputSize
      ),

      // OBS: border: por padrão é UnderlineInputBorder
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
          fontSize: labelSize
        ),

        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: hintSize
        )
      ),
    );
  }
}
