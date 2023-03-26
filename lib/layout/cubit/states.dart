abstract class NewsStates {}

class AppInitialState extends NewsStates {}

class AppChangeModeState extends NewsStates {}

class NewsInitialState extends NewsStates {}

class ChangeBottomNavBar extends NewsStates {}

class GetBusinessDataLoading extends NewsStates {}

class GetBusinessDataSuccess extends NewsStates {}

class GetBusinessDataError extends NewsStates
{
  String? error;
  GetBusinessDataError(this.error);
}

class GetBusinessDataCheckPhoto extends NewsStates {}

class GetSportsDataLoading extends NewsStates {}

class GetSportsDataSuccess extends NewsStates {}

class GetSportsDataError extends NewsStates
{
  String? error;
  GetSportsDataError(this.error);
}
class Get extends NewsStates {}

class GetSportsDataCheckPhoto extends NewsStates {}

class GetScienceDataLoading extends NewsStates {}

class GetScienceDataSuccess extends NewsStates {}

class GetScienceDataError extends NewsStates
{
  String? error;
  GetScienceDataError(this.error);
}

class GetScienceDataCheckPhoto extends NewsStates {}

class GetSearchDataLoading extends NewsStates {}

class GetSearchDataSuccess extends NewsStates {}

class GetSearchDataError extends NewsStates
{
  String? error;
  GetSearchDataError(this.error);
}

class GetSearchDataCheckPhoto extends NewsStates {}