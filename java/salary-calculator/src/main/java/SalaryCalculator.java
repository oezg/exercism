public class SalaryCalculator {
    public double salaryMultiplier(int daysSkipped) {
        return daysSkipped < 5 ? 1.0 : 0.85;
    }

    public int bonusMultiplier(int productsSold) {
        return productsSold < 20 ? 10 : 13;
    }

    public double bonusForProductsSold(int productsSold) {
        return productsSold * bonusMultiplier(productsSold);
    }

    public double finalSalary(int daysSkipped, int productsSold) {
        double baseSalary = 1000.0;
        double calculatedSalary = baseSalary * salaryMultiplier(daysSkipped) + bonusForProductsSold(productsSold);
        return calculatedSalary < 2 * baseSalary ? calculatedSalary : 2 * baseSalary;
    } 
}
