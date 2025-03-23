// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_first_app/api/api_client.dart' as _i607;
import 'package:my_first_app/api/network_module.dart' as _i56;
import 'package:my_first_app/interceptors/interceptors.dart' as _i229;
import 'package:my_first_app/services/news_api.dart' as _i902;
import 'package:my_first_app/services/topic_api.dart' as _i151;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.singleton<_i902.NewsService>(() => _i902.NewsService());
    gh.singleton<_i151.TopicService>(() => _i151.TopicService());
    gh.singleton<_i229.ConnectivityInterceptor>(
      () => _i229.ConnectivityInterceptor(),
    );
    gh.singleton<_i229.TokenInterceptor>(() => _i229.TokenInterceptor());
    gh.singleton<_i229.ResponseParserInterceptor>(
      () => _i229.ResponseParserInterceptor(),
    );
    gh.singleton<_i361.Dio>(
      () => networkModule.getDio(
        gh<_i229.ConnectivityInterceptor>(),
        gh<_i229.TokenInterceptor>(),
        gh<_i229.ResponseParserInterceptor>(),
      ),
    );
    gh.singleton<_i607.ApiClient>(() => _i607.ApiClient(gh<_i361.Dio>()));
    return this;
  }
}

class _$NetworkModule extends _i56.NetworkModule {}
