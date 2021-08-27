import 'package:flutter/material.dart';

class StateContador
{
  int _valor = 0;

  void inc(){
    print("inc");
    _valor++;
  }

  int get valor => _valor;

  bool diff(StateContador old) {
    return old._valor != _valor;
  }
}

// InheritedWidget: permite compartilhar um estado entre outros widgets da arvore de componentes
// IMPORTANTE: quando um provider é incovado em um widget, ele só fica visível para os elementos filhos.
class ProviderContador extends InheritedWidget
{
  final StateContador estado = StateContador();

  ProviderContador({required Widget child}) : super(child: child);

  static ProviderContador? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProviderContador>();
  }

  @override
  bool updateShouldNotify(covariant ProviderContador oldWidget) {
    // OBS: apenas notifica mudança quando o valor for alterado
    return oldWidget.estado.diff(estado);
  }
}
