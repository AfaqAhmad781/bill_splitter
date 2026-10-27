// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final TextEditingController _billController = TextEditingController();

  double _tipPercentage = 15.0;
  int _personCount = 1;
  double _billAmount = 0.0;

  double get _tipAmount {
    return (_billAmount * _tipPercentage) / 100;
  }

  double get _totalBill {
    return _billAmount + _tipAmount;
  }

  double get _perPersonPay {
    if (_personCount <= 0) return 0.0;
    return _totalBill / _personCount;
  }

  @override
  void dispose() {
    _billController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                top: 8,
                right: 25,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Split and Tip',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4F75FF), Color(0xFF9A78FA)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'PER PERSON PAY',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Center(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Rs ${_perPersonPay.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.white24,
                            thickness: 3,
                            height: 20,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Bill',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 20,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Rs ${_totalBill.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white30,
                                  thickness: 3,
                                  width: 20,
                                  indent: 0, // Adds spacing at the top
                                  endIndent: 0, // Adds spacing at the bottom
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Tip',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 20,
                                        ),
                                      ),
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Rs ${_tipAmount.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _billController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    onChanged: ((value) {
                      setState(() {
                        _billAmount = double.tryParse(value) ?? 0.00;
                      });
                    }),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Bill Amount (Rs)',
                      hintText: 'Rs 0.00',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.purple.shade100,
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Color(0xFF6C5CE7),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Select Tip', style: TextStyle(fontSize: 25)),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tipPercentage = 10.0;
                              });
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: _tipPercentage == 10.0
                                    ? const Color(
                                        0xFF7C4DFF,
                                      )
                                    : const Color(0xFFEBECEF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF7C4DFF,
                                    ).withOpacity(0.35),
                                    blurRadius: 12,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '10%',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tipPercentage = 15.0;
                              });
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: _tipPercentage == 15.0
                                    ? const Color(
                                        0xFF7C4DFF,
                                      )
                                    : const Color(0xFFEBECEF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF7C4DFF,
                                    ).withOpacity(0.35),
                                    blurRadius: 12,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '15%',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tipPercentage = 20.0;
                              });
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: _tipPercentage == 20.0
                                    ? const Color(
                                        0xFF7C4DFF,
                                      )
                                    : const Color(0xFFEBECEF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF7C4DFF,
                                    ).withOpacity(0.35),
                                    blurRadius: 12,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '20%',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _tipPercentage = 25.0;
                              });
                            },
                            child: Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                color: _tipPercentage == 25.0
                                    ? const Color(
                                        0xFF7C4DFF,
                                      )
                                    : const Color(0xFFEBECEF),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFF7C4DFF,
                                    ).withOpacity(0.35),
                                    blurRadius: 12,
                                    spreadRadius: 0,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  '25%',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderThemeData(
                          showValueIndicator: ShowValueIndicator.always,
                          activeTrackColor: const Color(0xFF7C4DFF),
                          inactiveTrackColor: const Color(0xFFE0E2EC),
                          trackHeight: 4,
                          thumbColor: Colors.white,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 12,
                            elevation: 4,
                          ),
                          overlayColor: const Color(0xFF7C4DFF).withOpacity(0.12),
                        ),
                        child: Slider(
                          value: _tipPercentage,
                          min: 0,
                          max: 30,
                          label: '${_tipPercentage.round()}%',
                          onChanged: (newValue) {
                            setState(() {
                              _tipPercentage = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Split between',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (_personCount > 1) {
                                setState(() {
                                  _personCount--;
                                });
                              }
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF0EFFF),
                                border: Border.all(
                                  color: const Color(0xFFDCD7FF),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black87,
                                size: 24,
                              ),
                            ),
                          ),
                          const SizedBox(width: 36),
                          Column(
                            children: [
                              Text(
                                '$_personCount',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'people',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 36),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _personCount++;
                              });
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFFF0EFFF),
                                border: Border.all(
                                  color: const Color(0xFFDCD7FF),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black87,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
