import java.math.BigInteger

object Board {

    fun getGrainCountForSquare(number: Int): BigInteger {
        require(number in 1..64)
        return BigInteger.ONE shl number.dec()
    }

    fun getTotalGrainCount() = (BigInteger.ONE shl 64).dec()
}
