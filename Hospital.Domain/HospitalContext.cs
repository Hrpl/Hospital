using Hospital.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace Hospital.Domain;

public class HospitalContext : DbContext
{
    public DbSet<Departament> Departaments { get; set; }
    public DbSet<Doctor> Doctors { get; set; }
    public DbSet<Hospitalization> Hospitalizations{ get; set; }
    public DbSet<Measure> Measures { get; set; }
    public DbSet<MeasureType> MeasureType { get; set; }
    public DbSet<MedicalCard> MedicalCards { get; set; }
    public DbSet<Patient> Patients { get; set; }
    public DbSet<Policy> Policies { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=Hospital2;Trusted_Connection=True;");
    }


}
