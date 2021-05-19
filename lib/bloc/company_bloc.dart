import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitrine237/models/company.dart';
import 'package:rxdart/rxdart.dart';
part 'company_event.dart';
part 'company_state.dart';

const _postLimit = 20;

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  CompanyBloc(CompanyState initialState) : super(initialState);

  @override
  Stream<CompanyState> mapEventToState(CompanyEvent event) async* {
    if (event is CompanyFetched) {
      yield await _mapCompanyFetchedToState(state);
    }
  }

  Future<CompanyState> _mapCompanyFetchedToState(CompanyState state) async {
    if (state.hasReachedMax) return state;
    try {
      if (state.status == CompanyStatus.initial) {
        final companies = await _fetchCompanies();
        return state.copyWith(
          status: CompanyStatus.success,
          companies: companies,
          hasReachedMax: false,
        );
      }
      final companies = await _fetchCompanies(state.companies.length);
      return companies.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(
              status: CompanyStatus.success,
              companies: List.of(state.companies)..addAll(companies),
              hasReachedMax: false,
            );
    } on Exception {
      return state.copyWith(status: CompanyStatus.failure);
    }
  }

  @override
  Stream<Transition<CompanyEvent, CompanyState>> transformEvents(
    Stream<CompanyEvent> events,
    TransitionFunction<CompanyEvent, CompanyState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  Future<List<Company>> _fetchCompanies([int startIndex = 0]) async {
    /* final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return Company(
          id: json['id'] as int,
        );
      }).toList();
    } */
    throw Exception('error fetching posts');
  }
}
