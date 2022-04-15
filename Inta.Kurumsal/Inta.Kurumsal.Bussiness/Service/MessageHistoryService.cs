using AutoMapper;
using Inta.EntityFramework.Core.Model;
using Inta.Kurumsal.Bussiness.Abstract;
using Inta.Kurumsal.DataAccess.Manager;
using Inta.Kurumsal.Dto.Concrete;
using Inta.Kurumsal.Entity.Concrete;
using System.Linq.Expressions;

namespace Inta.Kurumsal.Bussiness.Service
{
    public class MessageHistoryService : IMessageHistoryService
    {
        private IMapper _mapper = null;
        private MessageHistoryManager manager = null;
        public MessageHistoryService(IMapper mapper)
        {
            _mapper = mapper;
            manager = new MessageHistoryManager();
        }

        public DataResult<MessageHistoryDto> Delete(MessageHistoryDto dto)
        {
            var entity = _mapper.Map<MessageHistory>(dto);
            var data = manager.Delete(entity);
            var result = _mapper.Map<DataResult<MessageHistoryDto>>(data);
            return result;
        }

        public DataResult<List<MessageHistoryDto>> Find(Expression<Func<MessageHistory, bool>> filter = null)
        {
            var data = manager.Find(filter);
            var result = _mapper.Map<DataResult<List<MessageHistoryDto>>>(data);
            return result;
        }

        public DataResult<MessageHistoryDto> Get(Expression<Func<MessageHistory, bool>> filter = null)
        {
            var data = manager.Get(filter);
            var result = _mapper.Map<DataResult<MessageHistoryDto>>(data);
            return result;
        }

        public DataResult<MessageHistoryDto> GetById(int id)
        {
            var data = manager.GetById(id);
            var result = _mapper.Map<DataResult<MessageHistoryDto>>(data);
            return result;
        }

        public DataResult<MessageHistoryDto> Save(MessageHistoryDto dto)
        {
            var entity = _mapper.Map<MessageHistory>(dto);
            var data = manager.Save(entity);
            var result = _mapper.Map<DataResult<MessageHistoryDto>>(data);
            return result;
        }

        public DataResult<MessageHistoryDto> Update(MessageHistoryDto dto)
        {
            var entity = _mapper.Map<MessageHistory>(dto);
            var data = manager.Update(entity);
            var result = _mapper.Map<DataResult<MessageHistoryDto>>(data);
            return result;
        }
    }
}
