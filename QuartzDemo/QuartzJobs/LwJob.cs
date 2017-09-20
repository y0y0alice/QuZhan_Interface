using log4net;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs
{
    public sealed class LwJob : IJob
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(LwJob));

        public void Execute(IJobExecutionContext context)
        {
            _logger.InfoFormat("来文测试");
        }
    }
}
