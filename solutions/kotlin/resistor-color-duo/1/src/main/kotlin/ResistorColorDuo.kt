object ResistorColorDuo {

    fun value(vararg colors: Color): Int {
        return colors[0].ordinal * 10 + colors[1].ordinal
    }
}
