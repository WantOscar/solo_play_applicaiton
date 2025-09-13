import 'package:flutter/material.dart';

class RegisterFlow extends StatelessWidget {
  final Widget child;
  const RegisterFlow({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        
      },
      child: Scaffold(
        appBar: AppBar(),
        body: child,
      ),
    );
  }
}
