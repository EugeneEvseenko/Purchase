using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Purchase.Enums
{
    public enum TransactionStates
    {
        /// <summary>
        /// В обработке
        /// </summary>
        InProgress = 100,
        /// <summary>
        /// Успешно
        /// </summary>
        Success = 200,
        /// <summary>
        /// Не хватило средств
        /// </summary>
        NotEnoughFunds = 900,
        /// <summary>
        /// Счет клиента заблокирован
        /// </summary>
        CustomerAccountIsBlocked = 901,
        /// <summary>
        /// Счет партнера заблокирован
        /// </summary>
        PartnerAccountIsBlocked = 902,
        /// <summary>
        /// Прочие ошибки
        /// </summary>
        Other = 904
    }
}
