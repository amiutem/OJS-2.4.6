{**
 * templates/rt/footer.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common footer for RT pages.
 *
 *}
<br />

{if !$omitCloseButton}
<div class="separator" style="margin-bottom:20px;"></div>
<input type="button" onclick="window.close()" value="{translate key="common.close"}" class="btn btn-danger btn-sm" />
{/if}

{call_hook name="Templates::Rt::Footer::PageFooter"}
</div>
</div>
</div>
</div>
</body>
</html>

{* MODIFICADO OJS V.2.4.6 / 06-2015*}