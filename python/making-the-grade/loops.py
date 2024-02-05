"""Functions for organizing and calculating student exam scores."""


def round_scores(student_scores: list[float | int]) -> list[int]:
    """Round all provided student scores.

    :param student_scores: list - float or int of student exam scores.
    :return: list - student scores *rounded* to nearest integer value.
    """

    rounded_scores = []
    for score in student_scores:
        rounded_scores.append(round(score))
    return rounded_scores


def count_failed_students(student_scores: list[int]) -> int:
    """Count the number of failing students out of the group provided.

    :param student_scores: list - containing int student scores.
    :return: int - count of student scores at or below 40.
    """

    count = 0
    for score in student_scores:
        if score > 40:
            continue
        count += 1
    return count


def above_threshold(student_scores: list[int], threshold: int) -> list[int]:
    """Determine how many of the provided student scores were 'the best' based on the provided threshold.

    :param student_scores: list - of integer scores.
    :param threshold: int - threshold to cross to be the "best" score.
    :return: list - of integer scores that are at or above the "best" threshold.
    """

    scores_above_threshold = []
    for score in student_scores:
        if score < threshold:
            continue
        scores_above_threshold.append(score)
    return scores_above_threshold


def letter_grades(highest: int) -> list[int]:
    """Create a list of grade thresholds based on the provided highest grade.

    :param highest: int - value of highest exam score.
    :return: list - of lower threshold scores for each D-A letter grade interval.
            For example, where the highest score is 100, and failing is <= 40,
            The result would be [41, 56, 71, 86]:

            41 <= "D" <= 55
            56 <= "C" <= 70
            71 <= "B" <= 85
            86 <= "A" <= 100
    """

    interval_breadth = (highest - 40) // 4
    return list(range(41, highest, interval_breadth))


def student_ranking(student_scores: list[int], student_names: list[str]) -> list[str]:
    """Organize the student's rank, name, and grade information in ascending order.

    :param student_scores: list - of scores in descending order.
    :param student_names: list - of string names by exam score in descending order.
    :return: list - of strings in format ["<rank>. <student name>: <score>"].
    """

    ranking_strings = []
    for index, score in enumerate(student_scores):
        name = student_names[index]
        ranking_string = f"{index + 1}. {name}: {score}"
        ranking_strings.append(ranking_string)
    return ranking_strings


def perfect_score(student_info: list[list[str, int]]) -> list[str, int]:
    """Create a list that contains the name and grade of the first student to make a perfect score on the exam.

    :param student_info: list - of [<student name>, <score>] lists.
    :return: list - first `[<student name>, 100]` or `[]` if no student score of 100 is found.
    """

    perfect_student = []
    for info in student_info:
        if info[1] == 100:
            perfect_student = info
            break
    return perfect_student    
