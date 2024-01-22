import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double result = 0;

  final TextEditingController currencyTextFieldController =
      TextEditingController();

  currencyConverter() {
    result = double.parse((double.parse(currencyTextFieldController.text) * 280)
        .toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent.shade200,
          title: Center(
            child: Text(
              "Currency Converter",
              style: TextStyle(
                  color: Colors.grey.shade100,
                  fontSize: 32,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        body: Container(
          color: Colors.indigoAccent.shade200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                  child: Text(
                    "PKR ${result == 0.0 ? 0 : result}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
                  child: TextField(
                    controller: currencyTextFieldController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.grey.shade100,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.shade100)),
                        hintText: "Enter in USD",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade100,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 14),
                  child: ElevatedButton(
                      onPressed: () {
                        currencyConverter();
                        setState(() {});
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: Text(
                        "Convert",
                        style: TextStyle(color: Colors.indigoAccent.shade200),
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
