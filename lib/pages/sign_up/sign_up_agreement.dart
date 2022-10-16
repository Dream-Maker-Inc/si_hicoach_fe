import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/buttons.dart';
import 'package:si_hicoach_fe/common/constants.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              LinearProgressIndicator(
                value: 0.25,
                color: Colors.indigo,
                backgroundColor: Colors.indigo.withOpacity(0.5),
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
                margin: const EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: ExpansionPanelList(
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
                              color:
                                  _isAllChecked ? Colors.indigo : Colors.black,
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
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              '[필수] 개인정보처리방침',
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
                            trailing: const IconButton(
                              onPressed: _handleDropdownPressed,
                              icon: Icon(Icons.keyboard_arrow_right),
                            ),
                            onTap: () {
                              setState(() {
                                _isAllChecked = !_isAllChecked;
                              });
                            },
                          ),
                          ListTile(
                            title: Text(
                              '[필수] 서비스 이용약관',
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
                            trailing: const IconButton(
                              onPressed: _handleDropdownPressed,
                              icon: Icon(Icons.keyboard_arrow_right),
                            ),
                            onTap: () {
                              setState(() {
                                _isAllChecked = !_isAllChecked;
                              });
                            },
                          )
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: '다음',
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _handleDropdownPressed() {}
