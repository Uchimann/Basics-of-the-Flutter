import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulamam());
}

class Uygulamam extends StatefulWidget {
  const Uygulamam({super.key});

  @override
  State<Uygulamam> createState() => _UygulamamState();
}

class _UygulamamState extends State<Uygulamam> {
  int expression = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Roboto"),
      home: Scaffold(
        backgroundColor: Colors.limeAccent,
        body: Column(
          children: [
            ExpressionWidget(expression: expression, result: result),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [NumbersWidget()],
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: Center(
            child: Text(
              "Calculator",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 30, 82),
        ),
      ),
    );
  }
}

class ExpressionWidget extends StatelessWidget {
  const ExpressionWidget({
    super.key,
    required this.expression,
    required this.result,
  });

  final int expression;
  final int result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.right,
          expression.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.00,
          ),
        ),
        Text(
          textAlign: TextAlign.right,
          result.toString(),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.00,
          ),
        ),
      ],
    );
  }
}

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Line(
          textlist: ["7", "8", "9", "C", "AC"],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 141, 153, 174),
          ],
          textColorList: [Colors.black, const Color.fromARGB(255, 255, 0, 0)],
        ),
        SizedBox(height: 8),
        Line(
          textlist: ["4", "5", "6", "+", "-"],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 255, 179, 2),
          ],
          textColorList: [Colors.black, Colors.black],
        ),
        SizedBox(height: 8),
        Line(
          textlist: ["1", "2", "3", "*", "/"],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 255, 179, 2),
          ],
          textColorList: [Colors.black, Colors.black],
        ),
        SizedBox(height: 8),
        Line(
          textlist: ["0", ".", "00", "=", ""],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 255, 179, 2),
          ],
          textColorList: [Colors.black, Colors.black],
        ),
      ],
    );
  }
}

class Line extends StatelessWidget {
  const Line({
    super.key,
    required this.textlist,
    required this.backgroundColorList,
    required this.textColorList,
  });
  final List<String> textlist;
  final List<Color> backgroundColorList;
  final List<Color> textColorList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CalculatorButton(
            text: "${textlist[0]}",
            backgroundColor: backgroundColorList[0],
            textColor: textColorList[0],
          ),
        ),
        Expanded(
          child: CalculatorButton(
            text: "${textlist[1]}",
            backgroundColor: backgroundColorList[0],
            textColor: textColorList[0],
          ),
        ),
        Expanded(
          child: CalculatorButton(
            text: "${textlist[2]}",
            backgroundColor: backgroundColorList[0],
            textColor: textColorList[0],
          ),
        ),
        Expanded(
          child: CalculatorButton(
            text: "${textlist[3]}",
            backgroundColor: backgroundColorList[1],
            textColor: textColorList[1],
          ),
        ),
        Expanded(
          child: CalculatorButton(
            text: "${textlist[4]}",
            backgroundColor: backgroundColorList[1],
            textColor: textColorList[1],
          ),
        ),
      ],
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('buton pressed: $text'),
      onLongPress: () => print('sakin ol bro basılı tutma!'),
      child: Container(
        height: 60,
        constraints: BoxConstraints(minWidth: 0, maxWidth: double.infinity),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              color: textColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
