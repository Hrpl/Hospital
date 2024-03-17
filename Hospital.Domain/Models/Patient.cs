namespace Hospital.Domain.Models;

public class Patient : Base
{
    public byte[]? Photo { get; set; }
    public string Surname { get; set; }
    public string Name { get; set; }
    public string? Patronymic { get; set; }
    public string PassportSerial { get; set; }
    public string PassportNumber { get; set; }
    public DateTime Birthday { get; set; }
    public Enums.GenderEnum Gender { get; set; }
    public string Adress { get; set; }
    public string? PlaceOfWork { get; set; }
    public string? Phone { get; set; }
    public string? Email { get; set; }
    public IEnumerable<MedicalCard>? MedicalCards { get; set; } = null;
    public DateTime LastVisit { get; set; }
    public DateTime? NextVisit { get; set; }
    public IEnumerable<Policy>? Policies { get; set; } = null;
    public string Diagnosis { get; set; }
    public string History { get; set; }
    public byte[]? QrCode { get; set; }
}
