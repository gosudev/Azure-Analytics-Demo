using System;

namespace AzureAnalyticsDemo.Contracts.Model
{
    public class Complaint
    {
        public int ComplaintId { get; set; }
        public string Title { get; set; }
        public string WhatHappend { get; set; }
        public string Company { get; set; }
        public DateTime SentDate { get; set; }
    }
}
