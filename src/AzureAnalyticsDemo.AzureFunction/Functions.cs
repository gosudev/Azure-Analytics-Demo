using System;
using AzureAnalyticsDemo.AzureFunction.Core;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Newtonsoft.Json;

namespace AzureAnalyticsDemo.AzureFunction
{
    public static class Functions
    {
        [FunctionName("ComplaintProcessor")]
        public static void Run([QueueTrigger("complaintqueue", Connection = "QueueStorage")]string myQueueItem, TraceWriter log)
        {
            log.Info($"C# Queue trigger function processed: {myQueueItem}");

            var connectionString = System.Configuration.ConfigurationManager
                .ConnectionStrings["SQLConnectionString"].ConnectionString;

            var complaint = JsonConvert.DeserializeObject<Complaint>(myQueueItem);

            using (var context = new DataContext(connectionString))
            {
                context.Database.Connection.Open();
                context.Database.ExecuteSqlCommand(
                    $"INSERT INTO [dbo].[Complaint] ([Title],[WhatHappend],[Company],[SentDate])  VALUES ('{complaint.Title}','Missing hardware','IBM' ,getdate())");
                context.Database.Connection.Close();
            }

            log.Info($"Complaint inserted : {myQueueItem}");
        }
    }
}
