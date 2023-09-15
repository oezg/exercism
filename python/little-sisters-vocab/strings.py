"""Functions for creating, transforming, and adding prefixes to strings."""


def add_prefix_un(word: str) -> str:
    """Take the given word and add the 'un' prefix.

    :param word: str - containing the root word.
    :return: str - of root word prepended with 'un'.
    """

    return ''.join(['un', word])


def make_word_groups(vocab_words: list[str]) -> str:
    """Transform a list containing a prefix and words into a string with the prefix followed by the words with prefix
    prepended.

    :param vocab_words: list - of vocabulary words with prefix in first index.
    :return: str - of prefix followed by vocabulary words with
            prefix applied.

    This function takes a `vocab_words` list and returns a string
    with the prefix and the words with prefix applied, separated
     by ' :: '.

    For example: list('en', 'close', 'joy', 'lighten'),
    produces the following string: 'en :: enclose :: enjoy :: enlighten'.
    """

    prefix = vocab_words[0]

    lst = [prefix] + [''.join([prefix, word]) for word in vocab_words[1:]]

    return ' :: '.join(lst)


def remove_suffix_ness(word: str) -> str:
    """Remove the suffix from the word while keeping spelling in mind.

    :param word: str - of word to remove suffix from.
    :return: str - of word with suffix removed & spelling adjusted.

    For example: "heaviness" becomes "heavy", but "sadness" becomes "sad".
    """

    word = remove_suffix(word, 'ness')

    if word.endswith('i'):
        word = word[:-1] + 'y'

    return word


def remove_suffix(word, suffix: str) -> str:
    """Remove the suffix from the word if exists.

    :param word: str - of word to remove suffix from.
    :param suffix: str - of suffix
    :return: str - of word with suffix removed.
    """

    return word[:-len(suffix)] if word.endswith(suffix) else word


def adjective_to_verb(sentence: str, index: int) -> str:
    """Change the adjective within the sentence to a verb.

    :param sentence: str - that uses the word in sentence.
    :param index: int - index of the word to remove and transform.
    :return: str - word that changes the extracted adjective to a verb.

    For example, ("It got dark as the sun set.", 2) becomes "darken".
    """

    return sentence.split()[index].strip('.,!"\'`:;') + 'en'
