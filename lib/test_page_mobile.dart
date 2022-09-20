import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_test_page/widgets/button.dart';
import 'package:responsive_test_page/widgets/display_list_layout_mobile.dart';
import 'package:responsive_test_page/widgets/slider_options.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;

  static const List<DisplayListLayout> displayList = [
    DisplayListLayout(
      header: 'Drei einfache Schritte \nzur Vermittlung neuer Mitarbeiter',
      images: ['assets/1_1.svg', 'assets/1_2.svg', 'assets/1_3.svg'],
      texts: [
        'Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        'Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        'Vermittlung nach \nProvision oder Stundenlohn'
      ],
    ),
    DisplayListLayout(
      header: 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
      images: ['assets/2_1.svg', 'assets/2_2.svg', 'assets/2_3.svg'],
      texts: [
        'Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        'Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        'Vermittlung nach \nProvision oder Stundenlohn'
      ],
    ),
    DisplayListLayout(
      header: 'Drei einfache Schritte zur Vermittlung neuer Mitarbeiter',
      images: ['assets/3_1.svg', 'assets/3_2.svg', 'assets/3_3.svg'],
      texts: [
        'Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        'Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        'Vermittlung nach \nProvision oder Stundenlohn'
      ],
    )
  ];

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 70,
      leadingWidth: 0,
      automaticallyImplyLeading: false,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(
              color: Color(0XFF319795),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0XFF00000029),
                blurRadius: 3,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: const Button(),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFFEBF4FF),
                        Color(0XFFE6FFFA),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 18),
                      const Text(
                        'Deine Job \nwebsite',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SvgPicture.asset(
                        'assets/undraw_agreement_aajr.svg',
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Flexible(
                fit: FlexFit.loose,
                child: SliderOptions(
                  onPressed: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                ),
              ),
              displayList[index],
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
