using System;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using AzureAnalyticsDemo.Contracts.Model;
using AzureAnalyticsDemo.SharepointClient;
using Microsoft.Azure;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Queue;
using Newtonsoft.Json;

namespace AzureAnalyticsDemo.WorkerRole
{
    public class WorkerRole : RoleEntryPoint
    {
        private readonly CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
        private readonly ManualResetEvent runCompleteEvent = new ManualResetEvent(false);

        public override void Run()
        {
            Trace.TraceInformation("AzureAnalyticsDemo.WorkerRole is running");

            try
            {
                this.RunAsync(this.cancellationTokenSource.Token).Wait();
            }
            finally
            {
                this.runCompleteEvent.Set();
            }
        }

        public override bool OnStart()
        {
            // Set the maximum number of concurrent connections
            ServicePointManager.DefaultConnectionLimit = 12;

            // For information on handling configuration changes
            // see the MSDN topic at https://go.microsoft.com/fwlink/?LinkId=166357.

            bool result = base.OnStart();

            Trace.TraceInformation("AzureAnalyticsDemo.WorkerRole has been started");

            return result;
        }

        public override void OnStop()
        {
            Trace.TraceInformation("AzureAnalyticsDemo.WorkerRole is stopping");

            this.cancellationTokenSource.Cancel();
            this.runCompleteEvent.WaitOne();

            base.OnStop();

            Trace.TraceInformation("AzureAnalyticsDemo.WorkerRole has stopped");
        }

        private async Task RunAsync(CancellationToken cancellationToken)
        {
            SharePointClient sharepointClient = new SharePointClient();

            // TODO: Replace the following with your own logic.
            while (!cancellationToken.IsCancellationRequested)
            {
                var complaints = await sharepointClient.GetComplaints();

                Trace.TraceInformation($"Getting {complaints.Count} complaints");

                EnQueueMessage();

                await Task.Delay(60000);
            }
        }

        private void EnQueueMessage()
        {
            // Retrieve storage account from connection string.
            CloudStorageAccount storageAccount = CloudStorageAccount.Parse(
                CloudConfigurationManager.GetSetting("StorageConnectionString"));

            // Create the queue client.
            CloudQueueClient queueClient = storageAccount.CreateCloudQueueClient();

            // Retrieve a reference to a queue.
            CloudQueue queue = queueClient.GetQueueReference("complaintqueue");

            // Create the queue if it doesn't already exist.
            queue.CreateIfNotExists();

            long number = DateTime.Now.Ticks;
            var complaint = new Complaint()
            {
                Company = $"{number} Company",
                SentDate = DateTime.Now,
                Title = $"{number} Title",
                WhatHappend = $"{number} Happend"
            };

            CloudQueueMessage message = new CloudQueueMessage(JsonConvert.SerializeObject(complaint));

            //CloudQueueMessage message = new CloudQueueMessage($"Hello, World {DateTime.Now}");

            queue.AddMessage(message);
        }
    }
}
