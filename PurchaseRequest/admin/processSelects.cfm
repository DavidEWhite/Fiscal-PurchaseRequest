<!--- activity --->
<cfif URL.option EQ "1">
<cfquery name="post_update" datasource="FiscalPurchase">
UPDATE Activities
SET parties='#FORM.parties#'
WHERE recordID = #FORM.recordID#
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "12">
<cfquery name="post_delete" datasource="FiscalPurchase">
DELETE FROM Activities
WHERE recordID = #URL.recordID#
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "13">
<cfquery name="post_add" datasource="FiscalPurchase">
INSERT INTO Activities (parties)
VALUES ('#FORM.parties#')
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<!--- type of request --->
<cfif URL.option EQ "2">
<cfquery name="post_update" datasource="FiscalPurchase">
UPDATE Types
SET type='#FORM.type#'
WHERE recordID = #FORM.recordID#
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "22">
<cfquery name="post_delete" datasource="FiscalPurchase">
DELETE FROM Types
WHERE recordID = #URL.recordID#
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "23">
<cfquery name="post_add" datasource="FiscalPurchase">
INSERT INTO Types (type)
VALUES ('#FORM.type#')
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<!--- clerk --->
<cfif URL.option EQ "3">
<cfquery name="post_update" datasource="FiscalPurchase">
UPDATE Clerks
SET clerk='#FORM.clerk#'
WHERE recordID = #FORM.recordID#
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "32">
<cfquery name="post_delete" datasource="FiscalPurchase">
DELETE FROM Clerks
WHERE recordID = #URL.recordID#
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>

<cfif URL.option EQ "33">
<cfquery name="post_add" datasource="FiscalPurchase">
INSERT INTO Clerks (clerk)
VALUES ('#FORM.clerk#')
</cfquery>
<cflocation url="selects.cfm" addtoken="no">
</cfif>