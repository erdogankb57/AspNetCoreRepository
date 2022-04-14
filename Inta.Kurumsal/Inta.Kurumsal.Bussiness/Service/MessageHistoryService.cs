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
            DataResult<MessageHistoryDto> result = null;
            var entity = _mapper.Map<MessageHistory>(dto);
            var data = manager.Delete(entity);
            result = new DataResult<MessageHistoryDto>
            {
                Data = _mapper.Map<MessageHistoryDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<List<MessageHistoryDto>> Find(Expression<Func<MessageHistory, bool>> filter = null)
        {
            var data = manager.Find(filter);
            DataResult<List<MessageHistoryDto>> result = new DataResult<List<MessageHistoryDto>>
            {
                Data = _mapper.Map<List<MessageHistoryDto>>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };

            return result;
        }

        public DataResult<MessageHistoryDto> Get(Expression<Func<MessageHistory, bool>> filter = null)
        {
            throw new NotImplementedException();
        }

        public DataResult<MessageHistoryDto> GetById(int id)
        {
            var data = manager.GetById(id);
            DataResult<MessageHistoryDto> result = new DataResult<MessageHistoryDto>
            {
                Data = _mapper.Map<MessageHistoryDto>(data.Data),
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType,
                ErrorMessage = data.ErrorMessage
            };
            return result;
        }

        public DataResult<MessageHistoryDto> Save(MessageHistoryDto dto)
        {
            DataResult<MessageHistoryDto> result = null;
            var entity = _mapper.Map<MessageHistory>(dto);
            var data = manager.Save(entity);
            result = new DataResult<MessageHistoryDto>
            {
                Data = _mapper.Map<MessageHistoryDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }

        public DataResult<MessageHistoryDto> Update(MessageHistoryDto dto)
        {
            DataResult<MessageHistoryDto> result = null;
            var entity = _mapper.Map<MessageHistory>(dto);
            var data = manager.Update(entity);
            result = new DataResult<MessageHistoryDto>
            {
                Data = _mapper.Map<MessageHistoryDto>(data.Data),
                ErrorMessage = data.ErrorMessage,
                ResultMessage = data.ResultMessage,
                ResultType = data.ResultType
            };
            return result;
        }
    }
}
