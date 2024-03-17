namespace Hospital.Services.Repositories;

public class PatientRepository : IPatientRepository
{
    private readonly HospitalContext db;
    private readonly ILogger<PatientRepository> log;
    public PatientRepository(HospitalContext db, ILogger<PatientRepository> log)
    {
        this.db = db;
        this.log = log;
    }

    public void CreatePatient(Patient p)
    {
        this.db.Patients.Add(p);

        try
        {
            this.db.SaveChanges();
            log.LogInformation("Пациент успешно добавлен!");
        }
        catch (Exception ex)
        {
            log.LogError($"Ошибка: {ex.InnerException.Message}");
        }
    }

    public IEnumerable<Patient> GetPatients()
    {
        var pat = this.db.Patients.ToList();

        return pat;
    }
}
