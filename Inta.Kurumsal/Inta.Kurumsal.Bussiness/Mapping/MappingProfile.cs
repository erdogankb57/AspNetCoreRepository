using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;

namespace Inta.Kurumsal.Bussiness.Mapping
{
    public class MappingProfile : Profile
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



            CreateMap<DataResult<BannerType>, DataResult<BannerTypeDto>>();
            CreateMap<DataResult<BannerTypeDto>, DataResult<BannerType>>();
            CreateMap<DataResult<IList<BannerType>>, DataResult<List<BannerTypeDto>>>();
            CreateMap<DataResult<List<BannerTypeDto>>, DataResult<IList<BannerType>>>();


            CreateMap<DataResult<Banner>, DataResult<BannerDto>>();
            CreateMap<DataResult<BannerDto>, DataResult<Banner>>();
            CreateMap<DataResult<IList<Banner>>, DataResult<List<BannerDto>>>();
            CreateMap<DataResult<List<BannerDto>>, DataResult<IList<Banner>>>();

            CreateMap<DataResult<Category>, DataResult<CategoryDto>>();
            CreateMap<DataResult<CategoryDto>, DataResult<Category>>();
            CreateMap<DataResult<IList<Category>>, DataResult<List<CategoryDto>>>();
            CreateMap<DataResult<List<CategoryDto>>, DataResult<IList<Category>>>();

            CreateMap<DataResult<CategorySpecialty>, DataResult<CategorySpecialtyDto>>();
            CreateMap<DataResult<CategorySpecialtyDto>, DataResult<CategorySpecialty>>();
            CreateMap<DataResult<IList<CategorySpecialty>>, DataResult<List<CategorySpecialtyDto>>>();
            CreateMap<DataResult<List<CategorySpecialtyDto>>, DataResult<IList<CategorySpecialty>>>();

            CreateMap<DataResult<ContactInformation>, DataResult<ContactInformationDto>>();
            CreateMap<DataResult<ContactInformationDto>, DataResult<ContactInformation>>();
            CreateMap<DataResult<IList<ContactInformation>>, DataResult<List<ContactInformationDto>>>();
            CreateMap<DataResult<List<ContactInformationDto>>, DataResult<IList<ContactInformation>>>();

            CreateMap<DataResult<EditorTemplate>, DataResult<EditorTemplateDto>>();
            CreateMap<DataResult<EditorTemplateDto>, DataResult<EditorTemplate>>();
            CreateMap<DataResult<IList<EditorTemplate>>, DataResult<List<EditorTemplateDto>>>();
            CreateMap<DataResult<List<EditorTemplateDto>>, DataResult<IList<EditorTemplate>>>();

            CreateMap<DataResult<FirmVariables>, DataResult<FirmVariablesDto>>();
            CreateMap<DataResult<FirmVariablesDto>, DataResult<FirmVariables>>();
            CreateMap<DataResult<IList<FirmVariables>>, DataResult<List<FirmVariablesDto>>>();
            CreateMap<DataResult<List<FirmVariablesDto>>, DataResult<IList<FirmVariables>>>();

            CreateMap<DataResult<FormElement>, DataResult<FormElementDto>>();
            CreateMap<DataResult<FormElementDto>, DataResult<FormElement>>();
            CreateMap<DataResult<IList<FormElement>>, DataResult<List<FormElementDto>>>();
            CreateMap<DataResult<List<FormElementDto>>, DataResult<IList<FormElement>>>();

            CreateMap<DataResult<FormElementOptions>, DataResult<FormElementOptionsDto>>();
            CreateMap<DataResult<FormElementOptionsDto>, DataResult<FormElementOptions>>();
            CreateMap<DataResult<IList<FormElementOptions>>, DataResult<List<FormElementOptionsDto>>>();
            CreateMap<DataResult<List<FormElementOptionsDto>>, DataResult<IList<FormElementOptions>>>();

            CreateMap<DataResult<FormGroup>, DataResult<FormGroupDto>>();
            CreateMap<DataResult<FormGroupDto>, DataResult<FormGroup>>();
            CreateMap<DataResult<IList<FormGroup>>, DataResult<List<FormGroupDto>>>();
            CreateMap<DataResult<List<FormGroupDto>>, DataResult<IList<FormGroup>>>();

            CreateMap<DataResult<GeneralSettings>, DataResult<GeneralSettingsDto>>();
            CreateMap<DataResult<GeneralSettingsDto>, DataResult<GeneralSettings>>();
            CreateMap<DataResult<IList<GeneralSettings>>, DataResult<List<GeneralSettingsDto>>>();
            CreateMap<DataResult<List<GeneralSettingsDto>>, DataResult<IList<GeneralSettings>>>();

            CreateMap<DataResult<Language>, DataResult<LanguageDto>>();
            CreateMap<DataResult<LanguageDto>, DataResult<Language>>();
            CreateMap<DataResult<IList<Language>>, DataResult<List<LanguageDto>>>();
            CreateMap<DataResult<List<LanguageDto>>, DataResult<IList<Language>>>();

            CreateMap<DataResult<MessageHistory>, DataResult<MessageHistoryDto>>();
            CreateMap<DataResult<MessageHistoryDto>, DataResult<MessageHistory>>();
            CreateMap<DataResult<IList<MessageHistory>>, DataResult<List<MessageHistoryDto>>>();
            CreateMap<DataResult<List<MessageHistoryDto>>, DataResult<IList<MessageHistory>>>();

            CreateMap<DataResult<MessageType>, DataResult<MessageTypeDto>>();
            CreateMap<DataResult<MessageTypeDto>, DataResult<MessageType>>();
            CreateMap<DataResult<IList<MessageType>>, DataResult<List<MessageTypeDto>>>();
            CreateMap<DataResult<List<MessageTypeDto>>, DataResult<IList<MessageType>>>();

            CreateMap<DataResult<PageType>, DataResult<PageTypeDto>>();
            CreateMap<DataResult<PageTypeDto>, DataResult<PageType>>();
            CreateMap<DataResult<IList<PageType>>, DataResult<List<PageTypeDto>>>();
            CreateMap<DataResult<List<PageTypeDto>>, DataResult<IList<PageType>>>();

            CreateMap<DataResult<Record>, DataResult<RecordDto>>();
            CreateMap<DataResult<RecordDto>, DataResult<Record>>();
            CreateMap<DataResult<IList<Record>>, DataResult<List<RecordDto>>>();
            CreateMap<DataResult<List<RecordDto>>, DataResult<IList<Record>>>();

            CreateMap<DataResult<RecordFile>, DataResult<RecordFileDto>>();
            CreateMap<DataResult<RecordFileDto>, DataResult<RecordFile>>();
            CreateMap<DataResult<IList<RecordFile>>, DataResult<List<RecordFileDto>>>();
            CreateMap<DataResult<List<RecordFileDto>>, DataResult<IList<RecordFile>>>();

            CreateMap<DataResult<RecordImage>, DataResult<RecordImageDto>>();
            CreateMap<DataResult<RecordImageDto>, DataResult<RecordImage>>();
            CreateMap<DataResult<IList<RecordImage>>, DataResult<List<RecordImageDto>>>();
            CreateMap<DataResult<List<RecordImageDto>>, DataResult<IList<RecordImage>>>();

            CreateMap<DataResult<SEOIndex>, DataResult<SEOIndexDto>>();
            CreateMap<DataResult<SEOIndexDto>, DataResult<SEOIndex>>();
            CreateMap<DataResult<IList<SEOIndex>>, DataResult<List<SEOIndexDto>>>();
            CreateMap<DataResult<List<SEOIndexDto>>, DataResult<IList<SEOIndex>>>();

            CreateMap<DataResult<StaticText>, DataResult<StaticTextDto>>();
            CreateMap<DataResult<StaticTextDto>, DataResult<StaticText>>();
            CreateMap<DataResult<IList<StaticText>>, DataResult<List<StaticTextDto>>>();
            CreateMap<DataResult<List<StaticTextDto>>, DataResult<IList<StaticText>>>();

            CreateMap<DataResult<SystemAction>, DataResult<SystemActionDto>>();
            CreateMap<DataResult<SystemActionDto>, DataResult<SystemAction>>();
            CreateMap<DataResult<IList<SystemAction>>, DataResult<List<SystemActionDto>>>();
            CreateMap<DataResult<List<SystemActionDto>>, DataResult<IList<SystemAction>>>();
            CreateMap<DataResult<List<SystemAction>>, DataResult<List<SystemActionDto>>>();
            CreateMap<DataResult<List<SystemActionDto>>, DataResult<List<SystemAction>>>();

            CreateMap<DataResult<SystemActionRole>, DataResult<SystemActionRoleDto>>();
            CreateMap<DataResult<SystemActionRoleDto>, DataResult<SystemActionRole>>();
            CreateMap<DataResult<IList<SystemActionRole>>, DataResult<List<SystemActionRoleDto>>>();
            CreateMap<DataResult<List<SystemActionRoleDto>>, DataResult<IList<SystemActionRole>>>();

            CreateMap<DataResult<SystemMenu>, DataResult<SystemMenuDto>>();
            CreateMap<DataResult<SystemMenuDto>, DataResult<SystemMenu>>();
            CreateMap<DataResult<IList<SystemMenu>>, DataResult<List<SystemMenuDto>>>();
            CreateMap<DataResult<List<SystemMenuDto>>, DataResult<IList<SystemMenu>>>();

            CreateMap<DataResult<SystemMenuRole>, DataResult<SystemMenuRoleDto>>();
            CreateMap<DataResult<SystemMenuRoleDto>, DataResult<SystemMenuRole>>();
            CreateMap<DataResult<IList<SystemMenuRole>>, DataResult<List<SystemMenuRoleDto>>>();
            CreateMap<DataResult<List<SystemMenuRoleDto>>, DataResult<IList<SystemMenuRole>>>();

            CreateMap<DataResult<SystemRole>, DataResult<SystemRoleDto>>();
            CreateMap<DataResult<SystemRoleDto>, DataResult<SystemRole>>();
            CreateMap<DataResult<IList<SystemRole>>, DataResult<List<SystemRoleDto>>>();
            CreateMap<DataResult<List<SystemRoleDto>>, DataResult<IList<SystemRole>>>();

            CreateMap<DataResult<SystemUser>, DataResult<SystemUserDto>>();
            CreateMap<DataResult<SystemUserDto>, DataResult<SystemUser>>();
            CreateMap<DataResult<IList<SystemUser>>, DataResult<List<SystemUserDto>>>();
            CreateMap<DataResult<List<SystemUserDto>>, DataResult<IList<SystemUser>>>();
        }
    }
}
