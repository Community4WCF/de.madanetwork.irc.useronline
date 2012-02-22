<div class="border titleBarPanel" id="box{$box->boxID}">
	<div class="containerHead">
		<div class="containerIcon">
    		<a href="javascript: void(0)" onclick="openList('{@$box->getStatusVariable()}', { save:true })">
				<img src="{icon}minusS.png{/icon}" id="{@$box->getStatusVariable()}Image" alt="" />
			</a>
		</div>
		<div class="containerContent">
			{if IRCUSERONLINE_CHAT_ENABLE}
			<span><a href="{IRCUSERONLINE_CHAT_LINK}">{lang}wbb.portal.box.ircuseronline.title{/lang}</a></span>
			{else}
			<span>{lang}wbb.portal.box.ircuseronline.title{/lang}</span>
			{/if}
		</div>
	</div>
	<div class="container-1" id="{@$box->getStatusVariable()}">
		<div class="containerContent">
		{if $ircUserOnline.userstotal > 0}
			{foreach from=$ircUserOnline.channels key=keys item=chan}
				<p class="smallFont"> {$chan.channel} ({$chan.users} {lang}wbb.portal.box.ircuseronline.channeluser{/lang}):</p>
				<p class="smallFont">
					{foreach from=$ircUserOnline.users item=user}
						{if $user.channel == $chan.channel}
							{counter assign=counter name=$chan.channel print=false}						
							{if $counter > 1}, {/if}<span{if $user.op} style="color:{IRCUSERONLINE_COLOR_OP}"{elseif $user.voice} style="color:{IRCUSERONLINE_COLOR_VOICE}"{/if}>{$user.nickname}</span></span>
						{/if}
					{/foreach}
				</p>
			{/foreach}
		{else}
			<p class="smallFont">
				{lang}wbb.portal.box.ircuseronline.nouser{/lang}
			</p>
		{/if}
		</div>
	</div>
</div>