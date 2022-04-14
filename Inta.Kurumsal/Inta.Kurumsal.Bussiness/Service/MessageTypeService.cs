using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class MessageTypeService : IMessageTypeService
    {
        private IMapper _mapper = null;
        private MessageTypeManager manager = null;
        public MessageTypeService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new MessageTypeManager();
        }

        public DataResult<MessageTypeDto> Delete(MessageTypeDto dto)
        {
            DataResult<MessageTypeDto> result = null;
            var entity = _mapper.Map<MessageType>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<MessageTypeDto>
            {
                Data = _mapper.Map<MessageTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<MessageTypeDto>> Find(Expression<Func<MessageType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<MessageTypeDto>> result = new DataResult<List<MessageTypeDto>>
            {
                Data = _mapper.Map<List<MessageTypeDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<MessageTypeDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<MessageTypeDto> result = new DataResult<MessageTypeDto>
            {
                Data = _mapper.Map<MessageTypeDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<MessageTypeDto> Save(MessageTypeDto dto)
        {
            DataResult<MessageTypeDto> result = null;
            var entity = _mapper.Map<MessageType>(dto);
            var data = manager.Save(entity);
            result = new DataResult<MessageTypeDto>
            {
                Data = _mapper.Map<MessageTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<MessageTypeDto> Update(MessageTypeDto dto)
        {
            DataResult<MessageTypeDto> result = null;
            var entity = _mapper.Map<MessageType>(dto);
            var data = manager.Update(entity);
            result = new DataResult<MessageTypeDto>
            {
                Data = _mapper.Map<MessageTypeDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
