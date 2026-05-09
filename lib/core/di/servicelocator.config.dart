// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/home/data/data_source/category_section_remote_data_source.dart'
    as _i83;
import '../../features/home/data/data_source/category_section_remote_data_source_impl.dart'
    as _i1008;
import '../../features/home/data/data_source/meals_remote_data_source.dart'
    as _i864;
import '../../features/home/data/data_source/meals_remote_data_source_impl.dart'
    as _i227;
import '../../features/home/data/data_source/product_search_remote_data_source.dart'
    as _i823;
import '../../features/home/data/data_source/product_search_remote_data_source_impl.dart'
    as _i704;
import '../../features/home/data/data_source/recommended_meal_remote_data_source.dart'
    as _i494;
import '../../features/home/data/data_source/recommended_meal_remote_data_source_impl.dart'
    as _i71;
import '../../features/home/data/repo/category_section_repo_impl.dart' as _i894;
import '../../features/home/data/repo/meal_repo_impl.dart' as _i48;
import '../../features/home/data/repo/product_search_repository_Impl.dart'
    as _i360;
import '../../features/home/data/repo/recommended_meal_repo_impl.dart' as _i953;
import '../../features/home/domain/repo/category_section_repo.dart' as _i6;
import '../../features/home/domain/repo/meals_repository.dart' as _i91;
import '../../features/home/domain/repo/product_search_repository.dart'
    as _i719;
import '../../features/home/domain/repo/recommended_meal_repo.dart' as _i931;
import '../../features/home/domain/usecase/category_section_use_case.dart'
    as _i353;
import '../../features/home/domain/usecase/get_all_deals_use_case.dart'
    as _i893;
import '../../features/home/domain/usecase/get_products_search_use_case.dart'
    as _i301;
import '../../features/home/domain/usecase/recommended_meal_use_case.dart'
    as _i403;
import '../../features/home/presentation/cubit/cart_cubit.dart' as _i890;
import '../../features/home/presentation/cubit/category_cubit.dart' as _i458;
import '../../features/home/presentation/cubit/home_cubit.dart' as _i9;
import '../../features/home/presentation/cubit/product_search_cubit.dart'
    as _i28;
import '../../features/home/presentation/cubit/recommended_cubit.dart' as _i665;
import '../../features/login/data/data_Source/login_remote_data_source.dart'
    as _i200;
import '../../features/login/data/data_Source/login_remote_data_source_impl.dart'
    as _i544;
import '../../features/login/data/local/local_data_source.dart' as _i346;
import '../../features/login/data/local/secure_storage.dart' as _i541;
import '../../features/login/data/repo/login_repo_impl.dart' as _i176;
import '../../features/login/domain/repo/login_repo.dart' as _i0;
import '../../features/login/domain/useCase/login_use_case.dart' as _i630;
import '../../features/login/presentation/cubit/login_cubit.dart' as _i147;
import '../../features/my_list/data/api/my_list_api.dart' as _i826;
import '../../features/my_list/data/datasources/add_to_cart/add_to_cart_data_source.dart'
    as _i445;
import '../../features/my_list/data/datasources/add_to_cart/add_to_cart_data_source_imp.dart'
    as _i1;
import '../../features/my_list/data/datasources/favorites/favorites_data_source.dart'
    as _i781;
import '../../features/my_list/data/datasources/favorites/favorites_data_source_imp.dart'
    as _i705;
import '../../features/my_list/data/datasources/history/history_data_source.dart'
    as _i214;
import '../../features/my_list/data/datasources/history/history_data_source_imp.dart'
    as _i417;
import '../../features/my_list/data/datasources/smart_list/smart_list_data_source.dart'
    as _i446;
import '../../features/my_list/data/datasources/smart_list/smart_list_data_source_imp.dart'
    as _i1005;
import '../../features/my_list/data/repositories/add_to_cart/add_to_cart_repository_imp.dart'
    as _i338;
import '../../features/my_list/data/repositories/favorites/favorites_repository_imp.dart'
    as _i766;
import '../../features/my_list/data/repositories/history/history_repository_imp.dart'
    as _i998;
import '../../features/my_list/data/repositories/smart_list/smart_list_repository_imp.dart'
    as _i412;
import '../../features/my_list/domain/repository/add_to_cart/add_to_cart_repository.dart'
    as _i832;
import '../../features/my_list/domain/repository/favorites/favorites_repository.dart'
    as _i701;
import '../../features/my_list/domain/repository/history/history_repository.dart'
    as _i5;
import '../../features/my_list/domain/repository/smart_list/smart_list_repository.dart'
    as _i375;
import '../../features/my_list/domain/use_case/favoriets/add_to_cart_use_case.dart'
    as _i613;
import '../../features/my_list/domain/use_case/favoriets/get_favorites_use_case.dart'
    as _i741;
import '../../features/my_list/domain/use_case/favoriets/remove_favorites_use_case.dart'
    as _i801;
import '../../features/my_list/domain/use_case/history/add_remove_favorites.dart'
    as _i203;
import '../../features/my_list/domain/use_case/history/add_to_cart_use_case.dart'
    as _i727;
import '../../features/my_list/domain/use_case/history/get_history_use_case.dart'
    as _i228;
import '../../features/my_list/domain/use_case/smart_list/add_all_to_cart_use_case.dart'
    as _i804;
import '../../features/my_list/domain/use_case/smart_list/delete_smart_list_use_case.dart'
    as _i894;
import '../../features/my_list/domain/use_case/smart_list/get_smart_lists_use_case.dart'
    as _i746;
import '../../features/my_list/presentation/view_model/favorites/favorites_cubit.dart'
    as _i14;
import '../../features/my_list/presentation/view_model/history/history_cubit.dart'
    as _i287;
import '../../features/my_list/presentation/view_model/smart_list/smart_lists_cubit.dart'
    as _i798;
import '../../features/product_details/data/api/product_details_api.dart'
    as _i552;
import '../../features/product_details/data/data_source/product_details_data_source.dart'
    as _i933;
import '../../features/product_details/data/data_source/product_details_data_source_imp.dart'
    as _i1061;
import '../../features/product_details/data/repository/product_details_repo_imp.dart'
    as _i902;
import '../../features/product_details/domain/repository/product_details_repo.dart'
    as _i497;
import '../../features/product_details/domain/use_case/add_to_cart_use_case.dart'
    as _i178;
import '../../features/product_details/domain/use_case/product_details_use_case.dart'
    as _i181;
import '../../features/product_details/domain/use_case/toggle_favorite_use_case.dart'
    as _i938;
import '../../features/product_details/presentation/view_model/product_details_cubit.dart'
    as _i111;
import '../../features/signup/data/repositories/datasoures/remoteDataSourses/firebase_auth_datasourceImpl.dart'
    as _i1020;
import '../../features/signup/data/repositories/datasoures/remoteDataSourses/register_remote_datasourceImpl.dart'
    as _i979;
import '../../features/signup/data/repositories/repositories/firebase_auth_repostiory_impl.dart'
    as _i867;
import '../../features/signup/data/repositories/repositories/register_repository_impl.dart'
    as _i34;
import '../../features/signup/domain/repositories/datasourses/remoteDataSourse/firebase_auth_datasource.dart'
    as _i836;
import '../../features/signup/domain/repositories/datasourses/remoteDataSourse/register_remote_datasource.dart'
    as _i318;
import '../../features/signup/domain/repositories/repositories/firebase_auth_repository.dart'
    as _i159;
import '../../features/signup/domain/repositories/repositories/register_repository.dart'
    as _i195;
import '../../features/signup/domain/usecases/firebase_auth_usecase.dart'
    as _i700;
import '../../features/signup/domain/usecases/register_usecase.dart' as _i600;
import '../../features/signup/presentation/ui/auth/cubit/firebase_auth_view_model.dart'
    as _i917;
import '../../features/signup/presentation/ui/auth/cubit/register_view_model.dart'
    as _i539;
import '../../features/subcategories/data/repositories/datasoures/remoteDataSourses/categories_datasource_impl.dart'
    as _i10;
import '../../features/subcategories/data/repositories/datasoures/remoteDataSourses/category_details_datasource_Ipml.dart'
    as _i213;
import '../../features/subcategories/data/repositories/repositories/categories_repository_Impl.dart'
    as _i237;
import '../../features/subcategories/data/repositories/repositories/category_details_repository_Impl.dart'
    as _i103;
import '../../features/subcategories/domain/repositories/datasourses/remoteDataSourse/categories_datasource.dart'
    as _i1062;
import '../../features/subcategories/domain/repositories/datasourses/remoteDataSourse/category_details_datasource.dart'
    as _i442;
import '../../features/subcategories/domain/repositories/repositories/categories_repository.dart'
    as _i257;
import '../../features/subcategories/domain/repositories/repositories/category_details_repository.dart'
    as _i893;
import '../../features/subcategories/domain/usecases/categories_usecase.dart'
    as _i245;
import '../../features/subcategories/domain/usecases/category_details_usecase.dart'
    as _i587;
import '../../features/subcategories/presentation/cubit/categories_view_model.dart'
    as _i616;
import '../../features/subcategories/presentation/cubit/category_details_view_model.dart'
    as _i810;
import '../api/api_manager.dart' as _i1047;
import '../firebase/auth_service.dart' as _i35;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i890.CartCubit>(() => _i890.CartCubit());
    gh.factory<_i826.MyListApi>(() => _i826.MyListApi());
    gh.factory<_i552.ProductDetailsApi>(() => _i552.ProductDetailsApi());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth());
    gh.factory<_i1005.SmartListDataSource>(
        () => _i446.SmartListDataSourceImpl(gh<_i826.MyListApi>()));
    gh.factory<_i933.ProductDetailsDataSource>(() =>
        _i1061.ProductDetailsDataSourceImp(gh<_i552.ProductDetailsApi>()));
    gh.factory<_i442.CategoryDetailsDatasource>(() =>
        _i213.CategoryDetailsDataSourceImpl(
            apiManger: gh<_i1047.ApiManager>()));
    gh.factory<_i1062.CategoriesDataSource>(() =>
        _i10.CategoriesDataSourceImpl(apiManger: gh<_i1047.ApiManager>()));
    gh.factory<_i893.CategoryDetailsRepository>(() =>
        _i103.Categorydetailsrepositoryimpl(
            datasource: gh<_i442.CategoryDetailsDatasource>()));
    gh.factory<_i200.LoginRemoteDataSource>(
        () => _i544.LoginRemoteDataSourceImpl());
    gh.singleton<_i346.LocalauthDatasouce>(
        () => _i541.SecureStorageDatasource(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i445.AddToCartDataSource>(
        () => _i1.AddToCartDataSourceImp(gh<_i826.MyListApi>()));
    gh.factory<_i214.HistoryDataSource>(
        () => _i417.HistoryDataSourceImpl(gh<_i826.MyListApi>()));
    gh.factory<_i318.Registerremotedatasource>(() =>
        _i979.Registerremotedatasourceimpl(apiManger: gh<_i1047.ApiManager>()));
    gh.factory<_i375.SmartListRepository>(
        () => _i412.SmartListRepositoryImpl(gh<_i1005.SmartListDataSource>()));
    gh.factory<_i781.FavoritesDataSource>(
        () => _i705.FavoritesDataSourceImpl(gh<_i826.MyListApi>()));
    gh.factory<_i701.FavoritesRepository>(
        () => _i766.FavoritesRepositoryImpl(gh<_i781.FavoritesDataSource>()));
    gh.factory<_i497.ProductDetailsRepository>(() =>
        _i902.ProductDetailsRepositoryImp(
            gh<_i933.ProductDetailsDataSource>()));
    gh.factory<_i864.MealsRemoteDataSource>(
        () => _i227.MealsRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i894.DeleteSmartListUseCase>(
        () => _i894.DeleteSmartListUseCase(gh<_i375.SmartListRepository>()));
    gh.factory<_i746.GetSmartListsUseCase>(
        () => _i746.GetSmartListsUseCase(gh<_i375.SmartListRepository>()));
    gh.factory<_i823.ProductRemoteDataSource>(
        () => _i704.ProductRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i836.Firebaseauthdatasource>(
        () => _i1020.Firebaseauthdatasourceimpl(auth: gh<_i59.FirebaseAuth>()));
    gh.factory<_i587.CategoryDetailsUseCase>(() => _i587.CategoryDetailsUseCase(
        categoryDetails: gh<_i893.CategoryDetailsRepository>()));
    gh.factory<_i5.HistoryRepository>(
        () => _i998.HistoryRepositoryImpl(gh<_i214.HistoryDataSource>()));
    gh.factory<_i801.AddAndRemoveFavoriteUseCase>(() =>
        _i801.AddAndRemoveFavoriteUseCase(gh<_i701.FavoritesRepository>()));
    gh.factory<_i195.RegisterRepository>(() => _i34.Registerrepositoryimpl(
        registerremotedatasource: gh<_i318.Registerremotedatasource>()));
    gh.factory<_i83.CategorySectionRemoteDataSource>(() =>
        _i1008.CategorySectionRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i741.GetFavoritesUseCase>(
        () => _i741.GetFavoritesUseCase(gh<_i701.FavoritesRepository>()));
    gh.factory<_i257.Categoriesrepository>(() => _i237.CategoriesRepositoryImpl(
        dataSource: gh<_i1062.CategoriesDataSource>()));
    gh.factory<_i494.RecommendedMealRemoteDataSource>(() =>
        _i71.RecommendedMealRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i0.LoginRepo>(() => _i176.LoginRepoImpl(
          gh<_i200.LoginRemoteDataSource>(),
          gh<_i346.LocalauthDatasouce>(),
        ));
    gh.factory<_i832.AddToCartRepository>(
        () => _i338.AddToCartRepositoryImp(gh<_i445.AddToCartDataSource>()));
    gh.factory<_i91.MealRepository>(
        () => _i48.MealsRepositoryImpl(gh<_i864.MealsRemoteDataSource>()));
    gh.factory<_i613.AddToCartFavoritesUseCase>(
        () => _i613.AddToCartFavoritesUseCase(gh<_i832.AddToCartRepository>()));
    gh.factory<_i727.AddToCartHistoryUseCase>(
        () => _i727.AddToCartHistoryUseCase(gh<_i832.AddToCartRepository>()));
    gh.factory<_i804.AddToCartSmartListUseCase>(
        () => _i804.AddToCartSmartListUseCase(gh<_i832.AddToCartRepository>()));
    gh.factory<_i630.LoginUseCase>(
        () => _i630.LoginUseCase(loginRepo: gh<_i0.LoginRepo>()));
    gh.factory<_i178.AddToCartUseCase>(
        () => _i178.AddToCartUseCase(gh<_i497.ProductDetailsRepository>()));
    gh.factory<_i181.ProductDetailsUseCase>(() =>
        _i181.ProductDetailsUseCase(gh<_i497.ProductDetailsRepository>()));
    gh.factory<_i938.ToggleFavoriteUseCase>(() =>
        _i938.ToggleFavoriteUseCase(gh<_i497.ProductDetailsRepository>()));
    gh.factory<_i147.LoginCubit>(
        () => _i147.LoginCubit(gh<_i630.LoginUseCase>()));
    gh.factory<_i14.FavoritesCubit>(() => _i14.FavoritesCubit(
          gh<_i741.GetFavoritesUseCase>(),
          gh<_i801.AddAndRemoveFavoriteUseCase>(),
          gh<_i613.AddToCartFavoritesUseCase>(),
        ));
    gh.factory<_i159.Firebaseauthrepository>(() =>
        _i867.Firebaseauthrepostioryimpl(
            datasource: gh<_i836.Firebaseauthdatasource>()));
    gh.factory<_i245.CategoriesUseCase>(() => _i245.CategoriesUseCase(
        categoriesrepository: gh<_i257.Categoriesrepository>()));
    gh.factory<_i111.ProductDetailsCubit>(() => _i111.ProductDetailsCubit(
          gh<_i181.ProductDetailsUseCase>(),
          gh<_i938.ToggleFavoriteUseCase>(),
          gh<_i178.AddToCartUseCase>(),
        ));
    gh.factory<_i931.RecommendedMealRepo>(() => _i953.RecommendedMealRepoImpl(
        gh<_i494.RecommendedMealRemoteDataSource>()));
    gh.factory<_i600.RegisterUseCase>(() => _i600.RegisterUseCase(
        registerRepository: gh<_i195.RegisterRepository>()));
    gh.factory<_i203.AddRemoveFavoritesUseCase>(
        () => _i203.AddRemoveFavoritesUseCase(gh<_i5.HistoryRepository>()));
    gh.factory<_i228.GetHistoryUseCase>(
        () => _i228.GetHistoryUseCase(gh<_i5.HistoryRepository>()));
    gh.factory<_i810.CategoryDetailsViewModel>(() =>
        _i810.CategoryDetailsViewModel(
            categoryDetailsUseCase: gh<_i587.CategoryDetailsUseCase>()));
    gh.factory<_i719.ProductRepository>(
        () => _i360.ProductRepositoryImpl(gh<_i823.ProductRemoteDataSource>()));
    gh.factory<_i539.RegisterViewModel>(() =>
        _i539.RegisterViewModel(registerUseCase: gh<_i600.RegisterUseCase>()));
    gh.factory<_i6.CategorySectionRepo>(() => _i894.CategorySectionRepoImpl(
        gh<_i83.CategorySectionRemoteDataSource>()));
    gh.factory<_i616.CategoriesViewModel>(() => _i616.CategoriesViewModel(
        categoriesUseCase: gh<_i245.CategoriesUseCase>()));
    gh.factory<_i893.GetAllDealsUseCase>(
        () => _i893.GetAllDealsUseCase(gh<_i91.MealRepository>()));
    gh.factory<_i403.RecommendedMealUseCase>(
        () => _i403.RecommendedMealUseCase(gh<_i931.RecommendedMealRepo>()));
    gh.factory<_i287.HistoryCubit>(() => _i287.HistoryCubit(
          gh<_i228.GetHistoryUseCase>(),
          gh<_i203.AddRemoveFavoritesUseCase>(),
          gh<_i727.AddToCartHistoryUseCase>(),
        ));
    gh.factory<_i700.SignInWithGoogleUseCase>(() =>
        _i700.SignInWithGoogleUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignInWithEmailUseCase>(
        () => _i700.SignInWithEmailUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignUpWithEmailUseCase>(
        () => _i700.SignUpWithEmailUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i700.SignInWithFacebookUseCase>(() =>
        _i700.SignInWithFacebookUseCase(gh<_i159.Firebaseauthrepository>()));
    gh.factory<_i665.RecommendedCubit>(
        () => _i665.RecommendedCubit(gh<_i403.RecommendedMealUseCase>()));
    gh.factory<_i798.SmartListsCubit>(() => _i798.SmartListsCubit(
          gh<_i746.GetSmartListsUseCase>(),
          gh<_i894.DeleteSmartListUseCase>(),
          gh<_i804.AddToCartSmartListUseCase>(),
        ));
    gh.factory<_i301.GetProductsSearchUseCase>(
        () => _i301.GetProductsSearchUseCase(gh<_i719.ProductRepository>()));
    gh.factory<_i700.AuthUseCases>(() => _i700.AuthUseCases(
          google: gh<_i700.SignInWithGoogleUseCase>(),
          email: gh<_i700.SignInWithEmailUseCase>(),
          signUp: gh<_i700.SignUpWithEmailUseCase>(),
          facebook: gh<_i700.SignInWithFacebookUseCase>(),
        ));
    gh.factory<_i353.CategorySectionUseCase>(
        () => _i353.CategorySectionUseCase(gh<_i6.CategorySectionRepo>()));
    gh.factory<_i917.FirebaseauthViewModel>(() =>
        _i917.FirebaseauthViewModel(authUseCases: gh<_i700.AuthUseCases>()));
    gh.factory<_i9.HomeCubit>(
        () => _i9.HomeCubit(gh<_i893.GetAllDealsUseCase>()));
    gh.factory<_i458.CategoryCubit>(
        () => _i458.CategoryCubit(gh<_i353.CategorySectionUseCase>()));
    gh.factory<_i28.ProductSearchCubit>(
        () => _i28.ProductSearchCubit(gh<_i301.GetProductsSearchUseCase>()));
    return this;
  }
}

class _$FirebaseModule extends _i35.FirebaseModule {}
