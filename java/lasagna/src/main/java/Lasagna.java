public class Lasagna {
    /**
    * Returns how many minutes the lasagna should be in the oven.
    *
    * @return      the expected oven time
    */
    public int expectedMinutesInOven() {
        return 40;
    }

    /**
    * Returns how many minutes the lasagna still has to remain in the oven, 
    * based on the expected oven time in minutes
    *
    * @param  minutesInOven  the actual minutes the lasagna has been in the oven
    * @return      remaining minutes in oven
    */
    public int remainingMinutesInOven(int minutesInOven) {
        return expectedMinutesInOven() - minutesInOven;
    }

    /**
    * Returns how many minutes you spent preparing the lasagna, assuming 
    * each layer takes you 2 minutes to prepare.
    *
    * @param  layers  the number of layers
    * @return      time it takes to prepare the lasagna
    */
    public int preparationTimeInMinutes(int layers) {
        return layers * minutesPerLayer();
    }

    /**
    * Returns how many minutes in total you've worked on cooking the lasagna.
    *
    * @param  layers  the number of layers
    * @param  minutesInOven  the actual minutes the lasagna has been in the oven
    * @return      time it takes to prepare the lasagna
    */
    public int totalTimeInMinutes(int layers, int minutesInOven) {
        return preparationTimeInMinutes(layers) + minutesInOven;
    }

    private int minutesPerLayer() {
        return 2;
    }
}