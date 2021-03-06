{**
 * topic.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2000-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Help topic.
 *
 *}
{foreach name=sections from=$topic->getSections() item=section}
	<div id="section{math equation="counter - 1" counter=$smarty.foreach.sections.iteration}">
	{if $section->getTitle()}<h4>{$section->getTitle()}</h4>{/if}
	<div>{eval var=$section->getContent()}</div>
	{if $smarty.foreach.sections.total > 1}
		{if !$smarty.foreach.sections.first}<div style="text-align:right;"><a href="#top" class="action">{translate key="common.top"}</a></div>{/if}
		{if !$smarty.foreach.sections.last}<div class="separator"></div>{/if}
	{/if}
	</div>
{/foreach}

{if $relatedTopics}
<div id="relatedTopics">
<h5>{translate key="help.relatedTopics"}</h5>
<ul>
	{foreach from=$relatedTopics item=relatedTopic}
	<li><a href="{url op="view" path=$relatedTopic.id|explode:"/"}">{$relatedTopic.title}</a></li>
	{/foreach}
</ul>
</div>
{/if}
<div id="separator"><hr/></div>
<br />
<input type="button" onclick="window.close()" value="{translate key="common.close"}" class="btn btn-danger btn-sm"/>
{* MODIFICADO OJS V.2.4.6 / 06-2015*}

