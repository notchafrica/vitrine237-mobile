part of 'company_bloc.dart';

enum CompanyStatus { initial, success, failure }

class CompanyState extends Equatable {
  const CompanyState({
    this.status = CompanyStatus.initial,
    this.companies = const <Company>[],
    this.hasReachedMax = false,
  });

  final CompanyStatus status;
  final List<Company> companies;
  final bool hasReachedMax;

  CompanyState copyWith({
    CompanyStatus status,
    List<Company> companies,
    bool hasReachedMax,
  }) {
    return CompanyState(
      status: status ?? this.status,
      companies: companies ?? this.companies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''CompanyState { status: $status, hasReachedMax: $hasReachedMax, companies: ${companies.length} }''';
  }

  @override
  List<Object> get props => [status, companies, hasReachedMax];
}
