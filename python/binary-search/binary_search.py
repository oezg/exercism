def find(search_list: list[int], value: int) -> int:
    def _find(left: int, right: int) -> int:
        if left >= right:
            raise ValueError("value not in array")
        middle = left + (right - left) // 2
        center = search_list[middle]
        if center == value:
            return middle
        elif center < value:
            return _find(middle + 1, right)
        else:
            return _find(left, middle)

    return _find(0, len(search_list))
