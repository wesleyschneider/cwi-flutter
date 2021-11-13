import 'package:exercicio1/crypto_coin.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoHomePage extends StatelessWidget {
  final Color backgroundColor = const Color(0XFF413E65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Portfolio"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Container(
          color: backgroundColor,
          padding: const EdgeInsets.only(left: 19, right: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'BALANCE',
                      style: TextStyle(
                        color: Color(0X80FFFFFF),
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '\$103,463.59',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 41,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(children: [
                      Text(
                        '28.20%',
                        style: TextStyle(
                          color: Color(0XFF2AF598),
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'today',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Coins',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        CupertinoButton(
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Color(0XFF2AF598),
                              fontSize: 40,
                            ),
                          ),
                          onPressed: () {
                            // ignore: avoid_print
                            print('pressionado');
                          },
                        )
                      ],
                    ),
                    CryptoCoinView(
                      backgroundColor: const Color(0XFFF5317F),
                      name: 'Bitcoin',
                      raise: '6.20',
                      value: '6730.49',
                      abbreviation: 'BTC',
                    ),
                    CryptoCoinView(
                      backgroundColor: const Color(0XFF8739E5),
                      name: 'Ethereum',
                      raise: '18.05',
                      value: '490.26',
                      abbreviation: 'ETH',
                    ),
                    CryptoCoinView(
                      backgroundColor: const Color(0XFFE56336),
                      name: 'Litecoin',
                      raise: '51.80',
                      value: '130.31',
                      abbreviation: 'LTC',
                    ),
                    CryptoCoinView(
                      backgroundColor: const Color(0XFF7DBD28),
                      name: 'Ripple',
                      raise: '819k',
                      value: '0.49',
                      abbreviation: 'XRP',
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
