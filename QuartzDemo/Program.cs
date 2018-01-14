using QuartzDemo.QuartzJobs;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Topshelf;

namespace QuartzDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            log4net.Config.XmlConfigurator.ConfigureAndWatch(new FileInfo(AppDomain.CurrentDomain.BaseDirectory + "log4net.config"));
            HostFactory.Run(x =>
            {
                x.UseLog4Net();

                x.Service<ServiceRunner>();

                x.SetDescription("区站接口服务描述");
                x.SetDisplayName("区站接口");
                x.SetServiceName("区站接口服务名称");

                x.EnablePauseAndContinue();
            });

            // LwJob lw = new LwJob();
            // lw.unReceiveTasks();
            // lw.taskDetail("qjc_lims_test", "10816151826820728", "TZGG", null);
        }
    }
}
