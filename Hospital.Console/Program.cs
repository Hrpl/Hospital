using Hospital.Domain;
using Hospital.Domain.SeedData;

using (var context = new HospitalContext())
{
    context.Departaments.AddRange(Seed.GetDepartements());
    try
    {
        context.SaveChanges();
        Console.WriteLine("Данные успешно загружены!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
    }
}
Console.WriteLine("Отделения созданы!");

using (var context = new HospitalContext())
{

    context.Patients.AddRange(Seed.GetPatients());
    try
    {
        context.SaveChanges();
        Console.WriteLine("Данные успешно загружены!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
    }
}
Console.WriteLine("Пациенты созданы!");

using (var context = new HospitalContext())
{
    context.Hospitalizations.AddRange(Seed.GetHospitalisations());

    try
    {
        context.SaveChanges();
        Console.WriteLine("Данные успешно загружены!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Ошибка: {ex.InnerException.Message}");
    }
}
Console.WriteLine("Записи о госпитализации пациентов созданы!");