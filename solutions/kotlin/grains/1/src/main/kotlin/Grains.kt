import java.math.BigInteger

object Board {

    fun getGrainCountForSquare(number: Int): BigInteger {
        require(number in 1..64)
        return 2.toBigInteger().pow(number - 1)
    }

    fun getTotalGrainCount(): BigInteger =
        (1..64)
            .map(Board::getGrainCountForSquare)
            .reduce(BigInteger::plus)

}
