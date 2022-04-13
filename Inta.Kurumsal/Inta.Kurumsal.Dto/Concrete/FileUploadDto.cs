namespace Inta.Kurumsal.Dto.Concrete
{
    public class FileUploadDto
    {
        public int Id { get; set; }
        public string? FileName { get; set; }
        public string? FileBase64Data { get; set; }
        public string? Extension { get; set; }
        public DateTime RecordDate { get; set; }
        public int? Width { get; set; }
        public int? Height { get; set; }
        public string? ContentType { get; set; }
        public bool? IsImage { get; set; }

    }
}
