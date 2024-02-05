module BookingUpForBeauty

// The following line is needed to use the DateTime type
open System

let schedule (appointmentDateDescription: string): DateTime = 
    DateTime.Parse(appointmentDateDescription)

let hasPassed (appointmentDate: DateTime): bool = 
    DateTime.Compare(appointmentDate, DateTime.Now) < 0

let isAfternoonAppointment (appointmentDate: DateTime): bool =
    appointmentDate.Hour < 18 && 12 <= appointmentDate.Hour

let description (appointmentDate: DateTime): string = 
    appointmentDate.ToString("M/d/yyyy h:mm:ss tt")
    |> sprintf "You have an appointment on %s." 

let anniversaryDate(): DateTime = 
    DateTime()

