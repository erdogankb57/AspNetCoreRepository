using Inta.EntityFramework.Core.Abstract;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace Inta.Kurumsal.Entity.Concrete
{
	[Table("LogMessage")]
	public class LogMessage: IEntity
	{
		public LogMessage()
		{
		}


		[Key]
		[Column("Id")]
		public int Id { get; set; }
		[Column("Message")]
		public string Message { get; set; }
		[Column("Source")]
		public string Source { get; set; }
		[Column("ErrorMessage")]
		public string ErrorMessage { get; set; }
		[Column("InnerException")]
		public string InnerException { get; set; }
		[Column("StackTrace")]
		public string StackTrace { get; set; }
		[Column("RecordDate")]
		public DateTime RecordDate { get; set; }
	}
}
