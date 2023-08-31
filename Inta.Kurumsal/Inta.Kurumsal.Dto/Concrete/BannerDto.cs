using Inta.Kurumsal.Dto.Abstract;
using System.ComponentModel.DataAnnotations;

namespace Inta.Kurumsal.Dto.Concrete
{
    public class BannerDto : IDto
	{
		public BannerDto()
		{
		}

		public int Id { get; set; }
		public int? SystemUserId { get; set; }
		public int? LanguageId { get; set; }
		public int? BannerTypeId { get; set; }
		public string Name { get; set; }
		public string? Link { get; set; }
		public int? TargetId { get; set; }
		public string? ShortExplanation { get; set; }
		public int OrderNumber { get; set; }
		public string? Image { get; set; }
		public bool IsActive { get; set; }
    }
}
