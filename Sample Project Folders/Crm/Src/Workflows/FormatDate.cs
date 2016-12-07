using System;
using System.Activities;

using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Workflow;

namespace SingleStone.Crm.Util
{
    public class FormatDate : CodeActivity
    {
        protected override void Execute(CodeActivityContext executionContext)
        {
            //Create the tracing service
            ITracingService tracingService = executionContext.GetExtension<ITracingService>();

            tracingService.Trace("Start formatting");
            string format = DateFormat.Get(executionContext);
            DateTime inputDate = DateToFormat.Get(executionContext);
            if (format != null && inputDate != null)
            {
                try
                {
                    tracingService.Trace("Format date");
                    var outputDate = inputDate.ToString(format);
                    FormattedDate.Set(executionContext, outputDate);
                }
                catch (Exception e)
                {
                    tracingService.Trace("Error formatting date: " + e.Message);
                }
            }
        }

        [RequiredArgument]
        [Input("Date To Format")]
        public InArgument<DateTime> DateToFormat { get; set; }

        [RequiredArgument]
        [Input("Date Format")]
        public InArgument<string> DateFormat { get; set; }

        [Output("Formatted Date")]
        public OutArgument<string> FormattedDate { get; set; }
    }
}
