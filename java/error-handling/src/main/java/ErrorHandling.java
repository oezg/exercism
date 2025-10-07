import java.sql.SQLException;
import java.util.NoSuchElementException;
import java.util.Optional;

class ErrorHandling {

  void handleErrorByThrowingIllegalArgumentException() {
    throw new IllegalArgumentException();
  }

  void handleErrorByThrowingIllegalArgumentExceptionWithDetailMessage(String message) {
    throw new IllegalArgumentException(message);
  }

  void handleErrorByThrowingAnyCheckedException() throws Exception {
    throw new SQLException();
  }

  void handleErrorByThrowingAnyCheckedExceptionWithDetailMessage(String message) throws Exception {
    throw new SQLException(message);
  }

  void handleErrorByThrowingAnyUncheckedException() {
    throw new NoSuchElementException();
  }

  void handleErrorByThrowingAnyUncheckedExceptionWithDetailMessage(String message) {
    throw new NoSuchElementException(message);
  }

  void handleErrorByThrowingCustomCheckedException() throws Exception {
    throw new CustomCheckedException();
  }

  void handleErrorByThrowingCustomCheckedExceptionWithDetailMessage(String message)
      throws CustomCheckedException {
    throw new CustomCheckedException(message);
  }

  void handleErrorByThrowingCustomUncheckedException() {
    throw new CustomUncheckedException();
  }

  void handleErrorByThrowingCustomUncheckedExceptionWithDetailMessage(String message) {
    throw new CustomUncheckedException(message);
  }

  Optional<Integer> handleErrorByReturningOptionalInstance(String integer) {
    try {
      return Optional.of(Integer.parseInt(integer));
    } catch (NumberFormatException e) {
      return Optional.empty();
    }
  }
}
