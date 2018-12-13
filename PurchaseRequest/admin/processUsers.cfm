<!--- from users.cfm --->

<cfif URL.option EQ "2">
<cfquery name="post_delete" datasource="FiscalPurchase">
DELETE FROM Staff
WHERE recordID = #URL.recordID#
</cfquery>
<cflocation url="index.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "3">
<cfquery name="post_add" datasource="FiscalPurchase">
INSERT INTO Staff (staff, sLogin, user)
VALUES ('#FORM.staff#',
		'vha08\#FORM.sLogin#',
		#FORM.User#)
</cfquery>
<cflocation url="index.cfm" addtoken="no">
</cfif>