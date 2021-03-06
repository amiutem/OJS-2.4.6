{**
 * templates/user/register.tpl
 *
 * Copyright (c) 2013-2015 Simon Fraser University Library
 * Copyright (c) 2003-2015 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 *}
{strip}
{assign var="pageTitle" value="user.register"}
{include file="common/header.tpl"}
{/strip}

<div class="user-register-form">
<form id="registerForm" method="post" action="{url op="registerUser"}" class="form-horizontal">

<p>{translate key="user.register.completeForm"}</p>

{if !$implicitAuth}
	{*{if !$existingUser}
		{url|assign:"url" page="user" op="register" existingUser=1}
		<p>{translate key="user.register.alreadyRegisteredOtherJournal" registerUrl=$url}</p>
	{else}
		{url|assign:"url" page="user" op="register"}
		<p>{translate key="user.register.notAlreadyRegisteredOtherJournal" registerUrl=$url}</p>
		<input type="hidden" name="existingUser" value="1"/>
	{/if}*}

	<h3>{translate key="user.profile"}</h3>

	{include file="common/formErrors.tpl"}

	{if $existingUser}
		<p>{translate key="user.register.loginToRegister"}</p>
	{/if}
{/if}{* !$implicitAuth *}

{if $source}
	<input type="hidden" name="source" value="{$source|escape}" />
{/if}

{if count($formLocales) > 1 && !$existingUser}
	<div class="form-group">
		<label class="col-sm-2 control-label">{fieldLabel name="formLocale" key="form.formLanguage"}</label>
		{url|assign:"userRegisterUrl" page="user" op="register" escape=false}
		{form_language_chooser form="register" url=$userRegisterUrl}
		<span class="help-block">{translate key="form.formLanguage.description"}</span>
	</div>
{/if}{* count($formLocales) > 1 && !$existingUser *}


{if !$implicitAuth}
	<div class="form-group">
		<label class="col-sm-2 control-label">{fieldLabel name="username" required="true" key="user.username"}</label>
		<div class="col-sm-6">
			<div class="input-group">
				<div class="input-group-addon"><i class="fa fa-user"></i></div>
				<input type="text" name="username" value="{$username|escape}" id="username" size="20" class="textField form-control" />				
			</div>
			{if !$existingUser}
				<span class="help-block">{translate key="user.register.usernameRestriction"}</span>
			{/if}{* !$existingUser *}
		</div>
	</div>	

	<div class="form-group">
		<label class="col-sm-2 control-label">{fieldLabel name="password" required="true" key="user.password"}</label>
		<div class="col-sm-6">
			<div class="input-group">
				<div class="input-group-addon"><i class="fa fa-key"></i></div>
				<input type="password" name="password" value="{$password|escape}" id="password" size="20" class="textField form-control" />
			</div>
		{if !$existingUser}
			<span class="help-block">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</span>
		{/if}
		</div>
	</div>

	{if !$existingUser}
	
		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="password2" required="true" key="user.repeatPassword"}</label>
			<div class="col-sm-6">
				<input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" class="textField form-control" />
			</div>
		</div>	

		<div class="control-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="salutation" key="user.salutation"}</label>
			<div class="col-sm-6">
				<input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" class="textField form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="firstName" required="true" key="user.firstName"}</label>
			<div class="col-sm-6">
				<input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" class="textField form-control" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="middleName" key="user.middleName"}</label>
			<div class="col-sm-6">
				<input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" class="textField form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="lastName" required="true" key="user.lastName"}</label>
			<div class="col-sm-6">
				<input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" class="textField form-control" />
			</div>
		</div>

		<div class="control-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="initials" key="user.initials"}</label>
			<div class="col-sm-6">
				<input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="textField form-control" />			
				<span class="help-block">{translate key="user.initialsExample"}</span>
			</div>
		</div>

		<div class="control-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="gender-m" key="user.gender"}</label>
			<div class="col-sm-6">
				<select name="gender" id="gender" size="1" class="selectMenu">
					{html_options_translate options=$genderOptions selected=$gender}
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="affiliation" key="user.affiliation"}</label>
			<div class="col-sm-6">
			<textarea id="affiliation" name="affiliation[{$formLocale|escape}]" rows="5" cols="40" class="textArea form-control">{$affiliation[$formLocale]|escape}</textarea><br/>
				<span class="help-block">{translate key="user.affiliation.description"}</span>
			</div>
		</div>

		<div class="form-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="signature" key="user.signature"}</label>
			<div class="col-sm-6"><textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="textArea form-control">{$signature[$formLocale]|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="email" required="true" key="user.email"}</label>
			<div class="col-sm-6">
				<input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="textField form-control" /> 			
				{if $privacyStatement}<span class="help-block"><a class="action" href="#privacyStatement">{translate key="user.register.privacyStatement"}</a></span>{/if}
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="confirmEmail" required="true" key="user.confirmEmail"}</label>
			<div class="col-sm-6">
				<input type="text" id="confirmEmail" name="confirmEmail" value="{$confirmEmail|escape}" size="30" maxlength="255" class="textField form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="orcid" key="user.orcid"}</label>
			<div class="col-sm-6">
				<input type="text" id="orcid" name="orcid" value="{$orcid|escape}" size="30" maxlength="255" class="textField form-control" />
				<span class="help-block">{translate key="user.orcid.description"}</span>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="userUrl" key="user.url"}</label>
			<div class="col-sm-6">
				<input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="255" class="textField form-control" />
			</div>
		</div>

		<div class="form-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="phone" key="user.phone"}</label>
			<div class="col-sm-6">
				<input type="text" name="phone" id="phone" value="{$phone|escape}" size="15"  class="textField form-control" />
			</div>
		</div>

		<div class="form-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="fax" key="user.fax"}</label>
			<div class="col-sm-6">
				<input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" class="textField form-control" />
			</div>
		</div>

		<div class="form-group" style="display:none;">
			<label class="col-sm-2 control-label">{fieldLabel name="mailingAddress" key="common.mailingAddress"}</label>
			<div class="col-sm-6">
				<textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea form-control">{$mailingAddress|escape}</textarea>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="country" key="common.country"}</label>
			<div class="col-sm-6">
				<select name="country" id="country" class="selectMenu">
					<option value=""></option>
					{html_options options=$countries selected=$country}
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="biography" key="user.biography" required="true"} {translate key="user.biography.description"}</label>
			<div class="col-sm-6">
				<input type="text" name="biography[{$formLocale|escape}]" id="biography" value="{$biography|escape}" size="30"  class="textField form-control" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel name="sendPassword" key="user.sendPassword"}</label>
			<div class="col-sm-6">
				<div class="checkbox">
					<label class="checkbox">
					<input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} /> 
					{translate key="user.sendPassword.description"}
					</label>
				</div>
			</div>
		</div>

		{if count($availableLocales) > 1}
		<div class="form-group">
		<label class="col-sm-2 control-label">{translate key="user.workingLanguages"}</label>
			<div class="col-sm-6">
				{foreach from=$availableLocales key=localeKey item=localeName}
					<label class="checkbox-inline"" for="userLocales-{$localeKey|escape}"><input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> 
					{$localeName|escape}
					</label>
				{/foreach}
			</div>
		</div>
		{/if}{* count($availableLocales) > 1 *}
		
		{if $captchaEnabled}		
				{if $reCaptchaEnabled}
				<div class="form-group">
					<label class="col-sm-2 control-label">{fieldLabel name="recaptcha_challenge_field" required="true" key="common.captchaField"}</label>
					<div class="col-sm-6">
					{$reCaptchaHtml}
					</div>
				</div>
				{else}
				<div class="form-group">
					<label class="col-sm-2 control-label">{fieldLabel name="captcha" required="true" key="common.captchaField"}</label>
					<div class="col-sm-6">
						<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
						<span class="help-block">{translate key="common.captchaField.description"}</span>
						<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField form-control" style="height:35px;"/>
						<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
					</div>
				</div>
				{/if}
		{/if}{* $captchaEnabled *}
	{/if}{* !$existingUser *}
{/if}{* !$implicitAuth *}

{if $allowRegReader || $allowRegReader === null || $allowRegAuthor || $allowRegAuthor === null || $allowRegReviewer || $allowRegReviewer === null || ($currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification)}
	<div class="form-group">
			<label class="col-sm-2 control-label">{fieldLabel suppressId="true" name="registerAs" key="user.register.registerAs"}</label>
		<div class="col-sm-6">
			{if $allowRegReader || $allowRegReader === null}	
			<label class="checkbox">			
			<input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"{if $registerAsReader} checked="checked"{/if}/>
			{translate key="user.role.reader"}: {translate key="user.register.readerDescription"}
			</label>
			{/if}
						
			{if $currentJournal && $currentJournal->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_SUBSCRIPTION && $enableOpenAccessNotification}
			<label class="checkbox">
			<input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"{if $openAccessNotification} checked="checked"{/if} />
			{translate key="user.role.reader"}: {translate key="user.register.openAccessNotificationDescription"}
			</label>
			{/if}			
			
			{if $allowRegAuthor || $allowRegAuthor === null}
			<label class="checkbox">
			<input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1"{if $registerAsAuthor} checked="checked"{/if} /> 
			{translate key="user.role.author"}: {translate key="user.register.authorDescription"}
			</label>
			{/if}
			
			{if $allowRegReviewer || $allowRegReviewer === null}
			<label class="checkbox">
			<input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"{if $registerAsReviewer} checked="checked"{/if} /> 
			{translate key="user.role.reviewer"}: {if $existingUser}{translate key="user.register.reviewerDescriptionNoInterests"}{else}{translate key="user.register.reviewerDescription"}{/if}
			</label>
			<br />
			<div id="reviewerInterestsContainer" style="margin-left:0px;">
			<label class="control-label">{translate key="user.register.reviewerInterests"}</label>
			{include file="form/interestsInput.tpl" FBV_interestsKeywords=$interestsKeywords FBV_interestsTextOnly=$interestsTextOnly}
			</div>
			{/if}
		</div>
	</div>
{/if}

<div class="separator"><hr/></div>
<p style="text-align:right;"><input type="button" value="{translate key="common.cancel"}" class="btn btn-danger btn-sm" onclick="document.location.href='{url page="index" escape=false}'" />&nbsp;&nbsp;&nbsp;<input type="submit" value="{translate key="user.register"}" class="btn btn-sm" /></p>

{if ! $implicitAuth}
	<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
{/if}{* !$implicitAuth *}

<div id="privacyStatement">
{if $privacyStatement}
	<h3>{translate key="user.register.privacyStatement"}</h3>
	<p>{$privacyStatement|nl2br}</p>
{/if}
</div>

</form>

</div>

{include file="common/footer.tpl"}

{* MODIFICADO OJS V.2.4.6 / 06-2015*}