import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

enum PeriodoEstudo {manha, tarde, noite, madrugada}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

PeriodoEstudo? _melhorPeriodo = PeriodoEstudo.manha;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz"),backgroundColor: Colors.green,),
        
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text("Na sua opinião, qual o melhor horário de estudo?"),


              RadioGroup<PeriodoEstudo>(
                groupValue: _melhorPeriodo,
                onChanged: (PeriodoEstudo? value) {
                  setState(() {
                    _melhorPeriodo = value;
                    print("Periodo escolhido: ${_melhorPeriodo}");
                  });
                },
                child: Column(
                  children: [
                    RadioListTile<PeriodoEstudo>(
              title: Text("Manhã"),
              value: PeriodoEstudo.manha,
              subtitle: Text("Ao acordar me sinto mais disposto."),),
              RadioListTile<PeriodoEstudo>(
              title: Text("Tarde"),
              value: PeriodoEstudo.tarde,
            subtitle: Text("Após o almoço é a melhor escolha."),),
              RadioListTile<PeriodoEstudo>(
              title: Text("Noite"),
              value: PeriodoEstudo.noite,
              subtitle: Text("Na noite meu rendimento aumenta."),),
            RadioListTile<PeriodoEstudo>(
              title: Text("Madrugada"),
              value: PeriodoEstudo.madrugada,
              subtitle: Text("A calma da madrugada é a melhor hora para pensar"),
              ),
              ],
              ),  
              ),
                  ElevatedButton(onPressed:(){
                    print("Valor selecionado: ${_melhorPeriodo}");
                    switch (_melhorPeriodo) {
                      case PeriodoEstudo.manha:
                      print("Ao acordar é melhor mesmo.");

                      case PeriodoEstudo.tarde:
                      print("Depois do almoço é preferível.");

                      case PeriodoEstudo.noite:
                      print("Só se for assistindo novela.");

                      case PeriodoEstudo.madrugada:
                      print("Na calada da noite é mais tranquilo.");
                      default: print("ERRO!");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric( vertical: 5, horizontal:  100),
                  ),
                  child: Text("Go!"),
                  )         
            ],
          ),
        ),
      ),
    );
  }
}
