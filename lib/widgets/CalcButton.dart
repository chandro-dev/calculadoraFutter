import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";

class CalcButton extends StatelessWidget {
  final Function callBack;
  final String textButton;
  final double testSize;
  const CalcButton(
      {super.key,
      required this.callBack,
      required this.textButton,
      required this.testSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () => {callBack(this.textButton)},
          style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 244, 47, 47),
              backgroundColor: Colors.amber,
              padding: const EdgeInsets.all(16),
              textStyle: const TextStyle(fontSize: 20)),
          child: Text(
            textButton,
            style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: testSize)),
          ),
        ),
      ),
    );
  }
}
