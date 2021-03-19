import 'package:mobx/mobx.dart';
import 'package:vitrine237/models/company.dart';
import 'package:vitrine237/models/state.dart';
import 'package:vitrine237/providers/states_provider.dart';

part 'states_store.g.dart';

class StatesStore = _StatesStore with _$StatesStore;

abstract class _StatesStore with Store {
  @observable
  ObservableFuture<List<State>> states;

  @observable
  ObservableFuture<List<Company>> companies;

  @action
  Future getStates() => states = ObservableFuture(
      StatesProvider.index().then((List<State> result) => result));

  @action
  Future getCompanies(State state) =>
      companies = ObservableFuture(StatesProvider.companies(state.code)
          .then((List<Company> result) => result));
}
