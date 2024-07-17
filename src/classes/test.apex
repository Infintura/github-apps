/**
 * used in the flow: ServiceNow_Incident_Creation    
 * To add new attachment or comment to ServiceNow incident
 * @author: Arjun Otturu
 * @date on prod: 05/02/2020
*/
public without sharing class AddAttachmentToServiceNowIncident {
    
    public class OutputDetails{
        
        @InvocableVariable(required=true)
        public String attachmentServiceNowId;
        
        
        public OutputDetails(string attachmentServiceNowId){
            this.attachmentServiceNowId = attachmentServiceNowId;
        }
    }
    @InvocableMethod
    public static List<OutputDetails> AddIncidentAttachment(list<string> payloadData) {
        List<OutputDetails> results = new List<OutputDetails>();
        
        JSON2ApexServiceNowAttachment objJSON2ApexServiceNowIncidentResult = CoreIntegrationService.AddAttachmentToServiceNowIncident(payloadData);
        if(objJSON2ApexServiceNowIncidentResult != null){
            results.add(new OutputDetails(objJSON2ApexServiceNowIncidentResult.result.sys_id));
        }else{
            results.add(new OutputDetails(''));
        }
        
        return results; 
        
        
    }
}
