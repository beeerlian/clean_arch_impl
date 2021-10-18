import 'package:clean_arch_impl/features/trivia/data/repositories/number_trivia_repository.dart';
import 'package:clean_arch_impl/features/trivia/domain/entities/number_trivia.dart';
import 'package:clean_arch_impl/features/trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

@GenerateMocks([MockNumberTriviaRepository])
void main() {
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  late GetConcreteNumberTrivia usecase;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final int tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'test', number: tNumber);
  test('should get trivia for number from the repository', () async {
    //arrange
    when(mockNumberTriviaRepository
            .getConcreteNumberTrivia(tNumber))
        .thenAnswer((_) async => Right(tNumberTrivia));
    //act
    final response = await usecase.execute(number: tNumber);
    //assert
    expect(response, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
