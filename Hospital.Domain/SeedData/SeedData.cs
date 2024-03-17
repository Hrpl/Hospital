using Bogus;
using Hospital.Domain.Models;
using System.Net;

namespace Hospital.Domain.SeedData;

public class Seed
{
    public static IEnumerable<Patient> GetPatients()
    {
        var faker = new Faker<Patient>()
            .RuleFor(p => p.Photo, f => GenerateImageAsByteArray())
            .RuleFor(p => p.Surname, f => f.Person.LastName)
            .RuleFor(p => p.Name, f => f.Person.FirstName)
            .RuleFor(p => p.Patronymic, f => f.Person.FirstName)
            .RuleFor(p => p.PassportSerial, f => f.Random.Number(1000, 9999).ToString())
            .RuleFor(p => p.PassportNumber, f => f.Random.Number(100000, 999999).ToString())
            .RuleFor(p => p.Birthday, f => f.Date.Past(50, DateTime.Now))
            .RuleFor(p => p.Gender, f => f.PickRandom<Enums.GenderEnum>())
            .RuleFor(p => p.Adress, f => f.Address.FullAddress())
            .RuleFor(p => p.PlaceOfWork, f => f.Company.CompanyName())
            .RuleFor(p => p.Phone, f => f.Phone.PhoneNumber())
            .RuleFor(p => p.Email, (f, p) => f.Internet.Email(p.Name, p.Surname))
            .RuleFor(p => p.LastVisit, f => f.Date.Recent(2))
            .RuleFor(p => p.NextVisit, f => f.Date.Future(1))
            .RuleFor(p => p.Diagnosis, f => f.Lorem.Sentence())
            .RuleFor(p => p.History, f => f.Lorem.Paragraph());

        return faker.Generate(100);
    }
    public static IEnumerable<Departament> GetDepartements()
    {
        var departaments = new List<Departament>()
        {
            new Departament(){ Name = "Кардиологическое"},
            new Departament(){ Name = "Урологическое"},
            new Departament(){ Name = "Неврологическое"}
        };

        return departaments;
    }

    public static IEnumerable<Hospitalization> SeedDataHospitalisation()
    {
        var faker = new Faker<Hospitalization>()
            .RuleFor(h => h.PatientId, t => t.Random.Number(1, 100))
            .RuleFor(h => h.Code, f => Guid.NewGuid())
            .RuleFor(h => h.BeginDate, f => f.Date.Between(DateTime.Now.AddMonths(-1), DateTime.Now))
            .RuleFor(h => h.EndDate, f => f.Date.Between(DateTime.Now.AddMonths(-1), DateTime.Now))
            .RuleFor(h => h.Target, f => f.Lorem.Word())
            .RuleFor(h => h.DepartamentId, t => t.Random.Number(1, 3))
            .RuleFor(h => h.Condition, f => f.Lorem.Word());
        return faker.Generate(100);
    }

    private static byte[] GenerateImageAsByteArray()
    {
        // Используйте Bogus для генерации URL изображения
        var imageUrl = new Faker().Person.Avatar;

        // Загрузите изображение из URL
        using var webClient = new WebClient();
        var imageBytes = webClient.DownloadData(imageUrl);
        return imageBytes;
    }

}
