import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/buttons.dart';
import 'package:si_hicoach_fe/common/constants.dart';
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
              children: [
                LinearProgressIndicator(
                  value: 0.2,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: const Color.fromRGBO(75, 128, 255, 0.4),
                ),
                Container(
                  margin: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        '약관 동의',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '앱 사용을 위해 필수 이용 약관에 동의해 주세요.',
                        style: Theme.of(context).textTheme.caption,
                      )
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
                    top: defaultPadding,
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
                                    ? Colors.indigo
                                    : Colors.black,
                              ),
                            ),
                            leading: Checkbox(
                              value: _isAllChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isAllChecked = value!;
                                });
                              },
                              activeColor: Colors.indigo,
                            ),
                            onTap: () {
                              setState(() {
                                _isAllChecked = !_isAllChecked;
                              });
                            },
                          );
                        },
                        body: Column(
                          children: const <Widget>[
                            AgreementListItem(text: '[필수] 서비스 이용약관'),
                            Divider(
                              height: 0,
                              indent: 30,
                              endIndent: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                            AgreementListItem(text: '[필수] 개인정보 처라방침'),
                            Divider(
                              height: 0,
                              indent: 30,
                              endIndent: 30,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                            AgreementListItem(text: '[선택] 광고마케팅 활용정보 수집'),
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
  Navigator.of(context).pop();
}
