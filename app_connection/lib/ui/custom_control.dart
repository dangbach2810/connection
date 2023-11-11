import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required TextEditingController textController, 
    required this.hintText, 
    required this.obscureText,
  }) : _textController = textController;

  final TextEditingController _textController;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white)
        ),
        child: TextField(
          obscureText: obscureText,
          controller: _textController,
          decoration: InputDecoration(
            border: InputBorder.none, hintText: hintText),)
          ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.textButton,
  });
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(14)),
    child: Text(textButton,
    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.account_tree, size: 100, color: Colors.deepPurple[300],
    );
  }
}
class CustomSpiner extends StatelessWidget {
  const CustomSpiner({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      color: Colors.deepPurple.withOpacity(0.5),
      child: const Center(
        child: Image(width: 50,
          image: AssetImage('assets/images/loading.jpg'),
        ),
      ),
    );
  }
}
