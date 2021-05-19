part of 'company_bloc.dart';

abstract class CompanyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CompanyFetched extends CompanyEvent {
  final Company company;
  CompanyFetched({
    this.company,
  });
}
