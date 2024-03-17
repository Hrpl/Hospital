namespace Hospital.Domain.Models;

public abstract class Base
{
    public int Id { get; set; }
    public DateTime CreateAt { get; set; } = DateTime.Now;
    public DateTime UpdatedAt { get; set; } = DateTime.Now;
}
