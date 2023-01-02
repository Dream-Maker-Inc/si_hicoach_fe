import 'package:get/get.dart';
import 'package:si_hicoach_fe/common/utils/date_format.dart';
import 'package:si_hicoach_fe/ui/trainer/members/list/models/member_model.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/dto/get_members_page_response.dart';
import 'package:si_hicoach_fe/infrastructure/page/trainer/members/trainer_members_page_api.dart';

class TrainerMemberListViewModel extends FinishedMembersFetchFeature {
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

  // 수강중 멤버 목록
  List<MemberModel> get inClassMembers =>
      _inClassMembers.map(_mapToMemberProps).toList();

  // 수강중 멤버 수
  int get _totalInClassMemberCount =>
      _getInClassMembersResponse.value?.data.metaData.totalItemCount ?? 0;

  // 수강 완료 멤버 목록
  List<MemberModel> get finishedMembers =>
      _finishedMembers.map(_mapToMemberProps).toList();

  // 수강 완료 멤버 수
  int get _totalFinishedMembersCount =>
      _getFinishedMembersResponse.value?.data.metaData.totalItemCount ?? 0;

  MemberModel _mapToMemberProps(Items items) {
    final latestStudyRound = items.nextStudyRound - 1;

    return MemberModel(
      id: items.member.id,
      name: items.member.name,
      matchedDate: items.createdAt.toKoreanFormat,
      latestStudyRound: latestStudyRound,
      totalTicketCount: items.totalTicketCount,
      matchingId: items.id,
      isTrainer: items.member.isRoleTrainer,
    );
  }

  // referch
  refetch() {
    if (tabIndex.value == 0) {
      fetchInClassMembers();
      return;
    }

    fetchFinishedMembers();
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
}

class FinishedMembersFetchFeature extends InClassMembersFetchFeature {
  final Rxn<GetMembersPageResponse> _getFinishedMembersResponse = Rxn();

  List<Items> get _finishedMembers =>
      _getFinishedMembersResponse.value?.data.items ?? [];

  fetchFinishedMembers() async {
    final result = await TrainerMembersPageApi.getData(isFinished: true);

    result.when(
      (e) => (apiError.value = e),
      (res) => (_getFinishedMembersResponse.value = res),
    );
  }
}

class InClassMembersFetchFeature extends GetxController {
  Rx<Exception?> apiError = Rx(null);

  final Rxn<GetMembersPageResponse> _getInClassMembersResponse = Rxn();

  List<Items> get _inClassMembers =>
      _getInClassMembersResponse.value?.data.items ?? [];

  fetchInClassMembers() async {
    final result = await TrainerMembersPageApi.getData();

    result.when(
      (e) => (apiError.value = e),
      (res) => (_getInClassMembersResponse.value = res),
    );
  }
}
