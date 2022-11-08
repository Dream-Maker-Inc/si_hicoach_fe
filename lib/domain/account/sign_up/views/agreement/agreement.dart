import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/agreement_list_item.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/verify/verify.dart';
import 'package:si_hicoach_fe/domain/common/components/app_bar.dart';
import 'package:si_hicoach_fe/domain/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/domain/common/constants/constants.dart';
import 'package:si_hicoach_fe/domain/common/theme/button.dart';

class AgreementProps {
  final String title;
  final String content;
  final bool isRequired;

  AgreementProps(this.title, this.content, this.isRequired);
}

class SignUpAgreementView extends StatefulWidget {
  const SignUpAgreementView({Key? key}) : super(key: key);

  @override
  State<SignUpAgreementView> createState() => _SignUpAgreementPageState();
}

class _SignUpAgreementPageState extends State<SignUpAgreementView> {
  List<AgreementProps> list = [
    AgreementProps('서비스 이용약관', '서비스 이용약관 내용', true),
    AgreementProps('개인정보 처리방침', '개인정보 처리방침 내용', false),
    AgreementProps('서비스 이용약관', '서비스 이용약관 내용', true),
  ];

  _handleCarouselExpanded(int index, bool isExpanded) {
    print('carousel expand');
  }

  _handleCheckBoxChanged(bool? value) {
    print('checkbox change');
  }

  _handleCheckBoxTapped() {
    print('checkbox tap');
  }

  @override
  Widget build(BuildContext context) {
    handleSubmitButtonPressed() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const SignUpVerifyView(),
        ),
      );
    }

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
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 18,
                              ),
                            ),
                            leading: Checkbox(
                              value: true,
                              onChanged: _handleCheckBoxChanged,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onTap: _handleCheckBoxTapped,
                          );
                        },
                        body: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: ListTile.divideTiles(
                            context: context,
                            tiles: List.of(
                              list.map(
                                (it) => AgreementListItem(
                                  title: it.title,
                                  content: it.content,
                                  isRequired: it.isRequired,
                                ),
                              ),
                            ),
                          ).toList(),
                        ),
                        isExpanded: true,
                      )
                    ].toList(),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(defaultPadding),
              child: CustomElevatedButton(
                onPressed: handleSubmitButtonPressed,
                text: '다음',
              ),
            )
          ],
        ),
      ),
    );
  }
}
