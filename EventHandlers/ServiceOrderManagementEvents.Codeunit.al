codeunit 50002 ServiceOrderManagementEvents
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"ServOrderManagement", 'OnBeforeCalcContractDates', '', true, true)]
    local procedure "ServOrderManagement_OnBeforeCalcContractDates"
    (
        var ServiceHeader: Record "Service Header";
        var ServiceItemLine: Record "Service Item Line";
        var IsHandled: Boolean
    )
    var
        ServiceContractLine: Record "Service Contract Line";
    begin
        if ServiceContractLine.Get(
                    ServiceContractLine."Contract Type"::Contract,
                    ServiceItemLine."Contract No.",
                    ServiceItemLine."Contract Line No.")
               then begin
            ServiceContractLine.SuspendStatusCheck(true);
            if ServiceHeader."Finishing Date" <> 0D then
                ServiceContractLine."Last Service Date" := ServiceHeader."Finishing Date"
            else
                ServiceContractLine."Last Service Date" := ServiceHeader."Posting Date";
            ServiceContractLine."Last Planned Service Date" :=
              ServiceContractLine."Next Planned Service Date";
            //ServiceContractLine.CalculateNextServiceVisit;   //iCepts 09.03.19 dxd Do not recalc Next Planned Service Date
            ServiceContractLine."Last Preventive Maint. Date" := ServiceContractLine."Last Service Date";
        end;
        ServiceContractLine.Modify();

        IsHandled := true;
    end;
}