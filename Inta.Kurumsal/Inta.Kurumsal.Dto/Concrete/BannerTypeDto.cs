using Inta.Kurumsal.Dto.Abstract;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class BannerTypeDto:IDto
	{
		public BannerTypeDto()
		{
		}


		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public string Name { get; set; }
		public string? Description { get; set; }
		public int? SmallImageWidth { get; set; }
		public int? BigImageWidth { get; set; }
		public DateTime? RecordDate { get; set; }
		public bool? IsActive { get; set; }
	}
}
