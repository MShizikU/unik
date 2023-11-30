package mirea.ru.carsharing.utilities;

public class ExecutionResult<T> {
    private final T result;
    private final String errorMessage;

    private ExecutionResult(T result, String errorMessage) {
        this.result = result;
        this.errorMessage = errorMessage;
    }

    public static <T> ExecutionResult<T> success(T result) {
        return new ExecutionResult<>(result, null);
    }

    public static <T> ExecutionResult<T> error(String errorMessage) {
        return new ExecutionResult<>(null, errorMessage);
    }

    public T getResult() {
        return result;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}