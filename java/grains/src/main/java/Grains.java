import java.math.BigInteger;

class Grains {

    final static int SQUARES_ON_CHESS_BOARD = 64;

    BigInteger grainsOnSquare(final int square) {
        if (square < 1 || square > SQUARES_ON_CHESS_BOARD)
            throw new IllegalArgumentException("square must be between 1 and 64");
        return BigInteger.ONE.shiftLeft(square - 1);
    }

    BigInteger grainsOnBoard() {
        return BigInteger.ONE.shiftLeft(SQUARES_ON_CHESS_BOARD).subtract(BigInteger.ONE);
    }
}
