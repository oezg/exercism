(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn replaceControl 
  [s]
  (str/replace s #"[\u0000-\u001F\u007F-\u009F]" "CTRL")
  )

(defn replaceSpace
  [s]
  (str/replace (str/trim s) " " "_"))

(defn kebapCase
  [s]
  
  )


(defn clean
  "Returns a clean Identifier"
  [s]
  (replaceControl (replaceSpace s))
  )


