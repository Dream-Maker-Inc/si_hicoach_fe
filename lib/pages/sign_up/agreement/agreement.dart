import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/buttons.dart';
import 'package:si_hicoach_fe/common/constants.dart';
import 'package:si_hicoach_fe/common/sign_up/input_header.dart';
import 'package:si_hicoach_fe/pages/sign_up/agreement/agreement_list_item.dart';

class SignUpAgreementPage extends StatefulWidget {
  const SignUpAgreementPage({Key? key}) : super(key: key);

  @override
  State<SignUpAgreementPage> createState() => _SignUpAgreementPageState();
}

class _SignUpAgreementPageState extends State<SignUpAgreementPage> {
  bool _isAllChecked = false;
  bool _isCarouselExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
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
                      SignUpInputHeader(
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
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _isCarouselExpanded = !_isCarouselExpanded;
                      });
                    },
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
                              onChanged: (value) {
                                setState(() {
                                  _isAllChecked = value!;
                                });
                              },
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                            onTap: () {
                              setState(() {
                                _isAllChecked = !_isAllChecked;
                              });
                            },
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

void _handleDropdownPressed() {}

void _handleSubmitButtonPressed(BuildContext context) {
  Navigator.of(context).pushNamed('/sign_up/type');
}
