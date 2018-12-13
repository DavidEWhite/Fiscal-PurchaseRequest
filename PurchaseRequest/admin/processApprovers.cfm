<cfif URL.option EQ "1">
<cfquery name="post_director" datasource="FiscalPurchase">
UPDATE Staff
SET staff='#FORM.staff#',
email='#FORM.email#'
WHERE recordID = #FORM.recordID#
</cfquery>
<cflocation url="index.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "2">
<cfquery name="post_fiscal" datasource="FiscalPurchase">
UPDATE Staff
SET staff='#FORM.staff#',
email='#FORM.email#'
WHERE recordID = #FORM.recordID#
</cfquery>
<cflocation url="index.cfm" addtoken="no">
</cfif>