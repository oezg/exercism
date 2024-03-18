import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

class AppointmentScheduler {
    public LocalDateTime schedule(String appointmentDateDescription) {
        return LocalDateTime.parse(appointmentDateDescription, DateTimeFormatter.ofPattern("M/d/y k:m:s"));
    }

    public boolean hasPassed(LocalDateTime appointmentDate) {
        return LocalDateTime.now().isAfter(appointmentDate);
    }

    public boolean isAfternoonAppointment(LocalDateTime appointmentDate) {
        return appointmentDate.getHour() < 18 && 12 <= appointmentDate.getHour();
    }

    public String getDescription(LocalDateTime appointmentDate) {
        var descriptionDate = DateTimeFormatter.ofPattern("EEEE, MMMM d, y").format(appointmentDate);
        var descriptionTime = DateTimeFormatter.ofPattern("h:mm a").format(appointmentDate);
        return String.format("You have an appointment on %s, at %s.", descriptionDate, descriptionTime);
        
    }

    public LocalDate getAnniversaryDate() {
        return LocalDate.of(LocalDate.now().getYear(), 9, 15);
    }
}
