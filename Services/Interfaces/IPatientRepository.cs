namespace Hospital.Services.Interfaces;

public interface IPatientRepository
{
    void CreatePatient(Patient p);

    IEnumerable<Patient> GetPatients();
}
