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
            var entity = _mapper.Map<MessageType>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<MessageTypeDto>>(data);
            return result;
        }

        public DataResult<List<MessageTypeDto>> Find(Expression<Func<MessageType, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<MessageTypeDto>>>(data);

            return result;
        }

        public DataResult<MessageTypeDto> Get(Expression<Func<MessageType, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<MessageTypeDto>>(data);

            return result;
        }

        public DataResult<MessageTypeDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<MessageTypeDto>>(data);
            return result;
        }

        public DataResult<MessageTypeDto> Save(MessageTypeDto dto)
        {
            var entity = _mapper.Map<MessageType>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<MessageTypeDto>>(data);
            return result;
        }

        public DataResult<MessageTypeDto> Update(MessageTypeDto dto)
        {
            var entity = _mapper.Map<MessageType>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<MessageTypeDto>>(data);
            return result;
        }
    }
}
