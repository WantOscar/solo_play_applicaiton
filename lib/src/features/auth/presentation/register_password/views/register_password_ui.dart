import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/sections/sections.dart';

class RegisterPasswordUI extends StatelessWidget {
  const RegisterPasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: SafeArea(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: SafeArea(
                      bottom: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 62.0, horizontal: 16.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  RegisterPasswordHeader(),
                                  SizedBox(height: 48),
                                  RegisterPasswordInputTextField(),
                                  SizedBox(height: 4),
                                ],
                              ),
                            ),
                            const RegisterPasswordButtonView(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
