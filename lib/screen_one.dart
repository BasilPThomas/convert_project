import 'package:convert_project/widget/currency_convert.dart';
import 'package:flutter/material.dart';
import 'functions/fetching_data.dart';
import 'model/ratemodel.dart';


class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  TextEditingController amountController = TextEditingController();
  TextEditingController convertController = TextEditingController();
  late Future<RatesModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
      allcurrencies = fetchcurrencies();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    color: const Color(0xFF37517E),
                  ),
                ],
              ),
              Positioned(
                top: 350,
                left: 15,
                right: 15,
                child: Column(
                  children: [
                    const Text(
                      "Currency Converter",
                      style: TextStyle(color: Colors.white,fontSize: 20),),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black38,
                                offset: Offset(2, 4),
                                blurRadius: 5,
                                spreadRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xfff3f3f4), Color(0xfff3f3f4)]
                          )
                      ),
                      // height: 300,
                      width: MediaQuery.of(context).size.width,
                      child:  Form(
                        key: formkey,
                        child: FutureBuilder<RatesModel>(
                          future: result,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            return Center(
                              child: FutureBuilder<Map>(
                                  future: allcurrencies,
                                  builder: (context, currSnapshot) {
                                    if (currSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    }
                                    return CurrencyConvert(
                                      currencies: currSnapshot.data!,
                                      rates: snapshot.data!.rates,
                                    );
                                  }),
                            );
                          },
                        ),
                      )

                      ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}