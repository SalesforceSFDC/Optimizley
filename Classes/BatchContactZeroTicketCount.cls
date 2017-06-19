global class BatchContactZeroTicketCount implements Database.Batchable<sObject>{
  public boolean run;
  global Database.QueryLocator start(Database.BatchableContext BC){
     Integer thisMonth = Datetime.now().month();
     if(Datetime.now().day()==1||run==true||test.isRunningTest()){
      return Database.getQueryLocator([Select c.of_ClosedZD_Tickets_This_Month__c, 
                                      c.Latest_Zendesk_Ticket__c, c.Latest_Zendesk_Ticket__r.name,
                                      c.Last_Support_Ticket_Accounting__r.Name, c.Last_Support_Ticket_Accounting__c,
                                      c.of_SA_Growth_Sessions_this_month__c, c.Last_SA_Growth_Session__c, 
                                      c.of_SOC_Growth_Sessions_this_month__c, c.Last_SOC_Growth_Session__c,
                                      c.of_Business_Review_sessions_this_month__c, c.Last_Business_Review_Session__c
                                     From Contact c]);
     }
     else{
      return Database.getQueryLocator([Select c.of_ClosedZD_Tickets_This_Month__c, 
                                      c.Latest_Zendesk_Ticket__c, c.Latest_Zendesk_Ticket__r.name,
                                      c.Last_Support_Ticket_Accounting__r.Name, c.Last_Support_Ticket_Accounting__c,
                                      c.of_SA_Growth_Sessions_this_month__c, c.Last_SA_Growth_Session__c, 
                                      c.of_SOC_Growth_Sessions_this_month__c, c.Last_SOC_Growth_Session__c,
                                      c.of_Business_Review_sessions_this_month__c, c.Last_Business_Review_Session__c
                                      From Contact c limit 0]);
     }
  }
  
  global void execute(Database.BatchableContext BC, List<Contact> scope){
    for(Contact c: scope){
      c.of_ClosedZD_Tickets_This_Month__c=0;
      c.of_Closed_Tickets_accounting__c = 0;
      c.of_SA_Growth_Sessions_this_month__c=0;
      c.of_SOC_Growth_Sessions_this_month__c=0;
      c.of_Business_Review_sessions_this_month__c=0;
    }
    update scope;
  }
  
   global void finish(Database.BatchableContext BC){
   }

}
