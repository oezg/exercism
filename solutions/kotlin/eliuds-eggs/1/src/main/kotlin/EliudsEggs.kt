object EliudsEggs {

    fun eggCount(number: Int): Int{
        tailrec fun go(n: Int, eggs: Int): Int {
            return if (n == 0) eggs else go(n / 2, (n and 1) + eggs)
        }

        require(number >= 0)
        return go(number, 0)
    }
}
