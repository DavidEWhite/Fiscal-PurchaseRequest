<cfif URL.option EQ "1">
<cfquery name="post_update" datasource="FiscalPurchase">
UPDATE Services
SET service='#FORM.service#'
WHERE recordID = #FORM.recordID#
</cfquery>
<cflocation url="services.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "2">
<cfquery name="post_delete" datasource="FiscalPurchase">
DELETE FROM services
WHERE recordID = #URL.recordID#
</cfquery>
<cflocation url="services.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "3">
<cfquery name="post_add" datasource="FiscalPurchase">
INSERT INTO Services (service)
VALUES ('#FORM.service#')
</cfquery>
<cflocation url="services.cfm" addtoken="no">
</cfif>