import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/data/agreements_api.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/data/dto/get_terms_response.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/list_item/list_item.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/list_item/model.dart';

class AgreementViewModel extends GetxController {
  List<TermModel> terms = [];

  RxList<TermListItemModel> termListItemModels = RxList();
  RxList<int> agreedTermIds = RxList();

  List<TermModel> get requiredTerms =>
      terms.where((it) => it.isRequired).toList();

  bool get isAgreedAll => termListItemModels.every((it) => it.isChecked);

  bool get isCheckedRequiredTerms {
    if (terms.isEmpty) return false;

    return requiredTerms
        .every((it) => agreedTermIds.any((agreed) => agreed == it.id));
  }

  fetchTerms() async {
    final result = await TermsApi.getAgreements();

    result.when(
      (e) => print(e),
      (res) => _handleFetchTermsResponse(res),
    );

    update();
  }

  toggleTermChecked(int id) {
    final founded = agreedTermIds.firstWhereOrNull((it) => it == id);

    final result = (founded != null)
        ? agreedTermIds.where((it) => it != id).toList()
        : agreedTermIds.value = [...agreedTermIds, id];

    agreedTermIds.value = result;
  }

  setAgreedAll() {
    final termIds = terms.map((it) => it.id).toList();
    agreedTermIds.value = termIds;
  }

  @override
  void onInit() {
    super.onInit();

    ever(agreedTermIds, _handleAgreedTermIdsChange);
  }

  List<TermListItemModel> _sortedByRequiredAfterIdDesc(
      List<TermListItemModel> termListItemModels) {
    return termListItemModels.fold<List<List<TermListItemModel>>>([[], []],
        (prev, it) {
      final term = terms.firstWhere((term) => term.id == it.id);

      if (term.isRequired) {
        final list = [...prev[0], it].sorted((a, b) => b.id.compareTo(a.id));

        prev[0] = list;
      } else {
        final list = [...prev[1], it].sorted((a, b) => b.id.compareTo(a.id));

        prev[1] = list;
      }
      return prev;
    }).fold<List<TermListItemModel>>(
        [], (prev, it) => [...prev, ...it]).toList();
  }

  _handleAgreedTermIdsChange(List<int> agreedTermIds) {
    isAnyEqualsAgreedTermIds(int id) => agreedTermIds.any((it) => it == id);

    final newModels = termListItemModels.map((it) => TermListItemModel(
        id: it.id,
        title: it.title,
        isChecked: isAnyEqualsAgreedTermIds(it.id)));

    final sorted = _sortedByRequiredAfterIdDesc(newModels.toList());

    termListItemModels.value = sorted;
  }

  _handleFetchTermsResponse(GetTermsResponse res) {
    terms = res.data
            ?.map((it) => TermModel(it.id, it.title, it.content, it.isRequired))
            .toList() ??
        [];

    final models = terms
        .map((it) => TermListItemModel(
            id: it.id, title: it.labeledTitle, isChecked: false))
        .toList();

    final sorted = _sortedByRequiredAfterIdDesc(models);

    termListItemModels.value = sorted;
  }
}
