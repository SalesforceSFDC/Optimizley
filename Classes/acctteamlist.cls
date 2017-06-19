public  class acctteamlist
{
    public Id opptyacctId {get;set;}
    public List<AccountTeamMember> getmembers()
    {
        List<AccountTeamMember> members;
        members = [SELECT TeamMemberRole, User.Name, AccountId FROM AccountTeamMember WHERE AccountId =: opptyacctId ORDER BY TeamMemberRole];
        return members;
    }
}
