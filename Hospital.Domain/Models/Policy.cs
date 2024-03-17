namespace Hospital.Domain.Models;

public class Policy : Base
{
    public string Number { get; set; }
    public string Company { get; set; }
    public DateTime BeginDate { get; set; }
    public DateTime EndDate { get; set; }
    public int PatientId { get; set; }
    public Patient? Patient { get; set; } = null;
}
