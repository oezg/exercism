(ns space-age)

(def period 
  {
    'Mercury	0.2408467
    'Venus	0.61519726
    'Earth	1.0
    'Mars	1.8808158
    'Jupiter	11.862615
    'Saturn	29.447498
    'Uranus	84.016846
    'Neptune	164.79132
  })

(def year 31557600)

(defn on-mercury
  "Returns someone's age on Mercury based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Mercury)))

(defn on-venus
  "Returns someone's age on Venus based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Venus)))

(defn on-earth
  "Returns someone's age on Earth based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Earth)))

(defn on-mars
  "Returns someone's age on Mars based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Mars)))

(defn on-jupiter
  "Returns someone's age on Jupiter based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Jupiter)))

(defn on-saturn
  "Returns someone's age on Saturn based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Saturn)))

(defn on-uranus
  "Returns someone's age on Uranus based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Uranus)))

(defn on-neptune
  "Returns someone's age on Neptune based on the given age in seconds"
  [seconds]
  (/ seconds year (period 'Neptune)))
