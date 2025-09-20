import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';

import '../bloc/bloc.dart';
import '../sections/sections.dart';

/// 회원가입 Flow - 1
///
/// 사용자 이용약관 동의 UI
/// 사용자가 필수적인 이용약관을 동의해야 다음 스텝으로 넘어갈 수 있게 버튼이 활성화됩니다.
class UserAgreementUI extends StatelessWidget {
  const UserAgreementUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 62.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 상단 타이틀 섹션영역
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAgreementUiTitleSection(),
                SizedBox(
                  height: 37,
                ),
                //
                BlocBuilder<UserAgreementBloc, UserAgreementState>(
                  builder: (context, state) {
                    final bloc = context.read<UserAgreementBloc>();
                    final agreement = state.agreement;
                    return UserAgreementUiTermsSection(
                      isAllAgree: agreement.isAllAgree,
                      isOver14: agreement.isOver14,
                      isAgreedToTerms: agreement.isAgreedToTerms,
                      isAgreedToMarketing: agreement.isAgreedToMarketing,
                      isConsentedToAds: agreement.isConsentedToAds,
                      onIsAllagreeTap: () => bloc.add(UserAgreementAllAgree()),
                      onIsOver14Tap: () => bloc.add(
                          UserAgreementIsOver14Toggled(
                              isAgree: !agreement.isOver14)),
                      onIsAgreedToTermsTap: () => bloc.add(
                          UserAgreementIsAgreedToTermsTogged(
                              isAgree: !agreement.isAgreedToTerms)),
                      onIsAgreedToMarketingTap: () => bloc.add(
                          UserAgreementIsAgreedToMarketingToggled(
                              isAgree: !agreement.isAgreedToMarketing)),
                      onisConsentedToAdsTap: () => bloc.add(
                          UserAgreementIsConsentedToAdsToggled(
                              isAgree: !agreement.isConsentedToAds)),
                    );
                  },
                ),
              ],
            ),

            Column(
              children: [
                UserAgreementUiDescriptionSection(),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<UserAgreementBloc, UserAgreementState>(
                  builder: (context, state) {
                    return UserAgreementUiButtonSection(
                      onTap: state.agreement.isUserAgree
                          ? () {
                              context.read<RegisterBloc>().add(
                                    UpdateTermsAgreement(
                                      userAgreement: context
                                          .read<UserAgreementBloc>()
                                          .state
                                          .agreement,
                                    ),
                                  );
                              context.push(RouterPath.registerEmail);
                            }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
