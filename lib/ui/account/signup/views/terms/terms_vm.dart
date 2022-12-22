// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:si_hicoach_fe/infrastructure/terms/dto/get_terms_response.dart';
import 'package:si_hicoach_fe/infrastructure/terms/terms_api.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/terms/models/term_model.dart';
import 'package:si_hicoach_fe/ui/account/signup/views/signup_vm.dart';
import 'package:collection/collection.dart';

// List.sorted 정렬 순서
const SORT_FIRST = -1;
const SORT_SECOND = 1;

class TermsViewModel extends BaseTermsViewModel {
  final SignupViewModel _signupVm = Get.find<SignupViewModel>();

  // 회원가입 전역 뷰모델에 체크된 약관 id 목록 저장
  saveToSignupViewModel() {
    _signupVm.agreedTermIds = [...checkedTermIds];
  }
}

class BaseTermsViewModel extends TermsFetchFeature {
  // 이용 약관 목록 (필수 약관 DESC 정렬)
  List<TermModel> get terms => _terms
      .map(
        (it) => TermModel(
            id: it.id,
            title: it.title,
            content: it.content,
            isRequired: it.isRequired),
      )
      .sorted((a, b) => a.isRequired ? SORT_FIRST : SORT_SECOND);

  // 이용 약관 id 목록
  List<int> get termIds => _terms.map((e) => e.id).toList();

  // 필수 약관 id 목록
  List<int> get requiredTermIds =>
      _terms.where((it) => it.isRequired).map((it) => it.id).toList();

  // 유저가 체크한 이용약관 id 목록
  RxList<int> checkedTermIds = RxList();

  // 전체 동의 여부
  bool get isCheckedAll => termIds.every(
        (termId) => checkedTermIds.any((checkedId) => checkedId == termId),
      );

  // 필수 약관 모두 체크 여부
  bool get isCheckedAllRequiredTerms => requiredTermIds.every((requiredId) =>
      checkedTermIds.any((checkedId) => checkedId == requiredId));

  // 해당 termId가 체크된 상태인지 리턴
  getTermChecked(int id) {
    return checkedTermIds.any((checkedId) => checkedId == id);
  }

  // 이용약관 체크 토글
  toggleTermChecked(int id) {
    final founded = checkedTermIds.firstWhereOrNull((it) => it == id);
    final isExist = founded != null;

    final newCheckedTermIds = isExist
        ? checkedTermIds.where((it) => it != id).toList()
        : [...checkedTermIds, id];

    checkedTermIds.value = newCheckedTermIds;
  }

  // 모든 이용약관 체크 토글
  toggleCheckedAll() {
    if (isCheckedAll) return checkedTermIds.value = [];

    checkedTermIds.value = [...termIds];
  }
}

class TermsFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);
  final Rxn<GetTermsResponse> _fetchTermsResponse = Rxn(null);

  List<Data> get _terms => _fetchTermsResponse.value?.data ?? [];

  fetchTerms() async {
    final result = await TermsApi.getTerms();

    result.when(
      (e) => apiError.value = e,
      (res) => _fetchTermsResponse.value = res,
    );
  }
}
