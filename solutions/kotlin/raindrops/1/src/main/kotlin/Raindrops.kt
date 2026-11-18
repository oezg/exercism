object Raindrops {

    fun convert(n: Int): String {
        return help(n, listOf(3 to "Pling", 5 to "Plang", 7 to "Plong"), emptyList())
    }

    private tailrec fun help(n: Int, data: List<Pair<Int,String>>, acc: List<String>): String {
        if (data.isEmpty()) {
            if (acc.isEmpty()) return n.toString()
            return acc.joinToString("")
        }
        val t  = data.first()
        if (n % t.first == 0) {
            return help(n / t.first, data.drop(1), acc + t.second)
        }
        return help(n, data.drop(1), acc)
    }
}
