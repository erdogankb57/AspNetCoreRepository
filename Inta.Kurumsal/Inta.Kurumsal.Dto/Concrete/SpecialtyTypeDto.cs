using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class SpecialtyTypeDto : IDto
	{
		public SpecialtyTypeDto()
		{
		}

		public int Id { get; set; }
		public string Name { get; set; }
	}
}
