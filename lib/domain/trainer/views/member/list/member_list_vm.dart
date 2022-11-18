import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:si_hicoach_fe/domain/trainer/views/member/list/member_list.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/dto/get_members_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/trainer_members_page_api.dart';

class MemberListViewModel extends GetxController {
  RxInt tabIndex = RxInt(0);

  int get totalMemberCount {
    switch (tabIndex.value) {
      case 0:
        return _totalInClassMemberCount;
      case 1:
        return _totalFinishedMembersCount;
      default:
        return 0;
    }
  }

  List<MemberProps> get inClassMembers =>
      _inClassMembers.map(_mapToMemberProps).toList();

  int get _totalInClassMemberCount =>
      _getInClassMembersResponse.value?.data.metaData.totalItemCount ?? 0;

  List<MemberProps> get finishedMembers =>
      _finishedMembers.map(_mapToMemberProps).toList();

  int get _totalFinishedMembersCount =>
      _getFinishedMembersResponse.value?.data.metaData.totalItemCount ?? 0;

  MemberProps _mapToMemberProps(Items items) {
    return MemberProps(
        id: items.member.id,
        name: items.member.name,
        matchedDate: _formatDate(items.matching.createdAt),
        latestStudyRound: items.latestStudy?.round ?? 0,
        totalStudyCount: items.totalStudyCount);
  }

  //
  Rx<Exception?> apiError = Rx(null);

  // fetch in class members
  final Rxn<GetMembersPageResponse> _getInClassMembersResponse = Rxn();

  List<Items> get _inClassMembers =>
      _getInClassMembersResponse.value?.data.items ?? [];

  fetchInClassMembers() async {
    final result = await TrainerMembersPageApi.getData();

    result.when((e) => (apiError.value = e),
            (response) => (_getInClassMembersResponse.value = response));
  }

  // fetch finished members
  final Rxn<GetMembersPageResponse> _getFinishedMembersResponse = Rxn();

  List<Items> get _finishedMembers =>
      _getFinishedMembersResponse.value?.data.items ?? [];

  fetchFinishedMembers() async {
    final result = await TrainerMembersPageApi.getData(isFinished: true);

    result.when((e) => (apiError.value = e),
            (response) => (_getFinishedMembersResponse.value = response));
  }

  //
  @override
  Future<void> onInit() async {
    super.onInit();

    ever(tabIndex, _handleTabIndexChange);
  }

  _handleTabIndexChange(int index) {
    if (index == 0) {
      return fetchInClassMembers();
    }

    if (index == 1) {
      return fetchFinishedMembers();
    }
  }

  //
  String _formatDate(String dateString) {
    final DateFormat formatter = DateFormat('yyyy년 MM월 dd일');
    final date = DateTime.parse(dateString);

    return formatter.format(date);
  }
}
