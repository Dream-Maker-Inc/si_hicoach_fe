import 'package:flutter/material.dart';
import 'package:si_hicoach_fe/common/components/app_bar.dart';
import 'package:si_hicoach_fe/common/components/title_with_description.dart';
import 'package:si_hicoach_fe/common/constants/constants.dart';
import 'package:si_hicoach_fe/common/getx/my_getx_state.dart';
import 'package:si_hicoach_fe/common/theme/button.dart';
import 'package:si_hicoach_fe/common/theme/color.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/terms/terms_vm.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/terms/list_item/check_all_item.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/terms/list_item/list_item.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/verify/verify.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/ui/common/terms/detail/detail.dart';

class SignUpTermsView extends StatefulWidget {
  const SignUpTermsView({Key? key}) : super(key: key);

  @override
  State<SignUpTermsView> createState() => _SignUpTermsViewState();
}

class _SignUpTermsViewState extends _Detail {
  @override
  Widget build(BuildContext context) {
    super.build(context);

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
                Container(
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
                  child: Column(
                    children: <Widget>[
                      _buildAllCheckItem(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.5,
                        child: _buildListView(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  _buildSubmitButton() {
    return Obx(() {
      final onClick =
          vm.isCheckedAllRequiredTerms ? _handleSubmitButtonPressed : null;

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(defaultPadding),
        child: CustomElevatedButton(
          onPressed: onClick,
          text: '다음',
        ),
      );
    });
  }

  _buildAllCheckItem() {
    return Obx(() {
      final isCheckedAll = vm.isCheckedAll;

      return CheckAllItem(
          isChecked: isCheckedAll, onPressed: _handleAgreedAllClick);
    });
  }

  _buildListView() {
    return Obx(() {
      final terms = vm.terms;
      final termsModels = terms.map(
        (it) => TermListItem(
          model: TermListItemModel(
            id: it.id,
            title: it.labeledTitle,
            isChecked: vm.getTermChecked(it.id),
          ),
          onClick: _handleItemClick,
          onChecked: _handleItemCheck,
          onIconClick: _handleItemIconClick,
        ),
      );

      return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: termsModels,
        ).toList(),
      );
    });
  }
}

class _Detail extends MyGetXState<SignUpTermsView, TermsViewModel> {
  _handleAgreedAllClick() {
    vm.toggleCheckedAll();
  }

  _handleItemClick(int id) {
    vm.toggleTermChecked(id);
  }

  _handleItemCheck(int id) {
    vm.toggleTermChecked(id);
  }

  _handleItemIconClick(int id) {
    final termModel = vm.getTermById(id);
    if (termModel == null) return;

    Get.to(
      TermsDetailView(
        title: termModel.title,
        content: termModel.content,
      ),
    );
  }

  _handleSubmitButtonPressed() {
    vm.saveToSignupViewModel();

    Get.to(const SignUpVerifyView());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => vm.fetchTerms());
    return widget;
  }

  @override
  TermsViewModel createViewModel() => TermsViewModel();
}
