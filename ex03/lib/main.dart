import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Uygulamam());
}

class Uygulamam extends StatefulWidget {
  const Uygulamam({super.key});

  @override
  State<Uygulamam> createState() => _UygulamamState();
}

class _UygulamamState extends State<Uygulamam> {
  String expression = "";
  String result = "0";
  void calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();

      // Eğer sonuç tam sayıysa .0 kaldır
      if (eval == eval.roundToDouble()) {
        result = eval.toInt().toString();
      }
    } catch (e) {
      result = "Error";
    }
    setState(() {});
  }

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "AC") {
        expression = "";
        result = "0";
      } else if (buttonText == "C") {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (buttonText == "=") {
        calculate();
      } else {
        expression += buttonText;
      }
    });
  }

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
                children: [NumbersWidget(onButtonPressed: buttonPressed)],
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

  final String expression;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            expression.isEmpty ? "0" : expression,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 10),
          Text(
            result,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}

class NumbersWidget extends StatelessWidget {
  final Function(String) onButtonPressed;

  const NumbersWidget({super.key, required this.onButtonPressed});

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
          onButtonPressed: onButtonPressed,
        ),
        SizedBox(height: 8),
        Line(
          textlist: ["4", "5", "6", "+", "-"],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 255, 179, 2),
          ],
          textColorList: [Colors.black, Colors.black],
          onButtonPressed: onButtonPressed,
        ),
        SizedBox(height: 8),
        Line(
          textlist: ["1", "2", "3", "*", "/"],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 255, 179, 2),
          ],
          textColorList: [Colors.black, Colors.black],
          onButtonPressed: onButtonPressed,
        ),
        SizedBox(height: 8),
        Line(
          textlist: ["0", ".", "00", "=", ""],
          backgroundColorList: [
            Colors.grey[300]!,
            const Color.fromARGB(255, 255, 179, 2),
          ],
          textColorList: [Colors.black, Colors.black],
          onButtonPressed: onButtonPressed,
        ),
      ],
    );
  }
}

class Line extends StatelessWidget {
  final List<String> textlist;
  final List<Color> backgroundColorList;
  final List<Color> textColorList;
  final Function(String) onButtonPressed;

  const Line({
    super.key,
    required this.textlist,
    required this.backgroundColorList,
    required this.textColorList,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < textlist.length; i++)
          Expanded(
            child: CalculatorButton(
              text: textlist[i],
              backgroundColor: i < 3 ? backgroundColorList[0] : backgroundColorList[1],
              textColor: i < 3 ? textColorList[0] : textColorList[1],
              onPressed: () => onButtonPressed(textlist[i]),
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
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
