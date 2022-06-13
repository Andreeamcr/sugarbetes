import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sugarbetes/components/glucose_table.dart';
import 'package:sugarbetes/utils/background_design.dart';
import 'package:sugarbetes/utils/constants.dart';
import 'package:sugarbetes/services/foodService.dart';

class FoodPage extends StatefulWidget {
  static String id = 'food';
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  Icon customIcon = const Icon(Icons.search);
  Icon customIconBack = const Icon(Icons.arrow_back);
  Widget customSearchBar = const Text(
    'Valori nutriţionale',
    style: kMathTextStyleBold,
  );
  bool isVisible = true;
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Map<String, double> getResult = {};
  bool isWaiting = false;
  bool isNotFound = false;
  Future<Widget?> getData(String userInput) async {
    isWaiting = true;
    try {
      var data = await FoodData().getFoodData(userInput);
      isWaiting = false;
      setState(() {
        getResult = data;
        isNotFound = false;
      });
    }
    catch(e){
      setState(() {
        getResult = {};
        isNotFound = true;
      });
      isWaiting = false;
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        BackgroundColorWidget(),
        Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: customSearchBar,
            centerTitle: true,
            leading: IconButton(
              icon: customIconBack,
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: customIcon,
                onPressed: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 28,
                        ),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: 'Căutaţi un aliment',
                            hintStyle: kMathTextStyleBold,
                            border: InputBorder.none,
                          ),
                          style: kMathTextStyleBold,
                          controller: myController,
                          onSubmitted: (value) {
                            getData(value);
                            isVisible = false;
                          },
                        ),
                      );
                    } else {
                      isVisible = true;
                      customIcon = const Icon(Icons.search);
                      customSearchBar = const Text(
                        'Valori nutriţionale',
                        style: kMathTextStyleBold,
                      );
                    }
                  });
                },
                padding: EdgeInsets.only(right: width * 0.05),
              ),
            ],
            backgroundColor: kFullNavyBlue,
          ),
          backgroundColor: Colors.transparent,
          body: ModalProgressHUD(
            inAsyncCall: isWaiting,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.2),
                        child: Container(
                          child: Text('Ce aliment doriți să căutați?', style: kWelcomeText,),
                        ),
                      ),
                    ),
                    visible: isVisible,
                  ),
                  Visibility(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.1),
                        child: Container(
                          child: SvgPicture.asset(
                            'assets/svg/food.svg',
                          ),
                          height: height * 0.3,
                          width: width * 0.6,
                        ),
                      ),
                    ),
                    visible: isVisible,
                  ),
                  //Text(myController.text + getResult.toString()),
                  Visibility(child: Padding(
                    padding: EdgeInsets.only(top: height* 0.10,
                    bottom: height * 0.02),
                    child: Center(child: Text(!isNotFound ? myController.text : "Alimentul nu a fost găsit", style: kWelcomeText,)),
                  ),
                    visible: !isVisible,
                  ),
                  Visibility(child: Padding(
                    padding: EdgeInsets.only(top: height * 0.10),
                    child: Image.asset("assets/images/notfound.png", height: height * 0.30,),
                  ),
                    visible: isNotFound && !isVisible,
                  ),
                  Visibility(
                    visible: !isVisible && !isNotFound,
                    child: ListView( children: [
                      _createDataTable()
                      // DataTable(
                      //   columns: [
                      //     DataColumn(label: Text('Nutrien )),
                      //     DataColumn(label: Text('coloana2')),
                      //   ],
                      //   rows: [DataRow(cells: [ DataCell(
                      //     Text('celula')),
                      //     DataCell(Text('abc'))]
                      //   ),],
                      // ),
    ],
                      shrinkWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

 DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
  }

 List<DataRow> _createRows() {
    if(getResult.isEmpty) {
      return List.empty();
    }

    return getResult.keys.map((key) =>
      DataRow(cells: [
        DataCell(Text(key)),
        DataCell(Text(getResult[key].toString()))
      ])
    ).toList();
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Nutrienți', style: kMathTextStyleBold,)),
      DataColumn(label: Text('Valori (100g)', style: kMathTextStyleBold,))
    ];
  }
}
