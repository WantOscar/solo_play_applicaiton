import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';

class ResendEmailSection extends StatefulWidget {
  final String email;
  const ResendEmailSection({super.key, required this.email});

  @override
  State<ResendEmailSection> createState() => _ResendEmailSectionState();
}

class _ResendEmailSectionState extends State<ResendEmailSection> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: PrimaryTextField(
              controller: _controller,
            ),
          ),
        ),
        const SizedBox(width: 8),
        PrimaryButton(
          height: 50,
          onTap: () {
            /// 이메일 인증 재요청
            context
                .read<VerificationBloc>()
                .add(VerificationEmailSent(_controller.text));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 19.0),
            child: Text(
              '재전송',
              style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
