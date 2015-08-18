{**
 * templates/sectionEditor/submissionEventLog.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show submission event log page.
 *
 *
 *}
{strip}
{assign var="pageTitle" value="submission.eventLog"}
{include file="common/header.tpl"}
{/strip}

<div id="editor-top-menu">
	<ul class="nav nav-pills">
	<li><a href="{url op="submission" path=$submission->getId()}">{translate key="submission.summary"}</a></li>
	{if $canReview}<li><a href="{url op="submissionReview" path=$submission->getId()}">{translate key="submission.review"}</a></li>{/if}
	{if $canEdit}<li><a href="{url op="submissionEditing" path=$submission->getId()}">{translate key="submission.editing"}</a></li>{/if}
	<li class="active"><a href="{url op="submissionHistory" path=$submission->getId()}">{translate key="submission.history"}</a></li>
	<li><a href="{url op="submissionCitations" path=$submission->getId()}">{translate key="submission.citations"}</a></li>
</ul>
</div>
<hr/>
<div class="editor-top-menu">
	<ul class="nav nav-pills">
	<li class="active"><a href="{url op="submissionEventLog" path=$submission->getId()}">{translate key="submission.history.submissionEventLog"}</a></li>
	<li><a href="{url op="submissionEmailLog" path=$submission->getId()}">{translate key="submission.history.submissionEmailLog"}</a></li>
	<li><a href="{url op="submissionNotes" path=$submission->getId()}">{translate key="submission.history.submissionNotes"}</a></li>
</ul>
</div>
{include file="sectionEditor/submission/summary.tpl"}

<div class="separator"></div>

<div id="event-log-entries">
<h3>{translate key="submission.history.submissionEventLog"}</h3>
<table width="100%" class="listing">
	<tr><td class="headseparator" colspan="4">&nbsp;</td></tr>
	<tr valign="top" class="heading">
		<td width="7%">{translate key="common.date"}</td>
		<td width="25%">{translate key="common.user"}</td>
		<td>{translate key="common.event"}</td>
		<td width="56" align="right">{translate key="common.action"}</td>
	</tr>
	<tr><td class="headseparator" colspan="4">&nbsp;</td></tr>
{iterate from=eventLogEntries item=logEntry}
	<tr valign="top">
		<td>{$logEntry->getDateLogged()|date_format:$dateFormatShort}</td>
		<td>
			{assign var=emailString value=$logEntry->getUserFullName()|concat:" <":$logEntry->getUserEmail():">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$logEntry->getEventTitle()|translate articleId=$submission->getId()}
			{$logEntry->getUserFullName()|escape} {icon name="mail" url=$url}
		</td>
		<td>
			{translate key=$logEntry->getEventTitle()}
			<br />
			{$logEntry->getTranslatedMessage()|strip_tags|truncate:60:"..."|escape}
		</td>
		<td align="right"><a href="{url op="submissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="action common-preview">{translate key="common.view"}</a>{if $isEditor}&nbsp;|&nbsp;<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()|to_array:$logEntry->getId()}" class="action delete" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmDeleteLogEntry"}')">{translate key="common.delete"}</a>{/if}</td>
	</tr>
	<tr valign="top">
		<td colspan="4" class="{if $eventLogEntries->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $eventLogEntries->wasEmpty()}
	<tr valign="top">
		<td colspan="4" class="nodata">{translate key="submission.history.noLogEntries"}</td>
	</tr>
	<tr valign="top">
		<td colspan="4" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td colspan="2" align="left" class="table-results-pagination">{page_info iterator=$eventLogEntries}</td>
		<td colspan="2" align="right" class="table-results-pagination">{page_links anchor="eventLogEntries" name="eventLogEntries" iterator=$eventLogEntries}</td>
	</tr>
{/if}
</table>

{if $isEditor}
<a href="{url page="editor" op="clearSubmissionEventLog" path=$submission->getId()}" class="action delete" onclick="return confirm('{translate|escape:"jsparam" key="submission.event.confirmClearLog"}')">{translate key="submission.history.clearLog"}</a>
{/if}
</div>
{include file="common/footer.tpl"}

