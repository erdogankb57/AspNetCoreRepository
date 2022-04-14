using AutoMapper;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;

namespace Inta.Kurumsal.Bussiness.Mapping
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {
            CreateMap<BannerType, BannerTypeDto>();
            CreateMap<BannerTypeDto, BannerType>();

            CreateMap<Banner, BannerDto>();
            CreateMap<BannerDto, Banner>();

            CreateMap<Category, CategoryDto>();
            CreateMap<CategoryDto, Category>();

            CreateMap<CategorySpecialty, CategorySpecialtyDto>();
            CreateMap<CategorySpecialtyDto, CategorySpecialty>();

            CreateMap<ContactInformation, ContactInformationDto>();
            CreateMap<ContactInformationDto, ContactInformation>();

            CreateMap<EditorTemplate, EditorTemplateDto>();
            CreateMap<EditorTemplateDto, EditorTemplate>();

            CreateMap<FileUpload, FileUploadDto>();
            CreateMap<FileUploadDto, FileUpload>();

            CreateMap<FirmVariables, FirmVariablesDto>();
            CreateMap<FirmVariablesDto, FirmVariables>();

            CreateMap<FormElement, FormElementDto>();
            CreateMap<FormElementDto, FormElement>();

            CreateMap<FormElementOptions, FormElementOptionsDto>();
            CreateMap<FormElementOptionsDto, FormElementOptions>();

            CreateMap<FormGroup, FormGroupDto>();
            CreateMap<FormGroupDto, FormGroup>();

            CreateMap<GeneralSettings, GeneralSettingsDto>();
            CreateMap<GeneralSettingsDto, GeneralSettings>();

            CreateMap<Language, LanguageDto>();
            CreateMap<LanguageDto, Language>();

            CreateMap<MessageHistory, MessageHistoryDto>();
            CreateMap<MessageHistoryDto, MessageHistory>();

            CreateMap<MessageType, MessageTypeDto>();
            CreateMap<MessageTypeDto, MessageType>();

            CreateMap<PageType, PageTypeDto>();
            CreateMap<PageTypeDto, PageType>();

            CreateMap<Record, RecordDto>();
            CreateMap<RecordDto, Record>();

            CreateMap<RecordFile, RecordFileDto>();
            CreateMap<RecordFileDto, RecordFile>();

            CreateMap<RecordImage, RecordImageDto>();
            CreateMap<RecordImageDto, RecordImage>();

            CreateMap<SEOIndex, SEOIndexDto>();
            CreateMap<SEOIndexDto, SEOIndex>();

            CreateMap<StaticText, StaticTextDto>();
            CreateMap<StaticTextDto, StaticText>();

            CreateMap<SystemAction, SystemActionDto>();
            CreateMap<SystemActionDto, SystemAction>();

            CreateMap<SystemActionRole, SystemActionRoleDto>();
            CreateMap<SystemActionRoleDto, SystemActionRole>();

            CreateMap<SystemMenu, SystemMenuDto>();
            CreateMap<SystemMenuDto, SystemMenu>();

            CreateMap<SystemMenuRole, SystemMenuRoleDto>();
            CreateMap<SystemMenuRoleDto, SystemMenuRole>();

            CreateMap<SystemRole, SystemRoleDto>();
            CreateMap<SystemRoleDto, SystemRole>();

            CreateMap<SystemUser, SystemUserDto>();
            CreateMap<SystemUserDto, SystemUser>();

        }
    }
}
