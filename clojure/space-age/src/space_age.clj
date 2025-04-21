(ns space-age)

(def period 
  {
    :mercury	0.2408467
    :venus	0.61519726
    :earth	1.0
    :mars	1.8808158
    :jupiter	11.862615
    :saturn	29.447498
    :uranus	84.016846
    :neptune	164.79132
  })

(defn on-planet [planet]
  (with-meta (fn [seconds] (/ seconds 31557600 (period planet))) 
    {:doc (str "Returns someone's age on " 
               (clojure.string/capitalize (name planet)) 
               " based on the given age in seconds")}))

(def on-mercury (on-planet :mercury))
(def on-venus (on-planet :venus))
(def on-earth (on-planet :earth))
(def on-mars (on-planet :mars))
(def on-jupiter (on-planet :jupiter))
(def on-saturn (on-planet :saturn))
(def on-uranus (on-planet :uranus))
(def on-neptune (on-planet :neptune))
