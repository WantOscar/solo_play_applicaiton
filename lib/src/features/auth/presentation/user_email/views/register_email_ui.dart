import 'package:flutter/material.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';

class RegisterEmailUI extends StatelessWidget {
  const RegisterEmailUI({super.key});

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
                                  RegisterEmailHeader(),
                                  SizedBox(
                                    height: 48,
                                  ),
                                  RegisterEmailInputTextField(),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  RegisterEmailValidateTextView(),
                                ],
                              ),
                            ),
                            const RegisterEmailButtonView(),
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
