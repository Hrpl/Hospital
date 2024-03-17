using System.Numerics;

namespace Hospital.Domain.Models;

public class Measure : Base
{
    public int MeasureTypeId { get; set; }
    public MeasureType? MessureType { get; set; } = null;
    public DateTime Date { get; set; }
    public int PatientId { get; set; }
    public Patient? Patient { get; set; } = null;
    public int DoctorId { get; set; }
    public Doctor Doctor { get; set; }
    public string Name { get; set; }
    public string Result { get; set; }
    public string Recipes { get; set; } // Todo
    public string Recommendation { get; set; }
}
