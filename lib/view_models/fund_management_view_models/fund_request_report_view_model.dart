import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rnn_yaatra/notifiers_interfaces/fund_management_interfaces/fund_request_report_interface.dart';

class FundRequestReportViewModel {

  final pageStateProvider = NotifierProvider<FundRequestReportViewModelNotifier,FundRequestReportInterface>(FundRequestReportViewModelNotifier.new); 

}

class FundRequestReportViewModelNotifier extends Notifier<FundRequestReportInterface> {

  @override
  FundRequestReportInterface build() {
    return FundRequestReportInterface();
  }

  setFromDate({String? date}) { 
    state = state.copyWith(
      selectedFromDate: date
    );
  }

  setToDate({String? date}) {
    state = state.copyWith(
      selectedToDate: date
    );
  }

  setDepositDate({String? date}) {
    state = state.copyWith(
      selectedDepositDate: date
    );
  }

  setStatus({String? name,String? value}) {
    state = state.copyWith(
      selectedStatus: name,
      selectedStatusValue: value
    );
  }

}