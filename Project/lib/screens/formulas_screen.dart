import 'package:flutter/material.dart';
import 'package:sugarbetes/components/math_card.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';

class MathFormulas extends StatefulWidget {

  @override
  _MathFormulasState createState() => _MathFormulasState();
}

class _MathFormulasState extends State<MathFormulas> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: kFullNavyBlue,
            title: Text("Formule de calcul",
            style: kMathTextStyleBold,),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                padding: EdgeInsets.only(right: width * 0.05),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(

              children: [
                MathTwoCardsGroup(label1: '''Necesarul caloric (NC): ''',
                    label2: ''' NC la bărbați = H(cm) - 100 x activitatea fizică (între 25 și 40)
  NC la femei = H(cm) - 105 x activitatea fizică''',
                    label3: '''Unde: ''', label4: '''Pentru bărbați se scade cu 100, iar pentru femei se scade cu 105, iar activitatea fizică poate avea următorile valori: 25 = repaus la pat, 30 = activitate ușoară, 35 = medie, 40 = intensă'''),
                MathTwoCardsGroup(label1: '''Doza totală de insulină (DTI): ''', label2: '''DTI = doza de insulină de la micul dejun + doza de la prânz + doza de la cină + doza de insulină bazală''', label3: '''De menționat: ''', label4: '''Se vor folosi dozele de insulină rapidă și cea de insulină bazală din ziua precedentă realizării calculului.'''),
                MathTwoCardsGroup(label1: ''' Rația insulină : carbohidrați 
                    (RI : HC)''', label2: '''RI : HC = 500/DTI''', label3: '''Unde: ''', label4: '''HC reprezintă numărul hidraților de carbon(Carbohidrați), iar DTI reprezintă Doza totală de insulină'''),
                MathTwoCardsGroup(label1: ''' Factorul de sensibilitate la 
                insulină(FS): ''', label2: '''FS = 1800/DTI''', label3: '''Unde: ''', label4: '''FS reprezintă factorul de sensibilitate la insulină, iar DTI reprezintă doza totală de insulină'''),
                MathTwoCardsGroup(label1: '''Factorul de corecție(FC): ''', label2: '''  FC = (Glicemia actuală - Glicemia țintă) / FS''', label3: '''Unde: ''', label4: '''Glicemia țintă reprezintă glicemia la care vrem să ajungem, iar FS reprezintă Factorul de sensibilitate'''),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
