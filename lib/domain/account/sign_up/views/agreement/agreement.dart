import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/agreement_vm.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/list_item/check_all_item.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/list_item/list_item.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/verify/verify.dart';
import 'package:get/get.dart';

class SignUpAgreementView extends StatefulWidget {
  const SignUpAgreementView({Key? key}) : super(key: key);

  @override
  State<SignUpAgreementView> createState() => _SignUpAgreementViewState();
}

class _SignUpAgreementViewState extends State<SignUpAgreementView> {
  late AgreementViewModel _vm;

  _handleAgreedAllClick() {
    _vm.setAgreedAll();
  }

  _handleItemClick(int id) {
    print('ItemClick: ${id}');
  }

  _handleItemCheck(int id) {
    _vm.toggleTermChecked(id);
  }

  _handleSubmitButtonPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => SignUpVerifyView(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Get.delete<AgreementViewModel>();
    _vm = Get.put(AgreementViewModel());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _vm.fetchTerms());

    return Scaffold(
      appBar: const CustomAppBarArrowBack(titleText: '회원가입'),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LinearProgressIndicator(
              value: 0.2,
              color: primaryColor,
              backgroundColor: primaryColor.withAlpha(40),
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
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: primaryColor,
                  ),
                ),
                margin: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: _buildListView(),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(defaultPadding),
              width: double.infinity,
              child: _buildSubmitButton(),
            ),
          ],
        ),
      ),
    );
  }

  _buildSubmitButton() {
    return GetX<AgreementViewModel>(
        builder: (vm) => CustomElevatedButton(
              onPressed:
                  vm.isCheckedRequiredTerms ? _handleSubmitButtonPressed : null,
              text: '다음',
            ));
  }

  _buildListView() {
    return GetX<AgreementViewModel>(
      builder: (vm) => Column(
        children: <Widget>[
          CheckAllItem(
            isChecked: vm.isAgreedAll,
            onPressed: _handleAgreedAllClick,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: ListTile.divideTiles(
                context: context,
                tiles: List.of(
                  vm.termListItemModels.map(
                    (it) => TermListItem(
                      model: it,
                      onClick: _handleItemClick,
                      onChecked: _handleItemCheck,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
