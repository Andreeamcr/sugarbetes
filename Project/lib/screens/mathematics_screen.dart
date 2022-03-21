import 'package:flutter/material.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/components/math_card.dart';

class MathPage extends StatefulWidget {
  @override
  _MathPageState createState() => _MathPageState();
}

class _MathPageState extends State<MathPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Matematica insulinei",
              style: kMathTextStyleBold,
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: kFullNavyBlue,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MathTwoCardsGroup(
                  label1: '''Necesarul tău caloric/zi (NC): ''',
                  label2: "1800kcal",
                  label3: '''   Ce este necesarul caloric (NC)? ''',
                  label4:
                      '''Reprezintă numărul de calorii necesar pentru o persoană în scopul menţinerii sau pierderii în greutate.''',
                ),
                MathTwoCardsGroup(
                  label1: "Doza ta totală de insulină/zi(DTI): ",
                  label2: "40u",
                  label3: '''Ce reprezintă Doza totală de insulină(DTI)?''',
                  label4:
                      '''DTI reprezintă suma totală a dozelor de insulină rapidă administrate înainte de mesele principale și de insulină lentă din ziua precedentă''',
                ),
                MathTwoCardsGroup(
                  label1: '''Raţia insulină : carbohidraţi: ''',
                  label2: "12.5gr HC",
                  label3: '''Ce reprezintă raţia insulină : carbohidraţi?''',
                  label4:
                      '''Raţia insulină : carbohidrați ne spune câți carbohidrați pot fi neutralizaţi de 1 unitate de insulină''',
                ),
                MathTwoCardsGroup(
                  label1: '''Factorul tău de sensibilitate la 
                        insulină: ''',
                  label2: "1u de insulină : 45 mg/dl",
                  label3: '''Ce este factorul de sensibilitate la insulină? ''',
                  label4:
                      '''Factorul de sensibilitate ne spune cât de sensibili suntețm la acțiunea insulinei. Mai exact, ne arată cu cât scade glicemia 1 unitate de insulină rapidă.''',
                ),
                MathTwoCardsGroup(
                  label1: '''Factorul de corecţie ''',
                  label2: "",
                  label3: '''Ce este factorul de corecţie? ''',
                  label4:
                      '''Factorul de corecţie ne ajută să calculăm cantitatea de insulină ce trebuie făcută în plus la o masă în cazul glicemiilor mari.''',
                ),
                Padding(
                  padding: EdgeInsets.all(height * 0.05),
                  child: InkWell(
                    child: Text(
                      "Vezi formulele de calcul folosite",
                      style: kHyperlinkTextStyle,
                    ),
                    onTap: () => print("Here i will navigate to formulas page"),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
