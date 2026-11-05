class FundRequestReportInterface {

  final String? fromDate;
  final String? toDate;
  final String? depositDate;
  final String? statusName;
  final String? statusValue;

  FundRequestReportInterface({this.fromDate,this.toDate,this.depositDate,this.statusName,this.statusValue});

  FundRequestReportInterface copyWith({
    String? selectedFromDate,String? selectedToDate,
    String? selectedDepositDate,
    String? selectedStatus,String? selectedStatusValue
  }) { 
    return FundRequestReportInterface(
      fromDate: selectedFromDate ?? fromDate,
      toDate: selectedToDate ?? toDate,
      depositDate: selectedDepositDate ?? depositDate,
      statusName: selectedStatus ?? statusName,
      statusValue: selectedStatusValue ?? statusValue
    );
  }
  
}