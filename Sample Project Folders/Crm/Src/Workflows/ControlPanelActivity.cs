using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Activities;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Workflow;

namespace SingleStone.Crm.Util
{
    public class ControlPanelActivity : CodeActivity
    {
        /// <summary>
        /// Creates a task with a subject equal to the ID of the input EntityReference
        /// </summary>
        protected override void Execute(CodeActivityContext executionContext)
        {
            IWorkflowContext context = executionContext.GetExtension<IWorkflowContext>();
            IOrganizationServiceFactory serviceFactory =
                executionContext.GetExtension<IOrganizationServiceFactory>();
            IOrganizationService service =
                serviceFactory.CreateOrganizationService(context.UserId);

            using (var svcContext = new CrmServiceContext(service))
            {
                ssc_controlpanel cp = svcContext.ssc_controlpanelSet.FirstOrDefault();
                if (cp == null)
                {
                    throw new InvalidPluginExecutionException("No Control Panel record found.  Please initialize the CSC Control Panel");
                }
                controlPanel.Set(executionContext, new EntityReference(ssc_controlpanel.EntityLogicalName, cp.Id));

            }
        }

        // Define Input/Output Arguments

        [Output("ControlPanel")]
        [ReferenceTarget("ssc_controlpanel")]
        public OutArgument<EntityReference> controlPanel { get; set; }
    }
}
