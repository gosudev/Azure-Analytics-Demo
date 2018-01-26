using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AzureAnalyticsDemo.SharepointClient.Model;

namespace AzureAnalyticsDemo.SharepointClient
{
    public class SharePointClient
    {
        private static IList<ComplaintItem> _result = new List<ComplaintItem>();
        public async Task<IList<ComplaintItem>> GetComplaints()
        {
            _result.Add(new ComplaintItem() { Created = DateTime.Now });

            return await Task.FromResult(_result);
        }
    }
}
