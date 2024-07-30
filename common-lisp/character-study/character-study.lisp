(defpackage :character-study
  (:use :cl)
  (:export
   :compare-chars
   :size-of-char
   :change-size-of-char
   :type-of-char))
(in-package :character-study)

(defun compare-chars (char1 char2)
  (cond ((char= char1 char2) :equal-to)
        ((char> char1 char2) :greater-than)
        ((char< char1 char2) :less-than)))

(defun size-of-char (char)
  (cond ((upper-case-p char) :big)
        ((lower-case-p char) :small) 
        (t :no-size)))

(defun change-size-of-char (char wanted-size)
  (case wanted-size
    (:big (char-upcase char))
    (otherwise (char-downcase char))))

(defun type-of-char (char)
  (cond
    ((alpha-char-p char) :alpha)
    ((digit-char-p char) :numeric)
    ((char= #\Space char) :space)
    ((char= #\Newline char) :newline)
    (t :unknown)))
