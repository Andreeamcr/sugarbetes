import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = 'd9e38c1599ce115813626fa94554890c';
const String appId = '39c0e654';
const String foodURL = 'https://api.edamam.com/api/food-database/v2/parser?app_id=$appId&app_key=$apiKey';

class FoodData {
  Future getFoodData(String userInput) async {
    Map <String, double> nutritionValues = {};
    String fullURL = '$foodURL&ingr=$userInput';
    http.Response response = await http.get(Uri.parse(fullURL));
    print(response.statusCode);
    if(response.statusCode == 200){
      try{
        var decodedData = jsonDecode(response.body);
        var energy = decodedData['parsed'][0]['food']['nutrients']['ENERC_KCAL'];
        var protein = decodedData['parsed'][0]['food']['nutrients']['PROCNT'];
        var fat = decodedData['parsed'][0]['food']['nutrients']['FAT'];
        var carb = decodedData['parsed'][0]['food']['nutrients']['CHOCDF'];
        var fiber = decodedData['parsed'][0]['food']['nutrients']['FIBTG'];

        nutritionValues['Valoare energetică'] = energy;
        nutritionValues['Proteine'] = protein;
        nutritionValues['Grăsimi'] = fat;
        nutritionValues['Carbohidrați'] = carb;
        nutritionValues['Fibre'] = fiber;
        print(nutritionValues);
      }
      catch(e){
        throw 'Can\'t find the element';
      }
    }
    else{
      print(response.statusCode);
      throw 'Problem with the get request';
    }
    return nutritionValues;
  }
}
