using Inta.Framework.Extension.Common;

namespace Inta.Kurumsal.Entity.ComplexType
{
    public enum FormElementType
    {
        [StringValue("TextBox")]
        TextBox = 1,

        [StringValue("TextArea")]
        TextArea = 2,

        [StringValue("CheckBox")]
        CheckBox = 3,

        [StringValue("RadioButton")]
        RadioButton = 4,

        [StringValue("DropDown")]
        DropDown = 5

    }
}
