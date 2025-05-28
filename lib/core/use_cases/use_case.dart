import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<T,param>{
  Future<Either<Failure,T>>call([param param]);
}