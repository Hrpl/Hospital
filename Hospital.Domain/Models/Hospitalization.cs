namespace Hospital.Domain.Models;

public class Hospitalization : Base
{
    public int PatientId { get; set; }
    public Patient? Patient { get; set; } = null;
    public Guid Code { get; set; } = Guid.NewGuid();
    public DateTime BeginDate { get; set; }
    public DateTime EndDate { get; set; }
    public string Target { get; set; }
    public int DepartamentId { get; set; }
    public Departament Departament { get; set; }
    public string Condition { get; set; } = "free";
    public string Status { get; set; } = "согласие";
}
