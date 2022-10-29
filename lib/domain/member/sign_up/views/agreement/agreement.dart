import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';
import 'package:si_hicoach_fe/domain/member/sign_up/views/agreement/agreement_list_item.dart';
import 'package:si_hicoach_fe/domain/member/sign_up/views/type/type.dart';

class SignUpAgreementView extends StatefulWidget {
  const SignUpAgreementView({Key? key}) : super(key: key);

  @override
  State<SignUpAgreementView> createState() => _SignUpAgreementPageState();
}

class _SignUpAgreementPageState extends State<SignUpAgreementView> {
  bool _isAllChecked = false;
  bool _isCarouselExpanded = false;

  _handleCarouselExpanded(int index, bool isExpanded) {
    setState(() => _isCarouselExpanded = !_isCarouselExpanded);
  }

  _handleCheckBoxChanged(bool value) {
    setState(() => _isAllChecked = value);
  }

  _handleCheckBoxTapped() {
    setState(() {
      _isAllChecked = !_isAllChecked;
    });
  }

  void _handleSubmitButtonPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpTypeView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                LinearProgressIndicator(
                  value: 0.2,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
                ),
                Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const <Widget>[
                      TitleWithDescription(
                        title: '약관 동의',
                        description: '앱 사용을 위해 필수 이용 약관에 동의해 주세요.',
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  margin: const EdgeInsets.only(
                    left: defaultPadding,
                    right: defaultPadding,
                  ),
                  child: ExpansionPanelList(
                    elevation: 0,
                    expansionCallback: _handleCarouselExpanded,
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(
                              '모든 약관에 동의합니다.',
                              style: TextStyle(
                                color: _isAllChecked
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                                fontSize: 18,
                              ),
                            ),
                            leading: Checkbox(
                              value: _isAllChecked,
                              onChanged: (value) =>
                                  _handleCheckBoxChanged(value!),
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onTap: _handleCheckBoxTapped,
                          );
                        },
                        body: Column(
                          children: <Widget>[
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const AgreementListItem(text: '[필수] 서비스 이용약관'),
                            const Divider(
                              height: 0,
                              indent: 30,
                              endIndent: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                            const AgreementListItem(text: '[필수] 개인정보 처라방침'),
                            const Divider(
                              height: 0,
                              indent: 30,
                              endIndent: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                            const AgreementListItem(text: '[선택] 광고마케팅 활용정보 수집'),
                          ],
                        ),
                        isExpanded: _isCarouselExpanded,
                      )
                    ].toList(),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(defaultPadding),
                child: CustomElevatedButton(
                  onPressed: () => _handleSubmitButtonPressed(context),
                  text: '다음',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
