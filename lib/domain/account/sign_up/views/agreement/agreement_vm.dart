import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/list_item/list_item.dart';
import 'package:si_hicoach_fe/domain/account/sign_up/views/agreement/list_item/model.dart';

class AgreementViewModel extends GetxController {
  final terms = [
    TermModel(1, '서비스 이용약관', '서비스 이용약관 내용', true),
    TermModel(2, '개인정보 처리방침', '개인정보 처리방침 내용', false),
    TermModel(3, '서비스 이용약관', '서비스 이용약관 내용', false),
    TermModel(4, '서비스 이용약관2', '서비스 이용약관 내용2', true),
    TermModel(5, '서비스 이용약관3', '서비스 이용약관 내용3', true),
  ];

  RxList<TermListItemModel> termListItemModels = RxList();
  RxList<int> agreedTermIds = RxList();

  fetchTerms() async {
    final models = terms
        .map((it) => TermListItemModel(
        id: it.id, title: it.labeledTitle, isChecked: false))
        .toList();

    final sorted = _sortedByRequiredAfterIdDesc(models);

    termListItemModels.value = sorted;
  }

  toggleTermChecked(int id) {
    final founded = agreedTermIds.firstWhereOrNull((it) => it == id);

    final result = (founded != null)
        ? agreedTermIds.where((it) => it != id).toList()
        : agreedTermIds.value = [...agreedTermIds, id];

    agreedTermIds.value = result;
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
}