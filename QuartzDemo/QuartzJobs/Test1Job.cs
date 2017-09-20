using log4net;
using Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuartzDemo.QuartzJobs
{
    public sealed class Test1Job : IJob
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(Test1Job));

        public void Execute(IJobExecutionContext context)
        {
            _logger.InfoFormat("Test1Job测试");
        }
    }
}
