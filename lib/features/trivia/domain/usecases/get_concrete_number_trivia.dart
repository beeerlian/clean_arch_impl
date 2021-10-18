import 'package:clean_arch_impl/core/failures.dart';
import 'package:clean_arch_impl/features/trivia/data/repositories/number_trivia_repository.dart';
import 'package:clean_arch_impl/features/trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  Future<Either<Failure, NumberTrivia>> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }
}
